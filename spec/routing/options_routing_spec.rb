require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OptionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "options", :action => "index").should == "/options"
    end

    it "maps #new" do
      route_for(:controller => "options", :action => "new").should == "/options/new"
    end

    it "maps #show" do
      route_for(:controller => "options", :action => "show", :id => "1").should == "/options/1"
    end

    it "maps #edit" do
      route_for(:controller => "options", :action => "edit", :id => "1").should == "/options/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "options", :action => "create").should == {:path => "/options", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "options", :action => "update", :id => "1").should == {:path =>"/options/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "options", :action => "destroy", :id => "1").should == {:path =>"/options/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/options").should == {:controller => "options", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/options/new").should == {:controller => "options", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/options").should == {:controller => "options", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/options/1").should == {:controller => "options", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/options/1/edit").should == {:controller => "options", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/options/1").should == {:controller => "options", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/options/1").should == {:controller => "options", :action => "destroy", :id => "1"}
    end
  end
end
