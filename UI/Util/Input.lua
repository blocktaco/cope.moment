local userInputService = game:GetService('UserInputService')
local Input = {}

function Input.isMouseBounds(drawing)
    local pX, pY, sX, sY = drawing.Position.X, drawing.Position.Y, drawing.Size.X, drawing.Size.Y
	local mouse = userInputService:GetMouseLocation()
	
	return mouse.X >= pX and mouse.X <= pX + sX and mouse.Y >= pY and mouse.Y <= pY + sY or false
end

return Input;
