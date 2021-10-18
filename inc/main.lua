-- Main
-- Manages main functions

function _init()
    initSnow()
    initHouse()
    initMessage()
    addMessage(
        "Another Year gone? How Time Flies! Here's to a Merry Christmas and a Happy New Year from Silly Dice!",
        1,{7,8,9},128,104,8)
end

function _update60()
    addSnow()
    updateHouse()
    updateSnow()
    updateMessage() 
end

function _draw()
    cls()
    drawSnow()
    drawHouse()
    drawMessage()
end