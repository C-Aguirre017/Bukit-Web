class TokenController < ApplicationController

   def create
    fbuid = params[:fbuid]
    fbsecrettoken = params[:fbsecrettoken]

    if request.format != :json
      render :status => 406, :json => { :message => 'La consulta debe ser en formato .json' }
      return
    end

    if fbuid.nil? or fbsecrettoken.nil?
      render :status => 400, :json => { :message => 'La consulta necesita del fb id y del token secreto' }
      return
    end

    @user = User.find_by_uid(fbuid)

    if @user.nil?
      render :status => 401, :json => { :message => 'Usuario no registrado' }
      return
    end

    # Verificamos token fb valido
    if not @user.verificarFbAccessToken(fbsecrettoken)
      render :status => 401, :json => { :message => 'Token secreto invalido' }
      return
    end
    render :status => 200, :json => { :token => @user.authentication_token }

  end

  def destroy
    current_usuario.reset_authentication_token
    render :status => 200, :json => { :token => current_usuario.authentication_token }
  end

end
