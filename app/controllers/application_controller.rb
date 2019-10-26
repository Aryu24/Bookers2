class ApplicationController < ActionController::Base
	#↓devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、
	#その前にconfigure_permitted_parameters（下のやつ）が実行される
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		user_path(resource)
	end
	def after_sign_out_path_for(resource)
		root_path
	end

  	protected
  	#↓devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
	#今回のケースでは、ユーザ登録（sign_upとin）の際に、ユーザ名（name）のデータ操作が許可されます。
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
    	devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:email])
  	end
end
