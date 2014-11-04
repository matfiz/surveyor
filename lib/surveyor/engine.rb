require 'rails'
require 'surveyor'
require 'haml' # required for view resolution

module Surveyor
  class Engine < Rails::Engine
    root = File.expand_path('../../', __FILE__)
    config.autoload_paths << root
    config.assets.precompile += %w(surveyor_all.js surveyor_all.css)
    config.assets.paths << "#{root}/lib/assets/images"
    config.assets.paths << "#{root}/lib/assets/stylesheets"
    config.assets.paths << "#{root}/lib/assets/javascripts"
    config.to_prepare do
      Dir.glob(File.expand_path('../../../app/inputs/*_input*.rb', __FILE__)).each do |c|
        require_dependency(c)
      end
    end
  end
end
