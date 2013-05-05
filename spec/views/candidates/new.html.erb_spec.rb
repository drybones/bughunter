require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/candidates/new.html.erb" do
  include CandidatesHelper

  before(:each) do
    assigns[:candidate] = stub_model(Candidate,
      :new_record? => true,
      :name => "value for name",
      :email => "value for email",
      :token => "value for token"
    )
  end

  it "renders new candidate form" do
    render

    response.should have_tag("form[action=?][method=post]", candidates_path) do
      with_tag("input#candidate_name[name=?]", "candidate[name]")
      with_tag("input#candidate_email[name=?]", "candidate[email]")
      with_tag("input#candidate_token[name=?]", "candidate[token]")
    end
  end
end
