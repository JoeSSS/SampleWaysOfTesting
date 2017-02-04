class WelcomeScreen < BasePage
  def trait
    checkButton
  end

  def checkButton
    "UIButton marked:'Check the number'"
  end

  def resultLabel
    'UIButton sibling UILabel'
  end

  def inputField
    'UITextField'
  end
end
