require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HuntController do

  #Delete these examples and add some real ones
  it "should use HuntController" do
    controller.should be_an_instance_of(HuntController)
  end


  describe "GET 'before'" do
    it "should be successful" do
      get 'before'
      response.should be_success
    end
  end

  describe "GET 'during'" do
    it "should be successful" do
      get 'during'
      response.should be_success
    end
  end

  describe "GET 'after'" do
    it "should be successful" do
      get 'after'
      response.should be_success
    end
  end
end
