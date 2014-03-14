require 'spec_helper'

describe USPS do
  it "should allow setting the USPS API username" do
    USPS.username = 'melvin'
    USPS.username.should == 'melvin'
  end
  
  it "should allow setting the USPS API password" do
    USPS.password = 'mypassword'
    USPS.password.should == 'mypassword'
  end
end
