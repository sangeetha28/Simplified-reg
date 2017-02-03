require "selenium/webdriver"

module SauceDriver
  class << self
    def sauce_endpoint
      "https://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:443/wd/hub"
    end

    def new_driver
      Selenium::WebDriver.for :remote, :url => sauce_endpoint, :desired_capabilities => caps
    end
  end
end
