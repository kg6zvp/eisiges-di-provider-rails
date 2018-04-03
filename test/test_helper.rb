$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rails"
require "eisiges/di/provider/rails"

require "minitest/autorun"

#Create your application controller inheriting from `Eisiges::DI::Provider::Rails::BaseController` instead of `ActionController::Base`

class ApplicationController < Eisiges::DI::Provider::Rails::BaseController
	protect_from_forgery with: :exception
end

#Then just use the library in your application
class ServiceObject
	def get_time
		return Time.now.strftime("%I:%M %P")
	end
end

class WelcomeController < ApplicationController
	inject klasse: ServiceObject, as: :so

	def index
		@str = @so.get_time
	end
end

