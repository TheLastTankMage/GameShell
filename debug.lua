local debugMenu = {}

local toggle = false


function debugMenu.print()

  if toggle then
    love.graphics.print("Player X " .. player.x, 10, 10)
    love.graphics.print("Player Y " .. player.y, 10, 20)
    love.graphics.print("Player xVel " .. player.xVel, 10, 30)
    love.graphics.print("Player yVel " .. player.yVel, 10, 40)
  end

end


function debugMenu.toggle()

  if not toggle then
    toggle = true
  elseif toggle then
    toggle = false
  end

end


return debugMenu
