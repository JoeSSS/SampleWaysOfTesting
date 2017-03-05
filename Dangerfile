message "Jenkins build: [#{ENV['JOB_NAME']} ##{ENV['BUILD_NUMBER']}](#{ENV['BUILD_URL']})"

number_of_logs = 0
number_of_failures = 0
time = 0
tests_count = 0
logs_sorted_by_time = Dir["path_to_your_report/*.xml"].sort_by { |f| File.ctime(f) }
logs_sorted_by_time.each { |log|
  begin
    junit.parse log
    number_of_failures += junit.failures.count
    junit.headers = [:classname, :name]
    all_test = junit.tests.map(&:attributes)
    all_test.each { |a| time += a[:time].to_f}
    tests_count += junit.tests.count
    junit.report
  rescue => error
    number_of_failures += 1
    fail "#{File.basename(log)} could not be parsed. Please have a look at the console output. \n #{error}"
  ensure
    number_of_logs += 1
  end
}

message "#{tests_count} test(s) were executed. Execution took: #{(time/60).round(3)} minutes"

if number_of_logs == 0
  fail 'No test logs found. This happens when the build fails. Please have a look at the console output.'
else
  message "Found #{number_of_logs} test logs."
  message 'All tests passed! :tada:' unless number_of_failures != 0
end
