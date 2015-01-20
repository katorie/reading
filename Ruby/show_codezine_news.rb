require "open-uri"
require "rss"

old = xml = nil
begin
  File.open("codezine-news.xml", "r:uft-8") do |file|
    xml = file.read()
  end
  old = RSS::Parser.parse(xml)
rescue Errno::ENOENT
end

open("http://codezine.jp/rss/new/20/index.xml") do |http|
  xml = http.read()
end
rss = RSS::Parser.parse(xml.force_encoding("utf-8"))
if old && old.channel().pubDate() == rss.channel().pubDate()
  puts("新着情報はありません")
else
  File.open("codezine-news.xml", "w") do |file|
    file.write(xml)
  end
  old_guids = []
  if old
    old.items().each() do |item|
      old_guids << item.guid().to_s()
    end
  end
  new_items = []
  rss.items().each do |item|
    if !old_guids.include?(item.guid().to_s())
      new_items << item
    end
  end
  puts("#{rss.channel().title()}" + "#{rss.channel().pubDate().strftime("%Y/%m/%d %X")}")
  new_items.each() do |item|
    puts("------------------------------")
    puts(item.title())
    puts(item.pubDate().strftime("%Y/%m/%d %X"))
    puts(item.description().gsub(/<\/?[^>]*>/, ""))
  end
end
