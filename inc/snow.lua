-- Snow.lua
-- Manages snow functions

--  initSnowVars()
--  Flakes      : Table for Snowflakes
--  Deadline    : Y Location for snows to termanate
--  SnowFrm     : Used with SnowFrmRate to invoke makeSnow()
--  SnowFrmRate : Determines how many frames has to have passed before makeShow() 
--                is invoked
--  fallrate    : Determines the rate at which the snow falls (pixels)
--  flakeborder : Determines how many pixels left or right the flake will "sway"
function  initSnowVars()
    flaketable={}
    liveline=8
    deadline=100
    snowfrm=30
    snowfrmrates={3,6,9,12,15,18,21,24,27,30}
    snowfrmrate=30
    fallrate=1
end

-- drawSnowScene()
--  Draws Scene made of two lines one at the to pand one at the bottom using
--  deadline to determine its height
function drawSnowScene()
    line(0, 8, 128, 8, 7)
    line(0, deadline, 128, deadline, 7)
end

-- addSnow()
--  Creates a line of snow at y0
--  Every twenty loops (each one corisponding to a x cordinate) makeSnow() is invoked
--  adding another line of snow
function addSnow()
    if(snowfrm >= snowfrmrate) then
        for i = 0, 120, 10 do
            if (i % 20)
            then
                makeSnow(i,0)
            end
        end
    snowfrm = 0
    snowfrmrate = rnd(snowfrmrates)
    end
    snowfrm = snowfrm + 1
end

-- makeSnow(_x,_y)
--  Creates a line of snow
--  Passed Variables 
--      _(x/y)      : Used to determine the cordinates of the snowflake
--  Variables
--      directions  : Used to determine in which direction the snow will initaly 
--                  move
--      makeSway    : determins the "sway" of the snowflake, namely at what point
--                  the snowflake will be placed on the row, this also makes for
--                  a "border" for the snow's falling
--      make_(x/y)  : the cordinates of the snowflake, effected by makeSway and 
--                  the values passed into the function 
--      makealpha   : the number of pixels between the bottom of the sprite and
--                  the actual sprite contents
--      makedir     : the intial direction of the snowflake's movement, ether left 
--                  (-1) or right (1), randomly chosesn from _directions_
--                  
function makeSnow(_x,_y)
    directions={-1,1}
    makesway=flr(rnd(8))
    make_x=_x-makesway
    make_y=_y+makesway
    maketop=4
    makebottom=4
    makeborder=10
    makedir=rnd(directions)
    -- Constructor (flaketable)
    add(flaketable, {
    x=make_x,
    y=make_y,
    sway=makesway,
    border=makeborder,
    top=maketop,
    bottom=makebottom,
    direction=makedir,
    -- update(self)     : Update Snowflake Object's location, if it hits deadline (using
    --                  makeAlpha to confirm collsion of sprite art as opposed to sprite)
    --                  then the Destructor removes the snowflake from the flaketable table
    update=function(self)
        self.y = self.y + fallrate
        --  Destructor   : Delete snowflake when it hits deadline (4 pixels up 
        --               from sprite base)
        if (self.y >= (deadline-self.bottom))
            then
            del(flaketable,self)
        else
        --  Update(self), contnued
            self.x = self.x + (1 * self.direction)
            self.sway = self.sway+1
        --      Reverse direction of snowflake if it reaches the flakeborder 
        --      value
            if (self.sway > self.border)
            then
                self.sway = 0
                self.direction = (self.direction * -1)
            end  
        end
    end,
    --  draw(self)      : Draw Snowflake Object on screen
    draw=function(self)
        if(self.y > liveline-self.bottom) then
            spr(0,self.x,self.y)
        end
    end,
    })
end