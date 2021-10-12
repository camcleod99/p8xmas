-- RunTime
function _init()
    frm=0
    initSnowVars()
    initHouseVars()
    addSnow()
    addHouse(1)
end

function _update60()
    frm=frm+1
    -- Update Objects
    for h in all(housetable) do
        h:update()
    end    
    for f in all(flaketable) do
        f:update()
    end
    -- Add to object tables   
    addHouse()
    addSnow()
end

function _draw()
    cls()
    drawSnowScene()
    for h in all(housetable) do
        h:draw()
    end
    for f in all(flaketable) do
        f:draw()
    end
    debugPrint(frm,10)
    debugPrint(housefrm,20)
    debugPrint(housefrmrate,30)
    debugPrint(houseno,40)
end