module USPS
  # Configuration options:
  #   username: Provided by the USPS during registration
  #   timeout: Connection timeout in milliseconds, nil to disable
  #   testing: Should requests be done against the testing service or not
  #            (only specific requests are supported).
  class Configuration < Struct.new(:username, :password, :timeout, :testing)
    def initialize
      self.timeout  = 5000
      self.testing  = false
      self.username = ENV['USPS_USER']
      self.password = ENV['USPS_PASS']
    end

    alias :testing? :testing
  end
end
