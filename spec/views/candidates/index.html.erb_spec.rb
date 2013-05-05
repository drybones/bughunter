require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/candidates/index.html.erb" do
  include CandidatesHelper

  before(:each) do
    assigns[:candidates] = [
      stub_model(Candidate,
        :name => "value for name",
        :email => "value for email",
        :token => "value for token"
      ),
      stub_model(Candidate,
        :name => "value for name",
        :email => "value for email",
        :token => "value for token"
      )
    ]
  end

  it "renders a list of candidates" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for token".to_s, 2)
  end
end
