require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/options/new.html.erb" do
  include OptionsHelper

  before(:each) do
    assigns[:option] = stub_model(Option,
      :new_record? => true,
      :name => "value for name",
      :value => "value for value"
    )
  end

  it "renders new option form" do
    render

    response.should have_tag("form[action=?][method=post]", options_path) do
      with_tag("input#option_name[name=?]", "option[name]")
      with_tag("textarea#option_value[name=?]", "option[value]")
    end
  end
end
