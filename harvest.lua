-- Requirements: 
-- Put seeds on slot 1
--
-- Description:
-- Takes care of harvesting and seeding
-- It works with 2 by {{length}} structures separated by 1 water
--
-- XX XX XX  \
-- XX XX XX  |
-- XX XX XX  |
-- XX XX XX  | Height (first parameter)
-- XX XX XX  |
-- XX XX XX  |
-- XX XX XX  /
-- \______/
--
--   Fields (second parameter)
-- 
--
-- The Xs will be harvested and replanted


function harvest_line(length)
  for i = 2, length do
    turtle.digDown()
    turtle.placeDown()
    turtle.forward()
  end
end

function turn_left()
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft()
  turtle.forward()
  turtle.turnLeft()
end

function pass_water()
  turtle.digDown()
  turtle.placeDown()
  turtle.turnRight()
  turtle.forward()
  turtle.forward()
  turtle.turnRight()
end

function harvest(length, fields)
  for i = 1, fields do
    harvest_line(length)
    turn_left()
    harvest_line(length)
    if i ~= fields then
      pass_water()
    end
  end

  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft()

  for j = 0, ((fields -1) * 3) do
    turtle.forward()
  end

  turtle.turnLeft()
end

harvest(20, 3)
