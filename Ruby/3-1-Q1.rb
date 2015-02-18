class Entry
  def initialize(name, phone)
    @name = name
    @phone = phone
  end
  attr_reader :name, :phone
end

def get_entry()
  while true
    puts "氏名を入力してください（空打ちで終了）"
    name = gets().chomp
    return nil if name.size == 0
    puts "電話番号を入力してください"
    phone = gets().chomp
    puts "氏名：#{name}, 番号：#{phone} を登録しますか？(Y/n)"
    ans = gets().chomp
    if ans.size ==0 || ans == "Y" || ans == "y"
      return { name: :name, phone: :phone }
    end
  end
end

directory = nil
begin
  File.open("directory.data", "rb") do |f|
    directory = Marshal.load(f)
  end
rescue
  directory = {}
end
while entry = get_entry()
  directory[entry["name"]] = entry
end
puts directory
File.open("directory.data", "wb") do |f|
  Marshal.dump(directory, f)
end
