-- Requirements: 
-- Put staircases in slot 1
-- Put torches in slot 2
--
-- Description:
-- Will build stairs going down
-- and place torches every 6 diagonal


function stair(level)
  for i = 1, level do
    turtle.dig()
    turtle.digDown()
    turtle.forward()
    turtle.dig()
    turtle.digDown()
    turtle.down()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.place()
    turtle.turnLeft()
    turtle.turnLeft()
    if i % 6 == 0 then
      turtle.select(2)
      turtle.placeUp()
      turtle.select(1)
    end
  end
end

function goBack(level)
  for i = 1, level do
    turtle.up()
    turtle.back()
  end
end


stair(12)

-- goBack(10)
