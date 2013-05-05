class UsersController < ApplicationController
  before_filter :login_required
  before_filter :admin_required, :only => [:index, :new, :create, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /signup
  def new
    unless current_user.admin?
      flash[:error] = "Users can only be created by administrators."
      redirect_to (request.env["HTTP_REFERER"] || root_path) and return
    end
    
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    
    unless @user.editable_by?(current_user)
      flash[:error] = "Users can be edited only by themselves and administrators."
      redirect_to (request.env["HTTP_REFERER"] || root_path)
    end
  end

  # POST /register
  # POST /users
  def create
    # Note this is different to the usual situation where anybody can create
    # an account.  Here, only administrators can create accounts for others;
    # and doing so does not log them out.
    unless current_user.admin?
      flash[:error] = "Users can only be created by administrators."
      redirect_to (request.env["HTTP_REFERER"] || root_path) and return
    end
    
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      redirect_to users_path
      flash[:notice] = "The account #{ERB::Util.h @user.login} has been setup for #{ERB::Util.h @user.name}."
    else
      flash.now[:error]  = "We couldn't set up that account, sorry."
      render :action => 'new'
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    unless @user.editable_by?(current_user)
      flash[:error] = "Users can be edited only by themselves and administrators."
      redirect_to (request.env["HTTP_REFERER"] || user_path(@user)) and return
    end

    # Filter out the admin parameter if the current user is not an admin
    params[:user].delete(:admin) unless current_user.admin?

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(@user)
    else
      render :action => "edit"
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])

    unless @user.destroyable_by?(current_user)
      flash[:error] = "Users can be deleted only by an administrator who is not them."
      redirect_to (request.env["HTTP_REFERER"] || user_path(@user)) and return
    end

    @user.destroy

    redirect_to users_path
  end

end
