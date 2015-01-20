while true
  puts("ファイルを名を入力してください")
  begin
    File.open(gets().chomp()) do |file|
      puts(file.read())
    end
    break
  rescue Errno::ENOENT
    puts("ファイル名が間違っています")
  end
end
