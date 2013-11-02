-- Requirements: 
-- Put material (preferably wood) on slot 1
-- Put torches on slot 2
--
-- Description:
-- Turtle will create a 4x4x1 lamp and attach torches to sides
-- at two blocks of separation from floor. Assumes the area is
-- clear of other materials
--
-- Where the turtle is placed will be the "bottom-left" corner
-- if the lamp were to be looked up from sky


turtle.select(1)
turtle.up()
turtle.up()
turtle.up()
turtle.placeDown()
turtle.forward()
turtle.placeDown()
turtle.turnRight()
turtle.forward()
turtle.placeDown()
turtle.turnRight()
turtle.forward()
turtle.placeDown()

turtle.select(2)
turtle.forward()
turtle.down()
turtle.turnLeft()

for i = 1, 4 do
  turtle.back()
  turtle.place()
  turtle.back()
  turtle.place()

  turtle.turnRight()
  turtle.back()
end
