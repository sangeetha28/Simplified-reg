Cucumber::Rake::Task.new(:sauce) do |t|
  t.cucumber_opts = 'features -p sauce --format pretty --profile html -t ~@api '
end