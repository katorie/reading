require "openssl"

def encrypt(file, pass)
  enc = OpenSSL::Cipher::AES256.new("CBC")
  enc.encrypt()
  enc.pkcs5_keyivgen(pass)
  File.open(file, "rb") do |fin|
    File.open("#{file}.sec","wb") do |fout|
      while buff = fin.read(8000)
        fout.write(enc.update(buff))
      end
      fout.write(enc.final())
    end
  end
  enc.reset()
end

if $*.length() > 0
  print("パスワード:")
  pass = $stdin.gets().chomp()
  $*.each() do |arg|
    begin
      encrypt(arg, pass)
      puts("#{arg}を暗号化したファイル#{arg}.secを作りました。")
    rescue
      puts("#{arg}の暗号化に失敗しました。")
    end
  end
  0.upto(pass.length() - 1) do |i|
    pass[i] = "\xff"
  end
end
