def sample()
  raise("これは例外のサンプル")
end

def sample2()
  raise(ArgumentError, "これは引数例外のサンプル")
end

begin
  sample()
rescue RuntimeError => e
  puts(e)
  puts("メッセージ:")
  puts(e.message())
  puts("バックトレース:")
  puts(e.backtrace())
end
puts("----------")
sample2()
