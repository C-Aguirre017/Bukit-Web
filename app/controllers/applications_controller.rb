class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /applications
  # GET /applications.json
  def index
    if params[:pin_id].present?
      @applications = Application.where(pin_id: params[:pin_id])
    else
      @applications = Application.all
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    @application.reached = false

    pin = Pin.find(params[:application][:pin_id])
    if pin.present? && params[:application][:user_id] == params[:user_id]
      if not pin.existeSolicitud?(params[:application][:user_id])
        respond_to do |format|
          if @application.save
            format.html { redirect_to @application, notice: 'Application was successfully created.' }
            format.json { render :show, status: :created, location: @application }
          else
            format.html { render :new }
            format.json { render json: @application.errors, status: :unprocessable_entity }
          end
        end
      else
        render :json => { :errors => 'Ya enviaste una solicitud'}
      end
    else
      render :json => { :errors => 'No existe el Pin o Información Incorrecta'}
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:pin_id, :user_id, :reached,:information)
    end
end
