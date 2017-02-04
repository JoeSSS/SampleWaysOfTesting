require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |_scenario|
  start_test_server_in_background
end

After do |scenario|
  screenshot_embed if scenario.failed?
  shutdown_test_server
end
