class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

def facebook

	@user = User.from_facebook(request.env['omniauth.auth'])

end
end