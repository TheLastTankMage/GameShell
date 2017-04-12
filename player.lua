hero = {}

function hero:debug()
  love.graphics.print(player.x, sw - (sw/2), 10)
  love.graphics.print(player.y, sw - (sw/2), 20)
  love.graphics.print(player.xVel, sw - (sw/2), 30)
  love.graphics.print(player.yVel, sw - (sw/2), 40)
end

function hero:init()

-- Create Player
  player = {
    x = 10, y = 10,
    img = love.graphics.newImage("assets/player.png"),
    w = 12, h = 12,
    speed = 50, maxSpeed = 100,
    xVel = 0, yVel = 0,
    friction = 10
  }

end


function hero:update(dt)
  hero:keycontrol(dt)
  hero:applyFriction(dt)
  hero:speedLimit(dt)
  hero:move(dt)


-- Player X Limit
  if player.x >= sw then
    player.x = sw
  end
  if player.x <= 0 then
    player.x = 0
  end
end


function hero:draw()
  love.graphics.draw(player.img, player.x, player.y)

  hero:debug()

end


function hero:keycontrol(dt)
  local Pressed = {
    ws = false,
    ad = false,
    ud = false,
    lr = false,
  }

  if (love.keyboard.isDown("w") and love.keyboard.isDown("s")) then
    Pressed.ws = true
  end

  if (love.keyboard.isDown("a") and love.keyboard.isDown("d")) then
    Pressed.ad = true
  end

  if (love.keyboard.isDown("up") and love.keyboard.isDown("down")) then
    Pressed.ud = true
  end

  if (love.keyboard.isDown("left") and love.keyboard.isDown("right")) then
    Pressed.lr = true
  end

  -- Velocity
  if not (Pressed.ad and Pressed.lr) then
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
      player.xVel = player.xVel - (player.speed * dt)
    elseif love.keyboard.isDown("a") or love.keyboard.isDown("left")  then
      player.xVel = player.xVel + (player.speed * dt)
    end
  end

  if not (Pressed.ud and Pressed.ws) then
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
      player.yVel = player.yVel - (player.speed * dt)
    elseif love.keyboard.isDown("w") or love.keyboard.isDown("up")  then
      player.yVel = player.yVel + (player.speed * dt)
    end
  end

end


function hero:applyFriction(dt)
  if player.xVel > 0 then
    player.xVel = math.max(player.xVel-player.friction*dt, 0)	--Round to everything above 0, or 0 itself
  elseif player.xVel < 0 then
    player.xVel = math.min(player.xVel+player.friction*dt, 0)	--Round to everything below 0, or 0 itself
  end

  if player.yVel > 0 then
    player.yVel = math.max(player.yVel-player.friction*dt, 0)	--Round to everything above 0, or 0 itself
  elseif player.yVel < 0 then
    player.yVel = math.min(player.yVel+player.friction*dt, 0)	--Round to everything below 0, or 0 itself
  end

end


function hero:speedLimit(dt)
  if player.xVel > 0 then
		player.xVel = math.min(player.xVel, player.maxSpeed)	--Round to everything below maxSpeed, or maxSpeed itself
	elseif player.xVel < 0 then
		player.xVel = math.min(player.xVel, player.maxSpeed*-1)	--Round to everything below maxSpeed, or maxSpeed itself
	end

	if player.yVel > 0 then
		player.yVel = math.min(player.yVel, player.maxSpeed)	--Round to everything below maxSpeed, or maxSpeed itself
	elseif player.yVel < 0 then
		player.yVel = math.min(player.yVel, player.maxSpeed*-1)	--Round to everything below maxSpeed, or maxSpeed itself
	end

end

function hero:move(dt)
  player.x = player.x + player.xVel*dt
  player.y = player.y + player.yVel*dt

end
