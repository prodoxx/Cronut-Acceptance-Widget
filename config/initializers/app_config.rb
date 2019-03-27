# frozen_string_literal: true

app_config = Rails.application.config_for :app

Rails.application.configure do
  config.app_config = ActiveSupport::OrderedOptions.new
  config.app_config.app_url = app_config['APP_URL']
end