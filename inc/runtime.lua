-- RunTime
function _init()
    frm=0
    initSnowVars()
    addSnow()
end

function _update60()
    frm=frm+1
    for f in all(flaketable) do
        f:update()
    end
    addSnow()
end

function _draw()
    cls()
    drawSnowScene()
    for f in all(flaketable) do
        f:draw()
    end
    print(frm,0,0,3)
    print(snowfrm,0,10,4)
    print(snowfrmrate,0,20,4)
end