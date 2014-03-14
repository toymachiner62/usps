require 'spec_helper'

describe USPS::Request::GenerateLabel do

  it 'should be using the proper USPS api settings' do
    USPS::Request::GenerateLabel.tap do |klass|
      klass.secure.should be_false
      klass.api.should == 'TrackV4'
      klass.tag.should == 'TrackFieldRequest'
    end
  end

  it "should build a proper request" do
    request = USPS::Request::GenerateLabel.new().build
    xml = Nokogiri::XML.parse(request)
    #xml.search("DelivConfirmCertifyV4.0Request").attr('USERID').text.should == 'XXXXXX'
    #xml.search('DelivConfirmCertifyV4.0Request').attr('PASSWORD').text.should == "XXXXXX"
  end

end
