local userInputService = game:GetService('UserInputService')
local Input = {}
Input.Listening = {}


function Input:AddListener(callback)
	Input.Listening[#Input.Listening + 1] = callback
end	

function Input.Hovered(drawing)
    local pX, pY, sX, sY = drawing.Position.X, drawing.Position.Y, drawing.Size.X, drawing.Size.Y
	local mouse = userInputService:GetMouseLocation()
	
	return mouse.X >= pX and mouse.X <= pX + sX and mouse.Y >= pY and mouse.Y <= pY + sY or false
end

userInputService.InputBegan:Connect(function(input)
	for _, callback in next, Input.Listening do
		callback(input)
	end
end)

return Input;
