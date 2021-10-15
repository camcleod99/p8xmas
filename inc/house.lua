-- House.lua
-- Manages house graphic functions
-- V2

-- initHouse
-- Houses are only created at init so no need for a 'addHouse' function to be made
function initHouse()
    housefrm=0
    housefrmrate=1
    houses={
        {
            {2,-8,-8},
            {3,0,-8},
            {18,-8,0},
            {19,0,0}
        },
        {
            {4,-8,-8},
            {5,0,-8},
            {20,-8,0},
            {21,0,0}
        },
        {
            {6,-8,-8},
            {7,0,-8},
            {22,-8,0},
            {23,0,0}
        },
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

function updateHouse()
    housefrm = housefrm +1
    if (housefrm == housefrmrate) then
        for h in all(housetable) do
            h:update()
        end
    housefrm = 0
    end
end

function drawHouse()
    for h in all(housetable) do
        h:draw()
    end
end