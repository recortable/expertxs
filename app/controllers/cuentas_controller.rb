class CuentasController < ApplicationController
	layout 'page'
  # Be sure to include AuthenticationSystem in Application Controller instead
  # If you want "remember me" functionality, add this before_filter to Application Controller
  before_filter :login_from_cookie

  def index
  end

	def login
		entrar
		flash[:notice] = 'No puedes editar nada sin haberte identificado'
		redirect_to :action => 'entrar'	
	end

  def entrar
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      flash[:notice] = "Ahora puedes editar!"
      render :action => 'index'
    end
  end

  def registrar
    return unless request.post?
    @user = User.new(params[:user])
    if @user.save
	    self.current_user = @user
	    flash[:notice] = "Te has registrado con éxito. A partir de ahora puedes editar los datos."
   	else 
	    flash[:notice] = "No te hemos podido regsitrar. Inténtalo de nuevo."
		end
    render :action => 'index'
  end
  
  def salir
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Has salido. Para poder editar tienes que entrar de nuevo"
    redirect_back_or_default(:controller => '/cuentas', :action => 'index')
  end
end
