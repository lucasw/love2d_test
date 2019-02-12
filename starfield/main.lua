old_x = 0
old_y = 0

stars = {}

function love.load()
  love.window.setTitle('endless side scrolling stars')
  love.window.setFullscreen(true)
  canvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
  love.graphics.setCanvas(canvas)

  for i=1,25000,1 do
    star = {}
    star["x"] = math.random(0.0, love.graphics.getWidth() + 20)
    star["y"] = math.random(0.0, love.graphics.getHeight())
    size_pre = math.random() * 0.9 + 0.1
    star["size"] = size_pre * 2.0  -- * 5.5
    star["speed"] = star["size"] * (0.2 + math.random() * 0.4)
    base = 0.85
    star["r"] = base + math.random() * (1.0 - base)
    star["g"] = base + math.random() * (1.0 - base) * 0.5
    star["b"] = base + math.random() * (1.0 - base)
    brightness = math.random()  -- math.random(0.2, 0.3) + size_pre * 0.2
    -- star["r"] = star["r"] * brightness
    -- star["g"] = star["g"] * brightness
    -- star["b"] = star["b"] * brightness
    star["a"] = brightness

    if i < 1500 then
      star["size"] = star["size"] + 1.0
      star["a"] = star["a"] + 0.3
      table.insert(stars, star)
    else
      love.graphics.setColor(star["r"], star["g"], star["b"], star["a"] * 0.7)
      -- love.graphics.circle("fill", v["x"], v["y"], v["size"] * 1.6)
      -- love.graphics.setColor(v["r"], v["g"], v["b"], v["a"] * 0.5)
      love.graphics.circle("fill", star["x"], star["y"], star["size"])
    end

    -- print("test")  -- star["a"])

  end
  love.graphics.setCanvas()
end

function love.draw()
    x = love.mouse.getX( )
    y = love.mouse.getY()
    -- love.graphics.setCanvas(canvas)
    -- love.graphics.line(old_x, old_y, x, y)
    -- love.graphics.setCanvas()
    love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
    love.graphics.draw(canvas, 0, 0)
    if true then
      for k, v in pairs(stars) do
        v["x"] = v["x"] - v["speed"]
        if v["x"] < -2 then
          v["x"] = love.graphics.getWidth() + 20
          v["y"] = math.random(0.0, love.graphics.getHeight())
        end
        love.graphics.setColor(v["r"], v["g"], v["b"], v["a"])
        -- love.graphics.circle("fill", v["x"], v["y"], v["size"] * 1.6)
        -- love.graphics.setColor(v["r"], v["g"], v["b"], v["a"] * 0.5)
        love.graphics.circle("fill", v["x"], v["y"], v["size"])

      end
    end
    -- love.graphics.print("foo bar", x, y)

    old_x = x
    old_y = y
end
