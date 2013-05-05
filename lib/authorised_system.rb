module AuthorisedSystem
  protected
  
  def admin_required
    unless current_user.admin?
      flash[:error] = "Only an administrator can do that."
      redirect_to (request.env["HTTP_REFERER"] || root_path) and return
    end
  end
end
