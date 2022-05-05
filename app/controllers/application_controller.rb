class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  # configure_permitted_parametersメソッドが実行されるようになる。
  before_action :configure_permitted_parameters, if: :devise_controller?

  # privateは記述をしたコントローラ内でしか参照できないが、
  # protectedは呼び出された他のコントローラからも参照することが可能。
  protected

  # ユーザー登録（sign_up)の際に、ユーザー名（name）のデータ操作を許可
  # ストロングパラメータと同様の機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
