local Draw = {}
Draw.ImageCache = {}
Draw.DrawingCache = {}

if not Drawing then 
    warn('Drawing API is not compatible!') 
    return
end


function Draw:HandleImageCache(url)
    if Draw.ImageCache[url] then
        return Draw.ImageCache[url]
    end
    local data = game:HttpGet(url)
    Draw.ImageCache[url] = data

    return data
end

function Draw:Text(visible, position, color, centered, text, outline)
    local Text = Drawing.new('Text')
    Text.Visible = true
    Text.Text = text
    Text.Size = 13
    Text.Position = position or Vector2.new()
    Text.Font = Drawing.Fonts.Plex
    Text.Center = centered or false
    Text.Outline = outline or false
    Text.OutlineColor = Color3.new(0, 0, 0)
    Text.Color = color or Color3.new(1, 1, 1)

    return Text
end

function Draw:Square(visible, position, size, color, centered, thickness)
    local Square = Drawing.new('Square')
    Square.Visible = visible or false
    Square.Thickness = thickness
    Square.Filled = true
    Square.Size = size
    Square.Position = position or Vector2.new()
    Square.Color = color or Color3.new(0, 0, 0)

	if centered then
		Square.Position = Square.Position - Vector2.new(Square.Size.X / 2, Square.Size.Y / 2)
	end

    return Square
end

function Draw:SquareOutline(visible, position, size, color, centered, thickness)
    local SquareOutline = Drawing.new('Square')
    SquareOutline.Visible = visible or true
    SquareOutline.Thickness = thickness
    SquareOutline.Filled = false
    SquareOutline.Size = size
    SquareOutline.Position = position or Vector2.new()
    SquareOutline.Color = color or Color3.new(0, 0, 0)

	if centered then
		SquareOutline.Position = SquareOutline.Position - Vector2.new(SquareOutline.Size.X / 2, SquareOutline.Size.Y / 2)
	end

    return SquareOutline
end

function Draw:Image(visible, position, size, color, centered, data)
    local Image = Drawing.new('Image')
    Image.Visible = visible or true
    Image.Size = size
    Image.Position = position
    Image.Data = Draw:HandleImageCache(data)

    return Image
end


function Draw:UpdatePosition(drawing, position)
    drawing.Position = position
end

function Draw:UpdateSize(drawing, size)
    drawing.Size = size
end

function Draw:UpdateVisibility(drawing, visible)
    drawing.Visible = visible
end


function Draw:ClearDrawingCache()
	for _, v in next, Draw.DrawingCache do
		v:Remove()
	end
end

return Draw;
