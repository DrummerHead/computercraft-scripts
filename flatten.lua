-- Description:
-- Digs a cuboid of a specified size with the purpose of 
-- making space for building
--
-- After placing the turtle, it will begin digging
-- forward, to the left and up.
-- Imagine a cube in front of you, the turtle will start at the
-- bottom-right-towards_you corner

function line(steps)
  for i = 1, steps do
    while not turtle.forward() do
      turtle.dig()
      turtle.digUp()
    end
  end
end

function rotate(is_left)
  if is_left then
    turtle.digUp()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
  else
    turtle.digUp()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
  end
end

function flatten(x_, y_, z_)
  for i = 1, z_ do
    for j = 1, y_ do
      line(x_)
      rotate(true)
      line(x_)
      rotate(false)
    end
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.digUp()
    turtle.up()
    turtle.digUp()
    turtle.up()
    for j = 1, y_ do
      line(x_)
      rotate(false)
      line(x_)
      rotate(true)
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.digUp()
    turtle.up()
    turtle.digUp()
    turtle.up()
  end
end


-- The division is in place to remember you that actions are duplicated The
-- first parameter is depth (towards your front),
-- second width (towards your left) and
-- third height (up).
flatten(24, 8 /2, 12 /4)
