-- Requirements: 
-- Place torches in slot 1
--
-- Description:
-- Turtle will continue digging up
-- until it doesn't hit blocks for
-- seven consecutive times,
-- Then it will go down


local maybeSurface = 0
local howMuchDigging = 0

while maybeSurface <= 7 do
  turtle.digUp()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.dig()
  turtle.up()

  if not turtle.detectUp() then
    maybeSurface = maybeSurface + 1
  else
    maybeSurface = 0
  end

  howMuchDigging = howMuchDigging + 1

  if howMuchDigging % 6 == 0 then
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.place()
    turtle.turnLeft()
    turtle.turnLeft()
  end
end

while not turtle.detectDown() do
  turtle.down()
end
