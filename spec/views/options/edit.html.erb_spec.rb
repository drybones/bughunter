require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/options/edit.html.erb" do
  include OptionsHelper

  before(:each) do
    assigns[:option] = @option = stub_model(Option,
      :new_record? => false,
      :name => "value for name",
      :value => "value for value"
    )
  end

  it "renders the edit option form" do
    render

    response.should have_tag("form[action=#{option_path(@option)}][method=post]") do
      with_tag('input#option_name[name=?]', "option[name]")
      with_tag('textarea#option_value[name=?]', "option[value]")
    end
  end
end
