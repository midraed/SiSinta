# encoding: utf-8
class AutorizadoController < ApplicationController

  ### Autenticación con Devise
  before_filter :authenticate_usuario!

  ### Autorización con CanCan

  # Asegura que revisemos la autorización en cada acción, excepto en los
  # controladores de devise
  check_authorization unless: :devise_controller?

  # Carga y autoriza el recurso, creando las variables de instancia
  # correspondientes
  load_and_authorize_resource prepend: true

  # Recupera las excepciones por tratar de acceder a un recurso sin
  # autorización
  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = I18n.t 'unauthorized.default'
    volver
  end

end
