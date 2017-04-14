hero = {}

function hero:debug()
  love.graphics.print("Player X " .. player.x, sw - (sw/2), 10)
  love.graphics.print("Player Y " .. player.y, sw - (sw/2), 20)
  love.graphics.print("Player xVel " .. player.xVel, sw - (sw/2), 30)
  love.graphics.print("Player yVel " .. player.yVel, sw - (sw/2), 40)
end

function hero:init()

-- Create Player
  player = {
    x = sw-(sw/2), y = sh-(sh/2),
    img = love.graphics.newImage("assets/player.png"),
    w = 12, h = 12,
    speed = 50, maxSpeed = 50,
    xVel = 0, yVel = 0,
    friction = 2
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
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
      player.xVel = player.xVel - (player.speed * dt)
    elseif love.keyboard.isDown("d") or love.keyboard.isDown("right")  then
      player.xVel = player.xVel + (player.speed * dt)
    end
  end

  if not (Pressed.ud and Pressed.ws) then
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
      player.yVel = player.yVel - (player.speed * dt)
    elseif love.keyboard.isDown("s") or love.keyboard.isDown("down")  then
      player.yVel = player.yVel + (player.speed * dt)
    end
  end

end


function hero:applyFriction(dt)
  local d = 1 + player.friction*dt
  player.xVel = player.xVel/d
  player.yVel = player.yVel/d

end


function hero:speedLimit()
  -- get the current speed
  local s = math.sqrt(player.xVel^2 + player.yVel^2)
  if s > player.maxSpeed then
     -- find the scalar "sv" so that: player.vel = player.vel * sv or player.vel = player.vel * 1/s * maxSpeed
     local sv = maxSpeed/s
     player.xVel = player.xVel * sv
     player.yVel = player.yVel * sv
  end

end

function hero:move(dt)
  player.x = player.x + player.xVel*dt
  player.y = player.y + player.yVel*dt

end
