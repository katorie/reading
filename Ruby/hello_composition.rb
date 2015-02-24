class Hello
  def initialize(message_creator)
    @message_creator = message_creator
  end

  def hello
    puts @message_creator.create()
  end
end

class EnglishHello
  def create
    "Hello"
  end
end

class JapaneseHello
  def create
    "こんにちは"
  end
end

j = Hello.new(JapaneseHello.new())
j.hello
e = Hello.new(EnglishHello.new())
e.hello
