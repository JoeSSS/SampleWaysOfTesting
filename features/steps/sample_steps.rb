Given(/^I am on ([^\"]*)$/) do |page_name|
  wait_for_none_animating
  page = create_page_by_name(page_name)
  page.await
end

Given(/^I type "([^"]*)" in ([^\"]*)$/) do |text, element|
  wait_for_none_animating
  path = get_path element
  touch path
  keyboard_enter_text text
end

Then(/^I tap on ([^\"]*)$/) do |element|
  wait_for_none_animating
  path = get_path element
  touch path
end

Then(/^I see "([^"]*)" text$/) do |text|
  wait_for_none_animating
  raise "Element #{text} wasn't found" unless element_exists "* marked:'#{text}'"
end

Then(/^the color in ([^\"]*) is (green|red|yellow)$/) do |element, color|
  wait_for_none_animating
  path = get_path element
  current_color = query(path, :backgroundColor)

  case color
  when 'green'
    raise 'Color is incorrect' if current_color != [{ 'red' => 0, 'alpha' => 1, 'type' => 'UICachedDeviceRGBColor', 'blue' => 0, 'green' => 1 }]
  when 'yellow'
    raise 'Color is incrrect' if current_color != [{ 'red' => 1, 'alpha' => 1, 'type' => 'UICachedDeviceRGBColor', 'blue' => 0, 'green' => 1 }]
  when 'red'
    raise 'Color is incrrect' if current_color != [{ 'red' => 1, 'alpha' => 1, 'type' => 'UICachedDeviceRGBColor', 'blue' => 0, 'green' => 0 }]
  end
end
