# TODO: Documentation
class USPS::Label < Struct.new(:name, :address1, :address2, :city, :state, :zip5, :zip4, :postnet, :rdc, :postage, :zone, :insurance_fee, :carrier_route, :commitment_name, :scheduled_delivery_date)

  # Alias address getters and setters for a slightly more expressive api
  alias :address  :address1
  alias :address= :address1=
  alias :extra_address  :address2
  alias :extra_address= :address2=

  # The USPS always refers to company as firm
  #alias :firm :company
  #alias :firm= :company=

  attr_reader :error

  def initialize(options = {}, &block)
    options.each_pair do |k, v|
      self.send("#{k}=", v)
    end

    block.call(self) if block
  end

  def zip
    zip4 ? "#{zip5}-#{zip4}" : zip5.to_s
  end

  # Sets zip5 and zip4 if given a zip code in the format "99881" or "99881-1234"
  def zip=(val)
    self.zip5, self.zip4 = val.to_s.split('-')
  end

  # Check with the USPS if this address can be verified and will in missing
  # fields (such as zip code) if they are available.
  def valid?
    @error = nil
    standardize
    true
  rescue USPS::Error => e
    @error = e
    false
  end

  def standardize
    response = USPS::Request::AddressStandardization.new(self).send!
    response[self]
  end

  def standardize!
    replace(self.standardize)
  end

  # Similar to Hash#replace, overwrite the values of this object with the other.
  # It will not replace a provided key on the original object that does not exist
  # on the replacing object (such as name with verification requests).
  def replace(other)
    raise ArgumentError unless other.is_a?(USPS::Address)

    other.each_pair do |key, val|
      # Do not overwrite values that may exist on the original but not on
      # the replacement.
      self[key] = val unless val.nil?
    end

    self
  end
end
