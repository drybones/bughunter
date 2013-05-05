module OptionsHelper
  def option_description(option)
    case option.name.to_sym
    when :email_subject
      "The subject of the email created by the 'Invite' button."
    when :email_body_template
      "A template for the body of the email created by the 'Invite' button."
    end
  end
  
  def option_edit_help(option)
    case option.name.to_sym
    when :email_body_template
      render "email_body_template_edit_help"
    end
  end
end
