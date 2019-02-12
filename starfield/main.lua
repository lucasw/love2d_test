old_x = 0
old_y = 0

stars = {}

function love.load()
  love.window.setTitle('endless side scrolling stars')

  for i=1,1000,1 do
    star = {}
    star["x"] = math.random(0.0, love.graphics.getWidth())
    star["y"] = math.random(0.0, love.graphics.getHeight())
    size_pre  = math.random(0.2, 2.8)
    star["size"] = size_pre  -- * 5.5
    star["speed"] = star["size"] * (0.05 + math.random(0, 0.1))
    base = 0.9
    star["r"] = base + math.random(0.0, 1.0 - base)
    star["g"] = base + math.random(0.0, 1.0 - base)
    star["b"] = base + math.random(0.0, 1.0 - base)
    brightness = math.random(0.2, 0.5) + size_pre * 0.2
    -- star["r"] = star["r"] * brightness
    -- star["g"] = star["g"] * brightness
    -- star["b"] = star["b"] * brightness
    star["a"] = brightness

    print("test")  -- star["a"])

    table.insert(stars, star)
  end
  -- canvas = love.graphics.newCanvas(love.window.getWidth(), love.window.getHeight())
  -- canvas = love.graphics.newCanvas(800, 800)
end

function love.draw()
    x = love.mouse.getX( )
    y = love.mouse.getY()
    -- love.graphics.setCanvas(canvas)
    -- love.graphics.line(old_x, old_y, x, y)
    -- love.graphics.setCanvas()
    -- love.graphics.draw(canvas, 0, 0)
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
    -- love.graphics.print("foo bar", x, y)

    old_x = x
    old_y = y
end
