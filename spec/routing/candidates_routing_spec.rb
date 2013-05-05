require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CandidatesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "candidates", :action => "index").should == "/candidates"
    end

    it "maps #new" do
      route_for(:controller => "candidates", :action => "new").should == "/candidates/new"
    end

    it "maps #show" do
      route_for(:controller => "candidates", :action => "show", :id => "1").should == "/candidates/1"
    end

    it "maps #edit" do
      route_for(:controller => "candidates", :action => "edit", :id => "1").should == "/candidates/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "candidates", :action => "create").should == {:path => "/candidates", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "candidates", :action => "update", :id => "1").should == {:path =>"/candidates/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "candidates", :action => "destroy", :id => "1").should == {:path =>"/candidates/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/candidates").should == {:controller => "candidates", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/candidates/new").should == {:controller => "candidates", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/candidates").should == {:controller => "candidates", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/candidates/1").should == {:controller => "candidates", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/candidates/1/edit").should == {:controller => "candidates", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/candidates/1").should == {:controller => "candidates", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/candidates/1").should == {:controller => "candidates", :action => "destroy", :id => "1"}
    end
  end
end
