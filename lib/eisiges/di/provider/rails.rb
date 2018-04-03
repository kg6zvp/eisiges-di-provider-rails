require "eisiges/di/provider/rails/version"
require "eisiges/di/core"
require "eisiges/di/provider/default"

require 'rails'
require 'action_controller'

#Rails::VERSION::MAJOR

if Rails::VERSION::MAJOR >= 5
	module Eisiges
		module DI
			module Provider
				module Rails
					class BaseController < ::ActionController::Base
						def dispatch(name, request, response)
							Eisiges::DI::Pool.perform_injection(self, current_pool={:name => name, :request => request})
							super
						end
					end

					class APIController < ::ActionController::API
						def dispatch(name, request, response)
							Eisiges::DI::Pool.perform_injection(self, current_pool={:name => name, :request => request})
							super
						end
					end
				end
			end
		end
	end
elsif Rails::VERSION::MAJOR >= 3 #Rails 3,4
	module Eisiges
		module DI
			module Provider
				module Rails
					class BaseController < ::ActionController::Base
						def dispatch(name, request)
							Eisiges::DI::Pool.perform_injection(self, current_pool={:name => name, :request => request})
							super
						end
					end
				end
			end
		end
	end
end

