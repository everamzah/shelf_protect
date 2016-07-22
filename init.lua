local bookshelf_formspec =
	"size[8,8]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_name;books;0,0.3;8,2]" ..
	"list[current_name;protection;3.5,2.5;1,1]" ..
	"list[current_player;main;0,3.85;8,1]" ..
	"list[current_player;main;0,5.08;8,3;8]" ..
	"listring[current_name;books]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 3.85)

minetest.override_item("default:bookshelf", {
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", bookshelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("books", 8*2)
		inv:set_size("protection", 1)
	end,
	can_dig = function(pos, player)
		local inv = minetest.get_meta(pos):get_inventory()
		return (inv:is_empty("books") and inv:is_empty("protection"))
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local inv = minetest.get_meta(pos):get_inventory()
		if inv:get_stack("protection", 1):get_name() == "protector:protect2" and
				minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end

		if from_list == "books" and to_list == "books" then
			return count
		else
			return 0
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local inv = minetest.get_meta(pos):get_inventory()
		if listname == "protection" and
				stack:get_name() == "protector:protect2" and
				inv:get_stack("protection", 1):is_empty() and
				not minetest.is_protected(pos, player:get_player_name()) then
			return 1
		end

		if inv:get_stack("protection", 1):get_name() == "protector:protect2" and
				minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end

		if listname == "books" and
				minetest.get_item_group(stack:get_name(), "book") ~= 0 then
			return stack:get_count()
		else
			return 0
		end
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local inv = minetest.get_meta(pos):get_inventory()
		if inv:get_stack("protection", 1):get_name() == "protector:protect2" and
				minetest.is_protected(pos, player:get_player_name()) then
			return 0
		else
			return stack:get_count()
		end
	end,
})

local vessels_shelf_formspec =
	"size[8,8]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_name;vessels;0,0.3;8,2]" ..
	"list[current_name;protection;3.5,2.5;1,1]" ..
	"list[current_player;main;0,3.85;8,1]" ..
	"list[current_player;main;0,5.08;8,3;8]" ..
	"listring[current_name;vessels]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0, 3.85)

minetest.override_item("vessels:shelf", {
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", vessels_shelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8*2)
		inv:set_size("protection", 1)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return (inv:is_empty("vessels") and inv:is_empty("protection"))
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local inv = minetest.get_meta(pos):get_inventory()
		if inv:get_stack("protection", 1):get_name() == "protector:protect2" and
				minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end

		if from_list == "vessels" and to_list == "vessels" then
			return count
		else
			return 0
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local inv = minetest.get_meta(pos):get_inventory()
		if listname == "protection" and
				stack:get_name() == "protector:protect2" and
				inv:get_stack("protection", 1):is_empty() and
				not minetest.is_protected(pos, player:get_player_name()) then
			return 1
		end

		if inv:get_stack("protection", 1):get_name() == "protector:protect2" and
				minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end

		if listname == "vessels" and
				minetest.get_item_group(stack:get_name(), "vessel") ~= 0 then
			return stack:get_count()
		else
			return 0
		end
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local inv = minetest.get_meta(pos):get_inventory()
		if inv:get_stack("protection", 1):get_name() == "protector:protect2" and
				minetest.is_protected(pos, player:get_player_name()) then
			return 0
		else
			return stack:get_count()
		end
	end,
})
