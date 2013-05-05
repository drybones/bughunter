class HuntController < ApplicationController
  before_filter :find_candidate
  before_filter :check_and_correct_step, :only => [:before, :during, :calculator, :after]
  
  def before
  end

  def start
    @candidate.start! if :not_started == @candidate.state
    check_and_correct_step
  end

  def during
    respond_to do |format|
      format.html # during.html.erb
    end
  end

  def after
  end

  def timer
    respond_to do |format|
      format.js do
        render "timer.js"
        # render "timer-min.js"
      end
    end
  end

  def calculator
    render :partial => "calculator"
  end

  def status
    respond_to do |format|
      format.js do
        render :json => {
          :state => @candidate.state.to_s,
          :time_remaining => render_to_string(:partial => "time_remaining")
        }
      end
    end
  end

  # GET /hunt/reset/:token
  def reset_confirm
    
  end
  
  # POST /hunt/reset/:token
  def reset
    @candidate.reset!
    flash[:notice] = "Candidate was successfully reset and will be able to redo the hunt."
    redirect_to candidates_path
  end

  private
  
  def find_candidate
    unless @candidate = Candidate.find_by_token(params[:token])
      flash[:error] = "The token #{params[:token]} does not correspond to any known candidate.  If you are copying the URL from an email, please be careful to avoid line breaks.  If you still have problems, please email careers@red-gate.com"
      redirect_to root_path
    end
  end

  def check_and_correct_step
    steps = {
      :not_started => {:name => ["before"], :path => before_hunt_path(@candidate.token)},
      :started => {:name => ["during","calculator"], :path => during_hunt_path(@candidate.token)},
      :finished=> {:name => ["after"], :path => after_hunt_path(@candidate.token)}
    }
    unless steps[@candidate.state][:name].include?(action_name)
      redirect_to steps[@candidate.state][:path]
    end
  end
end
