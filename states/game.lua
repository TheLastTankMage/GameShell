game = {}


function game:init()
  hero:init()
end



function game:update(dt)
  hero:update(dt)
end



function game:draw()
  love.graphics.setColor(255, 255, 255) -- SHOULD ALWAYS BE FIRST

-- Player/Level Draw
  hero:draw()

end



function game:keypressed(key)

end

return game
