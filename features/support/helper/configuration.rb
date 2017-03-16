require 'yaml'

class Configuration

  def self.load (name)
    @@config = nil
    io= File.open(File.dirname(__FILE__)+"/../../../config/cucumber.yml")
    YAML::load_documents(io) { |doc| @@config = doc[name] }
    return @@config
    raise "Could not locate a configuration named \"#{name}\"" unless @@config
  end

end

