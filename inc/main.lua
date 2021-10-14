-- Main
-- Manages main functions
function _init()
    initSnow()
    initHouse()
end

function _update60()
    updateHouse()
    updateSnow() 
    addSnow()
end

function _draw()
    cls()
    drawSnow()
    drawHouse()
end