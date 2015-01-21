array = %w(1 2 3 4 5)
puts "#{array}"
File.open("array_save.data", "wb") do |file|
  Marshal.dump(array, file)
end
