require 'calabash-android/management/app_installation'

apk = Dir['build/SampleWaysOfTesting.apk']

ENV['APP_PATH'] = "#{Dir.pwd}/#{apk.first}"
`calabash-android build #{ENV['APP_PATH'].gsub ' ', '\ '}`
ENV['TEST_APP_PATH'] = test_server_path(ENV['APP_PATH'])

AfterConfiguration do |_config|
  FeatureMemory.feature = nil
end

Before do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)

  feature = scenario.feature
  if FeatureMemory.feature != feature || ENV['RESET_BETWEEN_SCENARIOS'] == '1'
    if ENV['RESET_BETWEEN_SCENARIOS'] == '1'
      log 'New scenario - reinstalling apps'
    else
      log 'First scenario in feature - reinstalling apps'
    end

    ensure_app_installed
    clear_app_data
    FeatureMemory.feature = feature
    FeatureMemory.invocation = 1
  else
    FeatureMemory.invocation += 1
  end
end

FeatureMemory = Struct.new(:feature, :invocation).new
