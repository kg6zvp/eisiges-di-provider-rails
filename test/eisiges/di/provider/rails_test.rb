require "test_helper"

class Eisiges::DI::Provider::RailsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Eisiges::DI::Provider::Rails::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
