# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
Rails.application.load_tasks

task :default do
  puts `rake -T`
end

desc 'Run Tests'
task :spec do
  sh 'rspec --pattern "spec/*_spec.rb" --format doc'
end

namespace :quality do
  CODE = '**/*.rb'

  desc 'Run all quality checks'
  task all: %i[rubocop reek flog]

  task :rubocop do
    sh "rubocop #{CODE}"
  end

  task :reek do
    sh "reek #{CODE}"
  end

  task :flog do
    sh "flog #{CODE}"
  end
end
