class FrontPageController < ApplicationController
  def show
    redirect_to candidates_path if logged_in?
  end

end
