-- Description:
-- Creates a slanted digging pattern akin to a wide stair 
-- (imagine the side of a step pyramid)
-- It's recommnded to place two alternative turtles to dig, 
-- the second at three blocks up, same position, if there's too many blocks up
--
-- The turtle will beggin digging to towards your front and to your right


local arg = {...}

if #arg >= 2 then
  for i = 1, #arg do
    assert(type(tonumber(arg[i])) == "number", "Argument must be a number")
  end
else
  print("You must enter at least two arguments")
  print("First one: length of diggin")
  print("Second one: amount steps")
end

function line(length)
  for i = 2, length do
    turtle.digUp()
    while not turtle.forward() do
      turtle.dig()
    end
  end
end

function turn_around()
  turtle.turnLeft()
  turtle.turnLeft()
  turtle.digUp()
  turtle.up()
  turtle.digUp()
  turtle.up()
end

function change_stair()
  while not turtle.down() do
    turtle.digDown()
  end
  turtle.turnLeft()
  turtle.dig()
  turtle.forward()
  turtle.turnLeft()
end

function bevel(length, steps)
  for i = 1, steps do
    line(length)
    turn_around()
    line(length)
    change_stair()
  end
end

branch_mining(tonumber(arg[1]), tonumber(arg[2]))
