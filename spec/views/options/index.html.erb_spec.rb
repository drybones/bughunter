require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/options/index.html.erb" do
  include OptionsHelper

  before(:each) do
    assigns[:options] = [
      stub_model(Option,
        :name => "value for name",
        :value => "value for value"
      ),
      stub_model(Option,
        :name => "value for name",
        :value => "value for value"
      )
    ]
  end

  it "renders a list of options" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for value".to_s, 2)
  end
end
