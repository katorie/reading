require "digest/sha2"

$*.each do |file|
  sha = Digest::SHA256.new()
  sha.file(file)
  puts(sha.hexdigest())
end
