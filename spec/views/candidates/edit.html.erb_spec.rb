require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/candidates/edit.html.erb" do
  include CandidatesHelper

  before(:each) do
    assigns[:candidate] = @candidate = stub_model(Candidate,
      :new_record? => false,
      :name => "value for name",
      :email => "value for email",
      :token => "value for token"
    )
  end

  it "renders the edit candidate form" do
    render

    response.should have_tag("form[action=#{candidate_path(@candidate)}][method=post]") do
      with_tag('input#candidate_name[name=?]', "candidate[name]")
      with_tag('input#candidate_email[name=?]', "candidate[email]")
      with_tag('input#candidate_token[name=?]', "candidate[token]")
    end
  end
end
