
inventory = {0,0,0,64,0,0}
selected_item = 2

function gs.init(self)
	pal({1, -13, 3, -5, 11, -6}, 1)
end

-- UPDATE
function gs.update_inventory(self)
	if mouse_click() == 1 then
		local pos = mouse_pos()
		if mid(109, pos[2], 125) == pos[2] then
			selected_item = pos[1] \ 18
		end
	end
end


function gs.update(self)
	self:update_inventory()
end


-- DRAW
function gs.draw_cursor(self)
	local pos = mouse_pos()
	spr( 1, pos[1], pos[2] )
end


function gs.draw_inventory(self)
	rectfill( 0, 107, 127, 127, 4)
	
	for i = 1,6 do
		local c = 5
		if selected_item == i then c = 3 end
		rectfill(i*18 + 1, 109, i*18 + 17, 125, c)
		rect(i*18 + 1, 109, i*18 + 17, 125, 2)
	end

	for i=1,#inventory do
		local item = inventory[i]
		if item > 0 then
			spr(item, i*18 + 1, 109, 2, 2 )
		end
	end

	rect( 0, 107, 127, 127, 2)
end


function gs.draw(self)
	cls()
	self:draw_inventory()
	self:draw_cursor()
	for i=0,6 do
		rect(i*2, 0, i*2+1, 2, i)
	end
end