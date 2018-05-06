# Eisiges::DI::Provider::Rails

This is the object-level dependency injection provider for Ruby on Rails 3, 4 and 5. It is intended to be utilized simply, both with code written with the library in mind and third-party libraries.

## Installation

Add these lines to your application's Gemfile:

```ruby
source "http://gems.mccollum.enterprises"

gem 'eisiges-di-core', '~> 0.1.2'
gem 'eisiges-di-provider-default', '~> 0.1.2'
gem 'eisiges-di-provider-rails', '~> 0.1.2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install --source 'http://gems.mccollum.enterprises' eisiges-di-core
    $ gem install --source 'http://gems.mccollum.enterprises' eisiges-di-provider-default
    $ gem install --source 'http://gems.mccollum.enterprises' eisiges-di-provider-rails

## Usage

Simply inherit from the rails provider controller classes:
- `Eisiges::DI::Provider::Rails::BaseController` instead of `ActionController::Base`
- `Eisiges::DI::Provider::Rails::APIController` instead of `ActionController::Base`
(Note: For those of you struggling here, this step usually involves editing the file `app/controllers/application_controller.rb` in your rails project and modifying its parent class)

```ruby
class ApplicationController < Eisiges::DI::Provider::Rails::BaseController
	protect_from_forgery with: :exception
end
```

Here are some simplistic examples of its usage in a project:
```ruby
class TimeService
	def get_time
		return Time.now.strftime("%I:%M %P")
	end
end

class WelcomeController < ApplicationController
	inject klasse: TimeService, as: :so

	def index
		@str = @so.get_time
	end
end
```

For more detailed examples showing usage of the library, see the examples project [here](http://gitlab.mccollum.enterprises/rails-di/example)

