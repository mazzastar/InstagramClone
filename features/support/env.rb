require 'cucumber/rails'
require 'capybara/poltergeist'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Capybara.server do |app, port|
  require 'rack/handler/thin'
  Rack::Handler::Thin.run(app, :Port => port)
end


Capybara.javascript_driver = :poltergeist

Cucumber::Rails::Database.javascript_strategy = :truncation

Warden.test_mode!
World Warden::Test::Helpers
World(FactoryGirl::Syntax::Methods)

After {Warden.test_reset!}

class Capybara::Session
  alias_method :old_visit, :visit

  def visit(url, status_code = (200 .. 299) )
    old_visit(url)
    raise Capybara::FileNotFound.new("Unexpected status code #{driver.status_code}" )  unless status_code.include? driver.status_code
  end
end