-- Description:
-- Digs a cuboid of a specified size with the purpose of 
-- making space for building
--
-- After placing the turtle, it will begin digging
-- forward, to the left and up.
-- Imagine a cube in front of you, the turtle will start at the
-- bottom-right-towards_you corner

function safe_dig(steps)
  for i = 1, steps do
    while not turtle.forward() do
      turtle.dig()
      turtle.digUp()
    end
  end
end

function safe_dig_up(steps)
  for i = 1, steps do
    while not turtle.up() do
      turtle.digUp()
    end
  end
end

function rotate(is_left)
  if is_left then
    turtle.turnLeft()
    safe_dig(1)
    turtle.turnLeft()
  else
    turtle.turnRight()
    safe_dig(1)
    turtle.turnRight()
  end
end

function flatten(x_, y_, z_)
  for i = 1, z_ do

    -- dig fist two cake layers
    for j = 1, y_ do
      safe_dig(x_)
      rotate(true)
      safe_dig(x_)
      rotate(false)
    end

    -- go up two floors
    turtle.turnRight()
    safe_dig(1)
    turtle.turnLeft()
    safe_dig_up(2)

    -- dig second two cake layers
    for j = 1, y_ do
      safe_dig(x_)
      rotate(false)
      safe_dig(x_)
      rotate(true)
    end

    -- go up two floors, ready to repeat pattern
    turtle.turnLeft()
    safe_dig(1)
    turtle.turnRight()
    safe_dig_up(2)

  end
end


-- The division is in place to remember you that actions are duplicated. The
-- first parameter is depth (towards your front),
-- second width (towards your left) and
-- third height (up).

flatten(8, 8 /2, 8 /4)
