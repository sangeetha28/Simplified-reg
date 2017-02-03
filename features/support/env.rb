require 'selenium-webdriver'
require 'sauce_whisk'
require 'Capybara/Cucumber'
require 'rspec/expectations'

ENV['ENV_ID'] ||= "shared"

require File.dirname(__FILE__) + '/../support/helper/configuration'

raise "Please set the TEST_ENV and BROWSER_OPT environment variable" unless ENV['TEST_ENV'] || ENV['BROWSER_OPT']

app_host="http://www.public.#{ENV['ENV_ID']}.qa.noths.com"

Before do |scenario|
  puts "test env is #{app_host}"
  browser_config = Configuration.load(ENV['BROWSER_OPT'])
  browser_config[:name]="#{scenario.feature.name} - #{scenario.name}"
  Capybara.app_host = app_host
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    if ENV['TEST_ENV'] == "local"
      @driver=Capybara::Selenium::Driver.new(app, :browser => :chrome)
    else
      @driver=Capybara::Selenium::Driver.new(app,
                                             :browser => :remote,
                                             :url => SauceDriver.sauce_endpoint,
                                             :desired_capabilities => browser_config)
    end
  end
end

After do |scenario|
  sessionid = ::Capybara.current_session.driver.browser.session_id
  ::Capybara.current_session.driver.quit
  jobname = "#{scenario.feature.name} - #{scenario.name}"
  puts "SauceOnDemandSessionID=#{sessionid} job-name=#{jobname}"
  @driver.quit

  if scenario.passed?
    SauceWhisk::Jobs.pass_job sessionid
  else
    SauceWhisk::Jobs.fail_job sessionid
  end
end