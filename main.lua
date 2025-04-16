local player = {
    x = 100,
    y = 300,
    width = 50,
    height = 50,
    yVelocity = 0,
    jumpHeight = -300,
    gravity = 800,
    onGround = true
}

function love.update(dt)
    -- Apply gravity
    if not player.onGround then
        player.yVelocity = player.yVelocity + player.gravity * dt
    end

    -- Update position
    player.y = player.y + player.yVelocity * dt

    -- Floor collision
    if player.y > 300 then
        player.y = 300
        player.yVelocity = 0
        player.onGround = true
    end
end

function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function love.keypressed(key)
    if key == "space" and player.onGround then
        player.yVelocity = player.jumpHeight
        player.onGround = false
    end
end