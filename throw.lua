-- Description:
-- Originally used to debug digging when there's gravel or sand
-- The turtle will go forward, start throwing gravel until it
-- reaches the turtle, and move foward


local slot = 1
turtle.select(slot)

function ensure_gravel()
  if turtle.getItemCount(slot) <= 0 then
    slot = slot + 1
    turtle.select(slot)
  end
end

function throw(length)
  for i = 1, length do
    while not turtle.detectDown() do
      ensure_gravel()
      turtle.placeDown()
    end
    turtle.forward()
  end
end


throw(10)
