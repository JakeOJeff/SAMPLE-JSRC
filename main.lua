function love.load()
    require'button'
    require'group'
    local butts = button:new()
    local butt = button:new(text, code, 300)
    grp = group:new("MyName", butts)
    table.insert(grp.kids, butt)
    table.insert(grp.kids, butts)
    butts.x = 6
    butt.x = 200
    butts.code = ( 
        function()
            butts.visible = false
        end
    )
    myKidCount = 1



end

function love.update()
    update_buttons()
    updateG()
end

function love.draw()
    drawG(grp)
end