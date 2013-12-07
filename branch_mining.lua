-- Requirements: 
-- Mining Turtle
-- Put torches on slot 1
-- Put undesired material on slot 16
--
-- Description:
-- The branch_mining function will create branch mines
-- of the specified lenght and corridor number
--
-- Provide this number as attributes from console, e.g.:
-- branch_mining.lua length corridors
--
-- The turtle will discard materials that match the one
-- on slot 16.
-- 
-- The turtle will return to the point where it started


-- Validate arguments from console
local arg = {...}

if #arg >= 2 then
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
  for i=1, num do
    while not turtle.forward() do
      turtle.dig()
    end
    turtle.digDown()
  end
end


-- Turns back and places torch
function place_torch()
  turtle.turnLeft()
  turtle.turnLeft()
  turtle.place()
  turtle.turnLeft()
  turtle.turnLeft()
end

-- Discard undesired materials
function throw_unwanted()
  for i=1, 15 do
    turtle.select(i)
    if turtle.compareTo(16) then
      turtle.dropDown()
    end
  end
  turtle.select(1)
end

-- Digs forward 1x2 num amount and places torch
-- no further apart than 12 blocks
function dig_torch(num)
  local step_torch = math.ceil(num / math.ceil(num / 12))

  for i=1, num do
    while not turtle.forward() do
      turtle.dig()
    end
    turtle.digDown()

    if i == 2 then
      place_torch()
    end
    if i % step_torch == 0 and i ~= num then
      place_torch()
    end
  end

  place_torch()
  throw_unwanted()
end


-- Branch mines and then digs perimeter
function branch_mining(length, corridors)
  turtle.digUp()
  turtle.up()

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
    turtle.down()
    for j = 1, length do
      turtle.forward()
    end
    turtle.up()
    turtle.turnLeft()
    dig(corridors * 3)
    turtle.turnLeft()
    turtle.turnLeft()
    for j = 1, corridors * 3 do
      turtle.forward()
    end
  else
    dig_torch(length)
    turtle.turnRight()
    dig(corridors * 3)
    turtle.turnRight()
    turtle.down()
    for j = 1, length do
      turtle.forward()
    end
    turtle.up()
    turtle.turnRight()
    dig(corridors * 3)
    turtle.turnLeft()
    turtle.turnLeft()
    for j = 1, corridors * 3 do
      turtle.forward()
    end
    turtle.down()
    turtle.turnLeft()
    for j = 1, length do
      turtle.forward()
    end
    turtle.up()
  end

  turtle.digDown()
  turtle.down()
end


-- Execute Branch Mining
branch_mining(tonumber(arg[1]), tonumber(arg[2]))
