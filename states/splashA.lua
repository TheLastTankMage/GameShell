
-- LOCAL VARIABLES
local splashA = {}

-- LOCAL TIMERS
local splashTimer = timer.new()
local fadeA = timer.new()


function splashA:enter()
    -- FADE IN/OUT
    fadeA:script(function(wait)
      fadeA:tween(2, color, {alpha=0}, 'in-out-quad')
      wait(2)
      fadeA:tween(2, color, {alpha=255}, 'in-out-quad')
    end)

end

function splashA:update(dt)
  -- TIMERS
  splashTimer:update(dt)
  fadeA:update(dt)

  -- EXIT TIMER
  splashTimer:after(5, function() gamestate.switch(splashB) end)
end

function splashA:draw()

  -- LOGO
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("A Patches Game", sw /2, sh /2)
  love.graphics.draw(testLogo, 0, 0)

  -- FADE OVERLAY
  love.graphics.setColor(0, 0, 0, color.alpha)
  love.graphics.rectangle("fill", 0, 0, sw, sh)


end

-- KEY EXIT
function splashA:keypressed(key)
  if key then gamestate.switch(splashB) end
end


return splashA
