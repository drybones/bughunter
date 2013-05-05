class CandidatesController < ApplicationController
  before_filter :login_required
  
  # GET /candidates
  def index
    @candidates = Candidate.paginate :page => params[:page]

    # Load the subject into @email_subject and the Liquid template into @email_body_template
    load_options :email_subject, :email_body_template

    # Parse the Liquid template
    begin
      @email_body_renderer = Liquid::Template.parse(@email_body_template)
    rescue Liquid::SyntaxError => e
      flash.now[:error] = "ERROR: Syntax error in option email_body_template:<br/>#{e}"
    end
  end

  # GET /candidates/1
  def show
    @candidate = Candidate.find(params[:id])
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  def create
    @candidate = Candidate.new(params[:candidate])

    if @candidate.save
      flash[:notice] = 'Candidate was successfully created.'
      redirect_to candidates_path
    else
      render :action => "new"
    end
  end

  # PUT /candidates/1
  def update
    @candidate = Candidate.find(params[:id])

    if @candidate.update_attributes(params[:candidate])
      flash[:notice] = 'Candidate was successfully updated.'
      redirect_to(@candidate)
    else
      render :action => "edit"
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    redirect_to(candidates_url)
  end
  
  private
  
  def load_options(*options)
    flash.now[:error] = ""

    options.each do |option|
      if o = Option.find_by_name(option.to_s)
        instance_variable_set("@#{option}", o.value)
      else
        flash.now[:error] += "ERROR: Could not find option: #{option}<br/>"
      end
    end
  end
end
