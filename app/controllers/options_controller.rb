class OptionsController < ApplicationController
  before_filter :login_required
  before_filter :admin_required

  # GET /options
  def index
    @options = Option.all
  end

  # GET /options/1
  def show
    @option = Option.find(params[:id])
  end

  # GET /options/1/edit
  def edit
    @option = Option.find(params[:id])
  end

  # PUT /options/1
  def update
    @option = Option.find(params[:id])

    if @option.update_attributes(params[:option])
      flash[:notice] = 'Option was successfully updated.'
      redirect_to(@option)
    else
      render :action => "edit"
    end
  end

end
