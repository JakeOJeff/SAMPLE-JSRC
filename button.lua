local class = require("middleclass")
button = class("button")
local buttons = {}
local originalFont = love.graphics.getFont()
sampleCodeVal = 0

function button:initialize(text, code, x, y, rx, ry, font, textColor, color, hover, click, visible)

    self.code = code or (function()
        sampleCode = "hello"
        sampleCodeVal = sampleCodeVal + 1
    end)
    self.text = text or "Button"
    self.width = x or 19
    self.height = y or 25
    self.rx = rx or 0
    self.ry = ry or 0
    self.textColor = textColor or {255, 255, 255}
    self.font = font or love.graphics.getFont()
    self.color = color or {0.5, 0.5, 0.5}
    self.hover = hover or {0.4, 0.4, 0.4}
    self.click = click or {0.7, 0.7, 0.7}
    self.Fcolor = {self.color[1], self.color[2], self.color[3]}
    self.visible = visible or true
    if #buttons < 1 then
        table.insert(buttons, self)
    end
    return self

end

function button:update()
    local x, y = love.mouse.getPosition()
    if x < self.width + self.font:getWidth(self.text) + 20 and x > self.width and y < self.height +
        self.font:getHeight(self.text) + 20 and y > self.height then

        if not love.mouse.isDown(1) then
            self.Fcolor = {self.hover[1], self.hover[2], self.hover[3]}
        else
            self.code()
            self.Fcolor = {self.click[1], self.click[2], self.click[3]}
            love.timer.sleep(.1)
        end
    else
        if self.color[4] ~= nil then
            self.Fcolor = {self.color[1], self.color[2], self.color[3], self.color[4]}
        else
            self.Fcolor = {self.color[1], self.color[2], self.color[3]}
        end

    end
end

function button:draw()
    if self.visible == true then
        love.graphics.setFont(self.font)

        love.graphics.setColor(self.Fcolor)
        love.graphics.rectangle("fill", self.width, self.height, self.font:getWidth(self.text) + 20,
            self.font:getHeight(self.text) + 20, self.rx, self.ry)

        love.graphics.setColor(self.textColor)
        love.graphics.print(self.text, self.width + 10, self.height + 10)

        love.graphics.setColor(255, 255, 255)
        love.graphics.setFont(originalFont)
        if sampleCode then
            love.graphics.print(sampleCode .. " x" .. math.floor(sampleCodeVal), 10, 75)
        end
    end
end

function update_buttons()
    for i, v in pairs(buttons) do
        v:update()
    end
end

function draw_buttons()
    for i, v in pairs(buttons) do
        v:draw()
    end
end
