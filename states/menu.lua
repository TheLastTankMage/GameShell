
-- LOCAL VARIABLES
local menu = {}
local fadeC = timer.new()


function menu:enter() -- UPON ENTERING DO ..

  -- FADE IN
  color = {alpha = 255}
  fadeC:tween(2, color, {alpha=0}, 'in-out-quad')
end


function menu:update(dt)

  -- TIMERS
  fadeC:update(dt)
end


function menu:draw()


  -- MENU GRAPHICS
  love.graphics.setColor(255, 255, 255)
  love.graphics.print(color.alpha, sw - (sw/2), 20)
  love.graphics.print("THIS IS THE MENU - PRESS ENTER", sw /2, sh /2)

  -- FADE OVERLAY
  love.graphics.setColor(0, 0, 0, color.alpha)
  love.graphics.rectangle("fill", 0, 0, sw, sh)

end


-- GAME START
function menu:keypressed(key)
  if key == "escape" then love.event.quit()
  elseif key == "return" then gamestate.switch(game) end
end


return menu
