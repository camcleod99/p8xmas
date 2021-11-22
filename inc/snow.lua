-- Snow.lua
-- Manages snow graphic functions
-- V2

--  init method.
function  initSnow()
    flaketable={}
    liveline=0
    deadline=92
    snowdirections={-1,1}
    snowfrm=30
    snowfrmrate=30
    snowfrmrates={3,6,9,12,15,18,21,24,27,30}
    snowfallrate=1
    bgcolor=2
    addSnow()
end

function addSnow()
    if(snowfrm >= snowfrmrate) then
        for i = 0, 120, 10 do
            if (i % 20) then
                makesway=flr(rnd(8))
                add(flaketable, {
                x=i-makesway,
                y=(-5+makesway),
                sway=makesway,
                border=10,
                top=4,
                bottom=4,
                direction=rnd(snowdirections),
                -- Updater
                update=function(self)
                    self.y = self.y + snowfallrate
                -- Destructor
                    if (self.y >= (deadline-self.bottom))
                        then
                        del(flaketable,self)
                    else
                        self.x = self.x + (1 * self.direction)
                        self.sway = self.sway+1
                        if (self.sway > self.border)
                        then
                            self.sway = 0
                            self.direction = (self.direction * -1)
                        end  
                    end
                end,
                -- Artist
                draw=function(self)
                    if(self.y > liveline-self.top) then  
                        if(self.y > liveline-self.bottom) then
                            spr(0,self.x,self.y)
                        end
                    end                  
                end,
            })
            end
        end
        snowfrm = 0
        snowfrmrate = rnd(snowfrmrates)
    end
    snowfrm = snowfrm + 1
end

function updateSnow()
    for f in all(flaketable) do
        f:update()
    end 
end

function drawSnow()
    -- Line
    line(0, deadline, 128, deadline, 1)

    -- Background
    rectfill(0,0,128,deadline-1,5)

    -- Moon
    spr(8,10,10)
    spr(9,18,10)
    spr(24,10,18)
    spr(25,18,18)

    -- Big Stars
    spr(1,65,10)
    spr(1,32,13)
    spr(1,108,24)
    spr(1,84,32)

    -- Small Stars
    spr(16,52,12)
    spr(16,14,35)
    spr(16,116,4)
    spr(16,87,9)
    spr(16,42,29)

    for f in all(flaketable) do
        f:draw()
    end
end