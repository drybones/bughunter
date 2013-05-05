require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/options/show.html.erb" do
  include OptionsHelper
  before(:each) do
    assigns[:option] = @option = stub_model(Option,
      :name => "value for name",
      :value => "value for value"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ value/)
  end
end
