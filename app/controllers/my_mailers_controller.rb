class MyMailersController < ApplicationController
  before_action :set_my_mailer, only: [:show, :edit, :update, :destroy]

  # GET /my_mailers
  # GET /my_mailers.json
  def index
    @my_mailers = MyMailer.all
  end

  # GET /my_mailers/1
  # GET /my_mailers/1.json
  def show
  end

  # GET /my_mailers/new
  def new
    @my_mailer = MyMailer.new
  end

  # GET /my_mailers/1/edit
  def edit
  end

  # POST /my_mailers
  # POST /my_mailers.json
  def create
    @my_mailer = MyMailer.new(my_mailer_params)
    respond_to do |format|
      #UserMailer.scheduled_email(@my_mailer).deliver
      if @my_mailer.save
        Delayed::Job.enqueue(ScheduleMailJob.new(@my_mailer), :run_at => @my_mailer.schedule_time)
        format.html { redirect_to @my_mailer, notice: 'My mailer was successfully created.' }
        format.json { render :show, status: :created, location: @my_mailer }
      else
        format.html { render :new }
        format.json { render json: @my_mailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_mailers/1
  # PATCH/PUT /my_mailers/1.json
  def update
    respond_to do |format|
      if @my_mailer.update(my_mailer_params)
        format.html { redirect_to @my_mailer, notice: 'My mailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_mailer }
      else
        format.html { render :edit }
        format.json { render json: @my_mailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_mailers/1
  # DELETE /my_mailers/1.json
  def destroy
    @my_mailer.destroy
    respond_to do |format|
      format.html { redirect_to my_mailers_url, notice: 'My mailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_mailer
      @my_mailer = MyMailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_mailer_params
      params.require(:my_mailer).permit(:schedule_time, :email, :subject, :body)
    end
end
