class WelcomeScreen < BasePage
  def trait
    checkButton
  end

  def checkButton
    "AppCompatButton id:'button'"
  end

  def resultLabel
    "AppCompatTextView id:'textView'"
  end

  def inputField
    "AppCompatEditText id:'editText'"
  end
end
