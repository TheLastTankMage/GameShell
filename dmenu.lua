local D = {}

local toggle = false

function D.draw()

  if toggle then
    love.graphics.setColor(60, 60, 60, 150)
    love.graphics.rectangle("fill", 10, 10, sw-20, sh-20, sw/10, sh/10)

    love.graphics.setColor(255, 0, 255, 255)
    love.graphics.print("Player X: " .. player.x, 30, 30)
    love.graphics.print("Player Y: " .. player.y, 30, 40)
    love.graphics.print("Player xVel: " .. player.xVel, 30, 50)
    love.graphics.print("Player yVel: " .. player.yVel, 30, 60)
  end

  love.graphics.print(joyCons, 30, 70)

  if joyCon1:isGamepad() then
    love.graphics.print("Gamepad 1 Connected", 30, 80)
  else
    love.graphics.print("No Gamepad Connected", 30, 80)
  end

end


function D.switch()

  if not toggle then
    toggle = true
  elseif toggle then
    toggle = false
  end

end


return D
