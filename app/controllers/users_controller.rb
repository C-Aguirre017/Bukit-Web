class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  #CanCan
  skip_authorize_resource :only => :create  
  skip_authorize_resource :post, :only => :create
  
  #Avoid Authentification Token
  #skip_before_action :verify_authenticity_token, :only => [:update, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if not params['id'].nil?
      @user = User.find(params[:id])
    elsif not params['uid'].nil?
      @user = User.find_by_uid!(params[:uid])
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
 
    # Confirmamos secret token
    fbsecrettoken = params[:fbsecrettoken]
    uid = params[:uid]

    if fbsecrettoken.nil? or uid.nil?
      render :json => { :errors => 'Faltan parametros fbsecrettoken o uid'}  and return
    end

    @graph = Koala::Facebook::API.new(fbsecrettoken)
    permisos = []
    
    begin
      permisos = @graph.get_connections(uid, 'permissions')
    rescue Koala::Facebook::AuthenticationError => e
      # Token invalido
      render :json => { :errors => "Autentificacion for facebook invalida: #{ e }"}  and return
    end

    # Confirmamos que el usuario instalo la aplicacion
    if not permisos.any? { |p| p['permission'] == 'installed' }
      render :json => { :errors => 'La aplicacion no esta instalada en este usuario'}  and return
    end

    @user = User.new(user_params)
    @user.provider = 'facebook'
    @user.password = @user.password_confirmation = Devise.friendly_token

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario fue correctamente creado.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :profession, :email, :phone, :uid)
    end
end
