-- Requirements: 
-- Put enough material from slot 1 onwards
-- Put desired material in slot 16
--
-- Description:
-- Will square an area with a 2 height wall of material
-- To your front and to your right
-- Originally for animal fences but can be used with other materials


local slot = 1
turtle.select(slot)

turtle.up()

function ensure_material()
  while turtle.getItemCount(slot) <= 0 or not turtle.compareTo(16) do
    slot = slot + 1
    turtle.select(slot)
  end
end

function output_needs(x_, y_)
  local fence_amount = (((x_ - 1) * 2) + ((y_ - 1) * 2)) * 2
  local stacks = math.ceil(fence_amount / 64)
  print("you need " .. fence_amount .. " fences")
  print("that is at least " .. stacks .. " 64 fences stack")
end

function fence_line(length)
  for i = 2, length do
    ensure_material()
    turtle.placeDown()
    turtle.up()
    ensure_material()
    turtle.placeDown()
    turtle.forward()
    turtle.down()
  end
end

function fence(x_, y_)
  output_needs(x_, y_)

  fence_line(x_)
  turtle.turnLeft()

  fence_line(y_)
  turtle.turnLeft()

  fence_line(x_)
  turtle.turnLeft()

  fence_line(y_)
end


-- First parameter is towards your front
-- Second towards your right
fence(4, 5)
