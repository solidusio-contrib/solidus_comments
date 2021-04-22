# frozen_string_literal: true

require 'spree/core'

module SolidusComments
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_comments'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
