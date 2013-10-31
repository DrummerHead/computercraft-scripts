-- Requirements: 
-- Mining Turtle
-- Put torches on slot 1
--
-- Description:
-- The branch_mining function will create branch mines
-- of the specified lenght and corridor number
-- branch_mining(length, corridors)
--
-- TODO:
-- Make bot return to original position
-- to avoid resting on lava or unknown material


-- Validate arguments from console
if #arg > 2 then
  for i = 1, #arg do
    assert(type(tonumber(arg[i])) == "number", "Argument must be a number")
  end
else
  print("You must enter at least two arguments")
  print("First one: length of corridors")
  print("Second one: amount of corridors")
end


-- Digs forward 1x2 num amount
function dig(num)
  turtle.digUp()
  turtle.up()
  for i=1, num do
    while not turtle.forward() do
      turtle.dig()
      turtle.digDown()
    end
  end
  turtle.digDown()
  turtle.down()
end


-- Turns back and places torch
function place_torch()
  turtle.turnLeft()
  turtle.turnLeft()
  turtle.place()
  turtle.turnLeft()
  turtle.turnLeft()
end


-- Digs forward 1x2 num amount and places torch
-- no further apart than 12 blocks
function dig_torch(num)
  local step_torch = math.ceil(num / math.ceil(num / 12))

  turtle.digUp()
  turtle.up()

  for i=1, num do
    while not turtle.forward() do
      turtle.dig()
      turtle.digDown()
    end

    if i == 2 then
      place_torch()
    end
    if i % step_torch == 0 and i ~= num then
      place_torch()
    end
  end

  place_torch()
  turtle.digDown()
  turtle.down()
end


-- Branch mines and then digs perimeter
function branch_mining(length, corridors)
  for i=1, corridors do
    if i%2 == 0 then
      dig_torch(length)
      turtle.turnLeft()
      dig(3)
      turtle.turnLeft()
    else
      dig_torch(length)
      turtle.turnRight()
      dig(3)
      turtle.turnRight()
    end
  end

  if corridors % 2 == 0 then
    dig_torch(length)
    turtle.turnLeft()
    dig(corridors * 3)
    turtle.turnLeft()
    for j = 0, length do
      turtle.forward()
    end
    turtle.turnLeft()
    dig(corridors * 3)
  else
    dig_torch(length)
    turtle.turnRight()
    dig(corridors * 3)
    turtle.turnRight()
    for j = 0, length do
      turtle.forward()
    end
    turtle.turnRight()
    dig(corridors * 3)
  end
end


-- Execute Branch Mining
branch_mining(arg[1], arg[2])
