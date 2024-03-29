class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /pins
  # GET /pins.json
  def index
    if params[:user_id].present?
      @pins = Pin.where(user_id: params[:user_id])
    else
      @pins = Pin.all
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  #Get /pins/buscar/:word.json
  def search
    query = params[:word]
    @pins = Pin.search(query)
    render 'pins/index'
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)
    
    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end  

  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:user_id, :publication, :realization, :duration, :title, :description, :price, :help_type, :faculty, :latitude, :longitude, :course_id)
    end
end
