def partitioning(data, pivot, left, right)
  while true
    while data[left] < pivot
      left += 1
    end
    while data[right] > pivot
      right -= 1
    end
    break if left >= right
    wk = data[left]
    data[left] = data[right]
    data[right] = wk
    left += 1
    right -= 1
  end
  return left, right
end

def qsort(data, left, right)
  return if left >= right
  pivot = data[(left + right) / 2]
  l, r = partitioning(data, pivot, left, right)
  qsort(data, left, l - 1)
  qsort(data, r + 1, right)
end

data = [2, 6, 3, 4, 5, 1, 10]
qsort(data, 0, data.size - 1)
puts("ソート結果：#{data}")
