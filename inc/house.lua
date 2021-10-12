-- House.lua
-- Manages house graphic functions

-- TODO: Documentation

-- Houses


-- initHouseVars()
-- houses       :   list of houses
--                  coord: Centre of Object
--                  sprite: list of sprites {spriteNo,X offset, Y offset}
-- housetable   :   list of active house objects
-- housefrm     :   frameclock for this module
-- hosuefrmrate :   generate a house every X frames
function initHouseVars()
    houses={
        {
            coords={132,92},
            sprites={
            {2,-8,-8},
            {3,0,-8},
            {18,-8,0},
            {19,0,0}
            },
        },
        {
            coords={132,92},
            sprites={
            {4,-8,-8},
            {5,0,-8},
            {20,-8,0},
            {21,0,0}
            },
        },
        {
            coords={132,92},
            sprites={
            {6,-8,-8},
            {7,0,-8},
            {22,-8,0},
            {23,0,0}
        },
        },
    }
    housetable={}
    houseno=1
    housefrm = -2
    housefrmrate = 32
    makehouse = true
end

-- addHouse()
function addHouse()
    if (makehouse) then
        housefrm = housefrm + 1
        if (housefrm == -1) then
            makeHouse(houseno)
            resetAddHouse()
        elseif (housefrm == housefrmrate) then
            makeHouse(houseno)
            resetAddHouse()
        end
    end
end

-- resetAddHouse()
function resetAddHouse()
    houseno = houseno + 1
    if (houseno == 4) then
        makehouse = false
    end
    housefrm = 0
end

-- makeHouse()
function makeHouse(house)
    makehouseno=house
    makecoords=houses[house].coords
    makesprites=houses[house].sprites
    --Constrctor
    add(housetable, {
        houseno=makehouseno,
        coords=makecoords,
        sprites=makesprites,
    -- update
    update=function(self)
        self.coords[1] = self.coords[1] - 1
        if ( (self.coords[1] + 8) < 0) then
            self.coords[1] = 132
        end
    end,
    -- draw
    draw=function(self)
        for s in all (self.sprites) do
            spr(s[1],s[2]+self.coords[1],s[3]+self.coords[2])
        end
    end,
    })
end