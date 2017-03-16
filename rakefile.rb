require 'fileutils'
require 'cucumber/rake/task'
require 'yaml'


ENV['TEST_NO'] ||= '~@wip'

Cucumber::Rake::Task.new(:firefox_50) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=FIREFOX_50 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:firefox_51) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=FIREFOX_51 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:chrome_56) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=CHROME_56 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:chrome_55) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=CHROME_55 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:ie_11) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=IE_11 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:ie_10) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=IE_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:safari_10) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=SAFARI_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:safari_09) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=SAFARI_9 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

# Cucumber::Rake::Task.new(:iphone_6S_device) do |t,args|
#   t.cucumber_opts = "BROWSER_OPT=IPHONE_6S_9.3 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
# end
#
# Cucumber::Rake::Task.new(:iphone_6S_Simulator) do |t,args|
#   t.cucumber_opts = "BROWSER_OPT=IPHONE_6S_Simulator ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
# end





#
# Cucumber::Rake::Task.new(:ipad_6S) do |t,args|
#   t.cucumber_opts = "BROWSER_OPT=SAFARI_OSX_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
# end
#
# Cucumber::Rake::Task.new(:ipad_5S) do |t,args|
#   t.cucumber_opts = "BROWSER_OPT=SAFARI_OSX_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
# end
#
# Cucumber::Rake::Task.new(:android_) do |t,args|
#   t.cucumber_opts = "BROWSER_OPT=SAFARI_OSX_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
# end

task :before do
  FileUtils.rm_rf('screenshots')  if File.exists?('screenshots')
end

multitask :all => [:firefox_50,:firefox_51,:chrome_56,:chrome_55,:ie_10,:ie_11,:safari_09,:safari_10]

task :all => :before

Rake::Task[:all].invoke




