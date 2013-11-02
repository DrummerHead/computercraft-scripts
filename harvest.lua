-- Requirements: 
-- Put seeds on slot 1
--
-- Description:
-- Takes care of harvesting and seeding, not a very modular script
-- Pattern expected as such:
--
-- XXXXXXXX  \
-- XX XX XX  |
-- XX XX XX  |
-- XX XX XX  | Height as only parameter
-- XX XX XX  |
-- XX XX XX  |
-- XXXXXXXX  /
-- 
-- The Xs will be harvested and replanted


function harvest_line(length)
  for i = 2, length do
    turtle.digDown()
    turtle.placeDown()
    turtle.forward()
  end
end

function turn(is_left)
  if is_left then
    turtle.digDown()
    turtle.placeDown()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
  else
    turtle.digDown()
    turtle.placeDown()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
  end
end

function pass_water()
  turtle.turnRight()
  harvest_line(3)
  turtle.turnRight()
end

function harvest(length)
  harvest_line(length)
  turn(true)
  harvest_line(length)
  pass_water()
  harvest_line(length)
  turn(true)
  harvest_line(length)
  pass_water()
  harvest_line(length)
  turn(true)
  harvest_line(length)
  
  -- awkward...
  turtle.digDown()
  turtle.placeDown()
  turtle.turnLeft()
  turtle.turnLeft()

  for i = 2, length do
    turtle.forward()
  end

  turtle.turnRight()
  turtle.forward()
  turtle.forward()

  turtle.digDown()
  turtle.placeDown()

  turtle.forward()
  turtle.forward()
  turtle.forward()

  turtle.digDown()
  turtle.placeDown()
end

harvest(10)
