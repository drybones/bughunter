module CandidatesHelper
  def candidate_invitation_mail_link(candidate, email_subject, email_body_renderer)
    text = "Invite"
    subject = email_subject || "Set option: email_subject_template"
    body = email_body_renderer ?
            email_body_renderer.render("candidate" => candidate, "url" => before_hunt_url(candidate.token), "current_user" => current_user) :
            "Set option: email_body_template"
    
    link = mail_to(candidate.email, text, :subject => subject, :body => body)
    
    # Check the length of the URL (http://support.microsoft.com/kb/208427)
    if (length = link.match(/^<a href="(.+)"/)[1].length) > 2083
      flash.now[:error] = <<-ERROR
        An email 'Invite' link may not work.
        The length of the email link would be #{length} characters, which is longer than the allowable maximum of 2083.  An administrator should reduce the length of the #{link_to "email_body_template", Option.find_by_name("email_body_template")} option.  Please note that spaces, commas and new lines each count as three characters!
      ERROR
    end

    link
  end
end
