-- Description:
-- Simple counter to know distances


local count = 1

while not turtle.detect() do
  turtle.forward()
  count = count + 1
  print(count)
end
