-- House.lua
-- V1.0
-- Manages house graphic functions

-- TODO: v2 Implimentation

-- initHouseVars()
-- sets variables for this section
-- houses       :   list of houses
--                  coord: Centre of Object
--                  sprite: list of sprites {spriteNo,X offset, Y offset}
-- housetable   :   list of active house objects
-- housefrm     :   frameclock for this module
-- hosuefrmrate :   generate a house every X frames
-- makehouse    :   determins if makeHouse() creates houses
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
    houseloop=0
    houseno=1
    housefrm = -2
    housefrmrate = 16
    makehouse = true
end

-- addHouse()
-- creates a house object if the current framerate in the object is 
-- the same as housefrmrate
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
-- Resets addHouse()'s functionality.
-- Largely defunct in this version but what you going to do?
function resetAddHouse()
    houseno = houseno + 1
--  If I wanted, this could reset houseno to 1 and researt the loop.
--  This, however, is not really nessasary
    if (houseno == 4) then
        houseloop = houseloop+1
        houseno = 1
        if (houseloop == 4) then
            makehouse = false
        end
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