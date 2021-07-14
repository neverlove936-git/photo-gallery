# frozen_string_literal: true

source "https://rubygems.org"

gem "fastlane"

gem "danger"
gem "danger-flutter_lint"

gem "cocoapods", "1.10.0"

plugins_path = File.join(File.dirname(__FILE__), 'ios/fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
