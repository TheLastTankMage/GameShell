
-- LOCAL VARIABLES
local splashB = {}

-- LOCAL TIMERS
local splashTimer = timer.new()
local fadeB = timer.new()

function splashB:enter()
  color = {alpha = 255}

  -- FADE IN/OUT
  fadeB:script(function(wait)
    fadeB:tween(2, color, {alpha=0}, 'in-out-quad')
    wait(2)
    fadeB:tween(2, color, {alpha=255}, 'in-out-quad')
  end)

end

function splashB:update(dt)
  -- TIMERS
  splashTimer:update(dt)
  fadeB:update(dt)

  -- EXIT TIMER
  splashTimer:after(5, function() gamestate.switch(menu) end)
end

function splashB:draw()

  -- LOGO
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(loveLogo, 0, 0)
  love.graphics.printf("Made With LÖVE \n love2d.org", 0, sh - 20, 500, 'center')

  -- FADE OVERLAY
  love.graphics.setColor(0, 0, 0, color.alpha)
  love.graphics.rectangle("fill", 0, 0, sw, sh)
end

-- KEY EXIT
function splashB:keypressed(key)
  if key then gamestate.switch(menu) end
end


return splashB
