def bsort(data)
  while true
    swapped = false
    for i in (0.. data.size - 2)
      if data[i] > data[i + 1]
        wk = data[i]
        data[i] = data[i + 1]
        data[i + 1] = wk
        swapped = true
      end
    end
    return if !swapped
  end
end

data = [4, 2, 6, 1, 10]
bsort(data)
puts("ソート結果： #{data}")
