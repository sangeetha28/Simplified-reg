require 'selenium-webdriver'
require 'sauce_whisk'
require 'Capybara/Cucumber'
require 'rspec/expectations'
require 'capybara-screenshot/cucumber'

ENV['ENV_ID'] ||= "shared"
require File.dirname(__FILE__) + '/../support/helper/configuration'
raise "Please set the TEST_ENV and BROWSER_OPT environment variable" unless ENV['ENV_ID'] || ENV['BROWSER_OPT']

APP_HOST="http://www.public.#{ENV['ENV_ID']}.qa.noths.com"
SCREENSHOT_DIR = "screenshots/#{ENV['BROWSER_OPT']}/"

FileUtils::mkdir_p SCREENSHOT_DIR  unless File.exists?(SCREENSHOT_DIR)

Before do |scenario|
  browser_config=Configuration.load(ENV['BROWSER_OPT'])
  Capybara.app_host = APP_HOST
  Capybara.default_driver = :selenium
  Capybara.save_path = "#{SCREENSHOT_DIR}"
  Capybara.register_driver :selenium do |app|
    if ENV['TEST_ENV'] == "local"
      @driver=Capybara::Selenium::Driver.new(app, :browser => :chrome)
    else
      browser_config[:name]="#{scenario.feature.name} - #{scenario.name}"
      @driver=Capybara::Selenium::Driver.new(app,
                                             :browser => :remote,
                                             :url => SauceDriver.sauce_endpoint,
                                             :desired_capabilities => browser_config)
    end
  end
end


After do |scenario|
  unless ENV['TEST_ENV']
  sessionid = ::Capybara.current_session.driver.browser.session_id
  ::Capybara.current_session.driver.quit
  jobname = "#{scenario.feature.name} - #{scenario.name}"
  if scenario.passed?
    SauceWhisk::Jobs.pass_job sessionid
  else
    SauceWhisk::Jobs.fail_job sessionid
  end
  end
  @driver.quit
end