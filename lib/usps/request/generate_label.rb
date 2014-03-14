module USPS::Request
  # Use this class to request
  # a shipping label from USPS's systems.
  #
  # Returns a USPS::Response::GenerateObject object with the pertinent
  # information
  class GenerateLabel < Base
    config(
      :api => 'TrackV4',
      :tag => 'TrackFieldRequest',
      :secure => false,
      :response => USPS::Response::GenerateLabel
    )

    # Build a new GenerateLabel request.
    # Takes the USPS tracking number to request information for
    #def initialize(track_id)
    #  @track_id = track_id
    #end

    def build
      #super do |builder|
      #  builder.tag!('TrackID', :ID => @track_id)
      #end
      super
    end

  end
end
