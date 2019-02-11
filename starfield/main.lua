old_x = 0
old_y = 0

stars = {}

function love.load()
  love.window.setTitle('endless side scrolling stars')

  for i=1,1000  ,1 do
    star = {}
    star["x"] = math.random(0, love.graphics.getWidth())
    star["y"] = math.random(0, love.graphics.getHeight())
    star["size"] = math.random(0, 2.5)
    star["speed"] = star["size"] * (0.2 + math.random(0, 0.5))
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
      love.graphics.setColor(255, 255, 255)
      love.graphics.circle("fill", v["x"], v["y"], v["size"])
    end
    love.graphics.print("foo bar", x, y)



    old_x = x
    old_y = y
end
