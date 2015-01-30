-- Requirements: 
-- Put staircases in slot 1
-- Put torches in slot 2
--
-- Description:
-- Will build stairs going down
-- and place torches every 6 diagonal
-- Will avoid lava and water and return to the place 
-- where initially triggered


function safe_forward(steps)
  for i = 1, steps do
    while not turtle.forward() do
      turtle.dig()
    end
  end
end

function safe_up(steps)
  for i = 1, steps do
    while not turtle.up() do
      turtle.digUp()
    end
  end
end

function lava_or_water_down()
  local inspectSuccess, inspectData = turtle.inspectDown()
  if inspectSuccess then
    return inspectData.name == 'minecraft:flowing_lava' or 
    inspectData.name == 'minecraft:lava' or 
    inspectData.name == 'minecraft:flowing_water' or
    inspectData.name == 'minecraft:water'
  else
    return false
  end
end

function go_back(level)
  turtle.turnLeft()
  turtle.turnLeft()
  for i = 0, level do
    safe_up(1)
    safe_forward(1)
  end
end

function stairs(level)
  local y = 0
  for i = 1, level do
    turtle.dig()
    if lava_or_water_down() then
      go_back(y)
      break
    end
    turtle.digDown()
    safe_forward(1)
    turtle.dig()
    turtle.digDown()
    turtle.down()
    y = y + 1
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

stairs(12)
