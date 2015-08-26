class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery :except => :create  
  #before_action :entrar

  before_filter :authenticate_user_from_token!

  def entrar
    user = User.all.first
    sign_in user, store: false
  end

  # Redirects to login for secure resources
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      flash[:error] = 'No esta autorizado para ver esta pagina'
      redirect_to '/'
    else
      flash[:error] = 'Debe ingresar primero para ver esta pagina'
      redirect_to '/'
    end
  end

  def authenticate_user_from_token!
    user_id = params[:user_id].presence
    user    = user_id && User.find(user_id)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user
      if Devise.secure_compare(user.authentication_token, params[:user_token])
        sign_in user, store: false
      else
        flash[:error] = 'Token de autentificacion invalido'
      end
    end

    #if not user_signed_in?
     # respond_to do |format|
      #  format.html {}
       # format.json {  render :status => 401, :json => { :message => 'No estas Ingresado' } }
      #end
    #end
  end

  def authentificate_user_with_token_POST(id,token)
    user_id = id.presence
    user    = user_id && User.find(user_id)
    if user
      if Devise.secure_compare(user.authentication_token, token)
        return true
      else
        return false
      end
    else
      return false
    end
  end

end
