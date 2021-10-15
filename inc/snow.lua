-- Snow.lua
-- Manages snow graphic functions
-- V2

--  init method.
--  addSnow Function is needed multiple times, therefore it is called once in the
function  initSnow()
    flaketable={}
    liveline=8
    deadline=100
    snowdirections={-1,1}
    snowfrm=30
    snowfrmrate=30
    snowfrmrates={3,6,9,12,15,18,21,24,27,30}
    snowfallrate=1
    addSnow()
end

function addSnow()
    if(snowfrm >= snowfrmrate) then
        for i = 0, 120, 10 do
            if (i % 20) then
                makesway=flr(rnd(8))
                add(flaketable, {
                x=i-makesway,
                y=0+makesway,
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
                    if(self.y > liveline-self.bottom) then
                        spr(0,self.x,self.y)
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
    line(0, liveline, 128, liveline, 7)
    line(0, deadline, 128, deadline, 7)
    for f in all(flaketable) do
        f:draw()
    end
end