-- Description:
-- Creates a slanted digging pattern akin to a wide stair 
-- (imagine the side of a step pyramid)
-- It's recommnded to place two alternative turtles to dig, 
-- the second at three blocks up, same position, if there's too many blocks up
--
-- The turtle will beggin digging to towards your front and to your right


function line(length)
  for i = 2, length do
    while not turtle.forward() do
      turtle.dig()
      turtle.digUp()
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
  turtle.down()
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

-- The first parameter is the length of diggin
-- Second is amount of steps
bevel(40, 10)
