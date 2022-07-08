local class = require("middleclass")
group = class("group")
local groups = {}
local originalFont = love.graphics.getFont()
latestChild = nil

function group:initialize(name, make, visible)
    self.name = name or "Group"
    self.make = make or "nil"
    self.kids = {}
    table.insert(self.kids, self.make)
    element = self.make
    self.visible = visible or true
    if #groups < 2 then
        table.insert(groups, self)
    end
    return self

end

function group:add(item)
	self.item = item or "nothing"
    return table.insert(self.kids, self.item)
end

function group:update()
    local x, y = love.mouse.getPosition()
	for i, v in pairs(self.kids) do
		element = v
	end
end


function group:draw()
    for i, v in ipairs(self.kids) do
        return element:draw()
      end
end

function updateG()
    for i, v in pairs(groups) do
        v:update()
    end
end

function drawG()
    for i, v in pairs(groups) do
        v:draw()
    end
end

function group:children()
    return self.kids
end

