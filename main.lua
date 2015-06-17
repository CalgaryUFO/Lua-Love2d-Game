require ("AnAL")
require ("conf")

love.filesystem.load("tiledmap.lua")()

gCamX, gCamY = 400, 400 

function love.load()
  TiledMap_Load("maps/startmap.tmx")
  protag = love.graphics.newImage("Char/male_robe_guy_walk.png")


  human={}
  	human[1] = love.graphics.newQuad(0, 0, 64, 64, 576, 256)
  	human[2] = love.graphics.newQuad(64, 0, 64, 64, 576, 256)
  	human[3] = love.graphics.newQuad(128, 0, 64, 64, 576, 256)
  	human[4] = love.graphics.newQuad(192, 0, 64, 64, 576, 256)
  	human[5] = love.graphics.newQuad(256, 0, 64, 64, 576, 256)
  	human[6] = love.graphics.newQuad(320, 0, 64, 64, 576, 256)
  	human[7] = love.graphics.newQuad(384, 0, 64, 64, 576, 256)
  	human[8] = love.graphics.newQuad(448, 0, 64, 64, 576, 256)
  	human[9] = love.graphics.newQuad(512, 0, 64, 64, 576, 256)
  	human.x = 250
  	human.y = 200
  	human.speed = 100

  humanl={}
  	humanl[1] = love.graphics.newQuad(0, 64, 64, 64, 576, 256)
  	humanl[2] = love.graphics.newQuad(64, 64, 64, 64, 576, 256)
  	humanl[3] = love.graphics.newQuad(128, 64, 64, 64, 576, 256)
  	humanl[4] = love.graphics.newQuad(192, 64, 64, 64, 576, 256)
  	humanl[5] = love.graphics.newQuad(256, 64, 64, 64, 576, 256)
  	humanl[6] = love.graphics.newQuad(320, 64, 64, 64, 576, 256)
  	humanl[7] = love.graphics.newQuad(384, 64, 64, 64, 576, 256)
  	humanl[8] = love.graphics.newQuad(448, 64, 64, 64, 576, 256)
  	humanl[9] = love.graphics.newQuad(512, 64, 64, 64, 576, 256)

  humand={}
  	humand[1] = love.graphics.newQuad(0, 128, 64, 64, 576, 256)
  	humand[2] = love.graphics.newQuad(64, 128, 64, 64, 576, 256)
  	humand[3] = love.graphics.newQuad(128, 128, 64, 64, 576, 256)
  	humand[4] = love.graphics.newQuad(192, 128, 64, 64, 576, 256)
  	humand[5] = love.graphics.newQuad(256, 128, 64, 64, 576, 256)
  	humand[6] = love.graphics.newQuad(320, 128, 64, 64, 576, 256)
  	humand[7] = love.graphics.newQuad(384, 128, 64, 64, 576, 256)
  	humand[8] = love.graphics.newQuad(448, 128, 64, 64, 576, 256)
  	humand[9] = love.graphics.newQuad(512, 128, 64, 64, 576, 256)

  humanr={}
  	humanr[1] = love.graphics.newQuad(0, 192, 64, 64, 576, 256)
  	humanr[2] = love.graphics.newQuad(64, 192, 64, 64, 576, 256)
  	humanr[3] = love.graphics.newQuad(128, 192, 64, 64, 576, 256)
  	humanr[4] = love.graphics.newQuad(192, 192, 64, 64, 576, 256)
  	humanr[5] = love.graphics.newQuad(256, 192, 64, 64, 576, 256)
  	humanr[6] = love.graphics.newQuad(320, 192, 64, 64, 576, 256)
  	humanr[7] = love.graphics.newQuad(384, 192, 64, 64, 576, 256)
  	humanr[8] = love.graphics.newQuad(448, 192, 64, 64, 576, 256)
  	humanr[9] = love.graphics.newQuad(512, 192, 64, 64, 576, 256)


  	num = 1
  	charh = human[num]
  	timer =  0
  	drawh = 1
  	speed = 100

  	map = 1


end

function love.keyreleased(key)
   if key == "escape" then
      love.event.quit()
     end
end
function love.update(dt)

if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
	timer = timer + dt
	human.y = human.y - human.speed * dt
	charh = human[num]

if timer > 0.08 then
	timer = 0
	num = num + 1
	
if num > 9 then
	num = 1
end
end
end

if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
	timer = timer + dt
	human.y = human.y + human.speed * dt
	charh = humand[num]

if timer > 0.08 then
	timer = 0
	num = num + 1
	
if num > 9 then
	num = 1
end
end
end

if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
	timer = timer + dt
	human.x = human.x - human.speed * dt
	charh = humanl[num]

if timer > 0.08 then
	timer = 0
	num = num + 1
	
if num > 9 then
	num = 1
end
end
end

if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
	timer = timer + dt
	human.x = human.x + human.speed * dt
	charh = humanr[num]

if timer > 0.08 then
	timer = 0
	num = num + 1
	
if num > 9 then
	num = 1
end
end
end

if human.y <= 300 and human.x >= 470 and map == 1 then
	TiledMap_Load(string.format("maps/room1.tmx"))
	gCamX,gCamY = 400, 400
	human.y = 360
	human.x = 250
	map = 2
end

end

function love.draw() 
TiledMap_DrawNearCam(gCamX,gCamY)

if drawh == 1 then
love.graphics.drawq(protag, charh, human.x , human.y)
end

end
