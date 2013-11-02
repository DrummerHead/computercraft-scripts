-- Requirements: 
-- Put material to carpet with in slot 16
--
-- Description:
-- Cover a square area with the material of your choice.
-- Can be used for floating platforms or homogenizing a surface.
-- Will begin carpeting to your front and left.


local slot = 1
turtle.select(slot)

function ensure_material()
  while turtle.getItemCount(slot) <= 0 or not turtle.compareTo(16) do
    slot = slot + 1
    turtle.select(slot)
  end
end

function safe_forward(steps)
  for i = 1, steps do
    while not turtle.forward() do
      turtle.dig()
    end
  end
end

function place_line(steps)
  for i = 2, steps do
    turtle.digDown()
    ensure_material()
    turtle.placeDown()
    safe_forward(1)
  end
end

function rotate(is_left)
  if is_left then
    turtle.turnLeft()
    turtle.digDown()
    ensure_material()
    turtle.placeDown()
    safe_forward(1)
    turtle.turnLeft()
  else
    turtle.turnRight()
    turtle.digDown()
    ensure_material()
    turtle.placeDown()
    safe_forward(1)
    turtle.turnRight()
  end
end

function carpet(x_, y_)
  for i = 1, y_ do
    place_line(x_)
    rotate(true)
    place_line(x_)
    rotate(false)
  end
end

-- First parameter is distance away from you
-- Second is distance to your left
carpet(14 , 16 /2)
