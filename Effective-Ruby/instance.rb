class MyClass
  @@class_var = 'クラス変数'
  @class_instance_var = 'クラスインスタンス変数'

  def self.class_var
    @@class_var
  end

  def self.class_instance_var
    @class_instance_var
  end

  def instance_var
    @instance_var = 'インスタンス変数'
  end
end

class Derived<MyClass; end

puts "MyClass.class_var：#{MyClass.class_var}"
puts "MyClass.class_instance_var：#{MyClass.class_instance_var}"
puts "MyClass.new.instance_var：#{MyClass.new.instance_var}"

puts "Derived.class_var:#{Derived.class_var}"
puts "Derived.class_instance:#{Derived.class_instance}"
