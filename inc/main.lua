-- Main
-- Manages main functions

function _init()
    initSnow()
    initHouse()
    initMessage()
    addMessage("Merry Christmas!",0,0,-4,0)
    addMessage("By Craig McLeod",0,0,64,123)
    addMessage("Another Year gone? How Time Flies! Here's to a Merry Christmas and a Happy New Year from Silly Dice!",1,{7,8,9},128,110)
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