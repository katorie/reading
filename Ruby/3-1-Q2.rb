class Student
  def initialize(name, nl, ma, en)
    @name = name
    @result = nl + ma + en
  end
  def evaluate(avg, rank)
    if avg < @result
      level = 0
    elsif avg > @result
      level = 2
    else
      level = 1
    end
    puts "#{@name}は#{rank[level]}です"
  end
  attr_reader :result
end

students = []
[["A", 80, 70, 40], ["B", 50, 30, 80], ["C", 10, 20, 30], ["D", 80, 40, 90], ["E", 40, 60,50]].each do |nm, nl, ma, en|
  students << Student.new(nm, nl, ma, en)
end

average = 0
students.each do |e|
  average += e.result
end
average /= students.size
students.each do |e|
  e.evaluate(average, ["平均より上", "平均", "平均より下"])
end  
