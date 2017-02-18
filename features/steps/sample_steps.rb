Given(/^I am on ([^\"]*)$/) do |page_name|
  wait_animation
  page = create_page_by_name(page_name)
  page.await(timeout: 1)
end

Given(/^I type "([^"]*)" in ([^\"]*)$/) do |text, element|
  wait_animation
  path = get_path element
  touch path
  keyboard_enter_text text
end

Then(/^I tap on ([^\"]*)$/) do |element|
  wait_animation
  path = get_path element
  touch path
end

Then(/^I see "([^"]*)" text$/) do |text|
  wait_animation
  raise "Element #{text} wasn't found" unless element_exists "* marked:'#{text}'"
end

Then(/^the color in ([^\"]*) is (green|red|yellow)$/) do |element, color|
  wait_animation
  path = get_path element

  if ENV['PLATFORM'] == 'ios'
    current_color = query(path, :backgroundColor)
    red = [{ 'red' => 1, 'alpha' => 1, 'type' => 'UICachedDeviceRGBColor', 'blue' => 0, 'green' => 0 }]
    green = [{ 'red' => 0, 'alpha' => 1, 'type' => 'UICachedDeviceRGBColor', 'blue' => 0, 'green' => 1 }]
    yellow = [{ 'red' => 1, 'alpha' => 1, 'type' => 'UICachedDeviceRGBColor', 'blue' => 0, 'green' => 1 }]
  elsif ENV['PLATFORM'] == 'android'
    current_color = query(path, :getBackground, :getColor)
    red = [-65_536]
    green = [-16_711_936]
    yellow = [-256]
  end

  case color
  when 'green'
    raise 'Color is incorrect' if current_color != green
  when 'yellow'
    raise 'Color is incrrect' if current_color != yellow
  when 'red'
    raise 'Color is incrrect' if current_color != red
  end
end

Then(/^I change the color to be "([^"]*)"$/) do |color|
  backdoor('changeColor', color)
end
