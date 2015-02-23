class Hello
  def say(count)
    puts ([hello()] * count).join("*")
  end

  def hello()
    "hello"
  end
end

class OnlyOnceHello < Hello
  def say(count)
    super(1)
  end

  def hello()
    "only-once-hello"
  end
end

class DoubleHello < Hello
  def say(count)
    super(count * 2)
  end

  def hello()
    "double-hello"
  end
end

class ThroughHello < Hello
  def say(count)
    super
  end

  def hello()
    "through-hello"
  end
end

[Hello, OnlyOnceHello, DoubleHello, ThroughHello].each() do |e|
  obj = e.new()
  obj.say(2)
end
