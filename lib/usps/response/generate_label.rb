module USPS::Response
  # Response object from a USPS::Request::GenerateLabel request. 
  # Includes the details of label as well as the base64 encoded image of the label
  class GenerateLabel < Base

    attr_accessor :details

    def initialize(xml)
       #@summary = parse(xml.search("TrackSummary"))
       #@details = []
       #xml.search("TrackDetail").each do |detail|
	       #@details << parse()
	     @details = USPS::Label.new(
         :name => xml.search('ToName').text,
         :address1 => xml.search('ToAddress1').text,
         :address2 => xml.search('ToAddress2').text,
         :city => xml.search('ToCity').text,
         :state => xml.search('ToState').text,
         :zip5 => xml.search('ToZip5').text,
         :zip4 => xml.search('ToZip4').text,
         :postnet => xml.search('Postnet').text,
         :rdc => xml.search('RDC').text,
         :postage => xml.search('Postage').text,
         :zone => xml.search('Zone').text,
         :insurance_fee => xml.search('InsuranceFee').text,
         :carrier_route => xml.search('CarrierRoute').text,
         :commitment_name => xml.search('CommitmentName').text,
         :scheduled_delivery_date => xml.search('ScheduledDeliveryDate').text
       )
       #end
     end
     
     #private
     #def parse(node)
     #def parse()
     #  USPS::TrackDetail.new(
     #    :name => node.search('ToName').text,
     #    :address1 => node.search('ToAddress1').text,
     #    :address2 => node.search('ToAddress2').text,
     #    :city => node.search('ToCity').text,
     #    :state => node.search('ToState').text,
     #    :zip5 => node.search('ToZip5').text,
     #    :zip4 => node.search('ToZip4').text,
     #    :postnet => node.search('Postnet').text,
     #    :rdc => node.search('RDC').text,
     #    :postage => node.search('Postage').text,
     #    :zone => node.search('Zone').text,
     #    :insurance_fee => node.search('InsuranceFee').text,
     #    :carrier_route => node.search('CarrierRoute').text,
     #    :commitment_name => node.search('CommitmentName').text,
     #    :scheduled_delivery_date => node.search('ScheduledDeliveryDate').text
     #  )
     #end
  end
end
