require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/candidates/show.html.erb" do
  include CandidatesHelper
  before(:each) do
    assigns[:candidate] = @candidate = stub_model(Candidate,
      :name => "value for name",
      :email => "value for email",
      :token => "value for token"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ token/)
  end
end
