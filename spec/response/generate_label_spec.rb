require 'spec_helper'

describe USPS::Response::GenerateLabel do

  it "should handle test response" do
    response = USPS::Response::GenerateLabel.new(load_xml("generate_label_response.xml"))
    response.should be_a_kind_of(USPS::Response::GenerateLabel)
    
    #response.summary.event.should == "DELIVERED"
    response.details.city.should == "WASHINGTON"
    response.details.state.should == 'DC'
    #response.summary.date.to_s.should == '2001-05-21 12:12:00 -0500'
    #response.summary.event_time.should == "12:12 pm"
    #response.summary.event_date.should == "May 21, 2001"
    #response.summary.event_state.should == "IA"
    #response.summary.event_zip_code.should == "50208"
    #response.summary.name.should == ""
    #response.summary.firm_name.should == ""
    response.details.scheduled_delivery_date.should == "2013-07-26"
        
    #response.details.length.should == 2
    #response.details[0].event.should == "ENROUTE"
    #response.details[1].event.should == "ACCEPTANCE"
  end
  
  #it "should handle no detail records" do
  # response = USPS::Response::TrackingFieldLookup.new(load_xml("tracking_field_lookup_2.xml"))
  #  response.details.length.should == 0  
  #end
end
