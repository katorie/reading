array = nil
File.open("array_save.data", "rb") do |file|
  array = Marshal.load(file)
end
puts "#{array}"
