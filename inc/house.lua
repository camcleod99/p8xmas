-- House.lua
-- V2
-- Manages house graphic functions

-- initHouseVars()
-- lists the houses and populates the housetable
-- houses       :   table of house tables for population into housetable
--                  coords  : Centre of Object{x coord,y coord}
--                  sprite  : list of sprites {spriteNo,X offset, Y offset}
-- housetable   :   table of populated houses
function initHouseVars()
housefrm=0
houses={
    --housetype 1
    {
        {2,-8,-8},
        {3,0,-8},
        {18,-8,0},
        {19,0,0}
    },
    --housetype 2
    {
        {4,-8,-8},
        {5,0,-8},
        {20,-8,0},
        {21,0,0}
    },
    --housetype 3
    {
        {6,-8,-8},
        {7,0,-8},
        {22,-8,0},
        {23,0,0}
    },
    --housetype 4
    {
        {225,-1,-1},
        {225,0,-1},
        {225,-1,0},
        {225,0,0}
    },
}
-- Create and Populate housetable
housetable={}
for i = 1, 9, 1 do
    lasthouse=0
    repeat
        makehousetype=flr(rnd(3))+1
    until (makehousetype != lasthouse)
    lasthosue = makehousetype
    -- Constructor
    add(housetable, {
        coords={(128+16*(i-1)),92},
        sprites=houses[makehousetype],
    -- Updater & Destructor
        update=function(self)
            -- Updater
            self.coords[1] = self.coords[1] - 1
            -- Destructor
            if ( (self.coords[1] + 16 ) < 0 ) then
                self.coords[1] = 135
            end
        end,
    -- Artist
        draw=function(self)
            for s in all (self.sprites) do
                spr(s[1],s[2]+self.coords[1],s[3]+self.coords[2])
            end
        end,
    })
end
end

function houseUpdater()
    housefrm = housefrm +1
    if (housefrm == 1) then
        for h in all(housetable) do
            h:update()
        end
    housefrm = 0
    end
end