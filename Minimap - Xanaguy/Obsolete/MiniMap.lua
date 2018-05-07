RequiredScript = string.lower(RequiredScript)

if RequiredScript == "lib/managers/hudmanagerpd2" then

	local HUDManager_setup_player_info_hud_pd2_original = HUDManager._setup_player_info_hud_pd2
	local HUDManager_update_original = HUDManager.update

	HUDManager.HAS_MINIMAP = true
	
	function HUDManager:_setup_player_info_hud_pd2(...)
		HUDManager_setup_player_info_hud_pd2_original(self, ...)
		self:_setup_minimap()
	end

	function HUDManager:update(t, dt, ...)
		self._hud_minimap:update(t, dt)
		return HUDManager_update_original(self, t, dt, ...)
	end

	function HUDManager:_setup_minimap()
		local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
		self._hud_minimap = HUDMiniMap:new(hud.panel)
		self:set_minimap_enabled(self._hud_minimap:enabled())
	end
	
	function HUDManager:minimap_available()
		return self._hud_minimap:available()
	end

	function HUDManager:set_minimap_enabled(status)
		if self._set_custom_hud_chat_offset then
			self:_set_custom_hud_chat_offset(status and HUDMiniMap.HEIGHT or 0)
		end
		self._hud_minimap:set_enabled(status and true or false)
	end

	function HUDManager:set_minimap_zoom(zoom)
		self._hud_minimap:set_zoom(zoom)
	end

	function HUDManager:rotate_minimap(status)
		self._hud_minimap:set_rotate_with_player(status and true or false)
	end

	function HUDManager:register_minimap_item(class, name, ...)
		return self._hud_minimap:register_item(class, name, ...)
	end
	
	function HUDManager:minimap_item(name)
		return self._hud_minimap:item(name)
	end


	HUDMiniMap = HUDMiniMap or class()

	HUDMiniMap.WIDTH = 250
	HUDMiniMap.HEIGHT = 250

	HUDMiniMap._INDEX = {
		--SHADOW RAID
		kosugi = {
			--[[{
				index = 2,	--Roof
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.35,
				bounds = {
					x = { min = -3500, max = 650 },
					y = { min = -5000, max = -1000 },
					z = { min = 1600 },
				},
			},]]
			{
				index = 3,	--Upper floor
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.35,
				bounds = {
					x = { min = -3745, max = 595 },
					y = { min = -5595, max = -1255 },
					z = { max = 1600, min = 1150 },
				},
			},
			{
				index = 4,	--Ground floor
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.35,
				bounds = {
					x = { min = -3745, max = 595 },
					y = { min = -5595, max = -1255 },
					z = { max = 1150, --[[min = 780]] },
				},
			},
			{
				index = 1,	--Exterior
				type = "exterior",
				size = { w = 2048, h = 2048 },
				scale = 0.40,
			},
			elevations = {
				[1] = { max = 925 },
				[2] = { min = 925, max = 1324 },
				[3] = { min = 1324, max = 1762 },
				[4] = { min = 1762 },
			},
		},
		--FRAMING FRAME DAY 1 (+ ART GALLERY)
		framing_frame_1 = {
			{
				index = 1,	--Interior
				type = "interior",
				size = { w = 1024, h = 1024 },
				bounds = {
					x = { min = -2395, max = 2364 },
					y = { min = -2420, max = 2371 },
					z = { max = 450 },
				},
				scale = 0.5,
			},
			{
				index = 2,	--Exterior
				type = "exterior",
				size = { w = 1024, h = 1024 },
				scale = 0.5,
			},
			elevations = {
				[1] = { max = 450 },
				[2] = { min = 450 },
			},
		},
		--FRAMING FRAME DAY 3
		framing_frame_3 = {
			{
				index = 1,	--Lower floor
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.40,
				bounds = {
					z = { max = 3200 },
				},
			},
			{
				index = 2,	--Upper floor
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.40,
				bounds = {
					z = { max = 3650, min = 3200 },
				},
			},
			{
				index = 3,	--Roof
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.40,
			},
			elevations = {
				[1] = { max = 3362 },
				[2] = { min = 3362, max = 3750 },
				[3] = { min = 3750, max = 4100 },
				[4] = { min = 4100 },
			},
		},
		--BRANCH BANK (+ FIRESTARTER DAY 3)
		branchbank = {
			{
				index = 1,	--Interior
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.35,
				bounds = {
					x = { min = -3200, max = 0 },
					y = { min = 0, max = 3500 },
				},
			},
			{
				index = 2,	--Exterior
				type = "exterior",
				size = { w = 2048, h = 2048 },
				scale = 0.25,
			},
			elevations = {
				[1] = { max = 350 },
				[2] = { min = 350 },
			},
		},
		--THE BOMB: DOCKS
		crojob2 = {
			{
				index = 1,
				type = "exterior",
				size = { w = 2048, h = 2048 },
				scale = 0.4,
			},
			elevations = {
				[1] = { max = 400 },
				[2] = { min = 400, max = 800 },
				[3] = { min = 800 },
			},
		},
		--THE BOMB: FOREST
		crojob3 = {
			{
				index = 1,	--Road / south end (very inaccurate)
				type = "exterior",
				size = { w = 1024, h = 1024 },
				scale = 0.4,
				use_map_bounds = true,
			},
			{
				index = 2,	--Trains / north end
				size = { w = 1024, h = 1024 },
				scale = 0.4,
			},
		},
		--BIG BANK
		big = {
			{
				index = 5,	--Vault area lower floor
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.25,
				use_map_bounds = true,
				bounds = {
					x = { max = 50 },
					z = { max = -750 },
				},
			},
			{
				index = 4,	--Vault area upper floor
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.25,
				use_map_bounds = true,
				bounds = {
					x = { max = 400 },
					z = { min = -750, max = -100 },
				},
			},
			{
				index = 1,	--Entrance ground floor
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.25,
				bounds = {
					z = { max = -750 },
				},
			},
			{
				index = 2,	--Entrance upper floor
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.25,
				bounds = {
					z = { min = -750, max = -100 },
				},
			},
			{
				index = 3,	--Roof
				type = "exterior",
				size = { w = 2048, h = 2048 },
				scale = 0.2,
			},
			elevations = {
				[1] = { max = -550 },
				[2] = { min = -550, max = -150 },
				[3] = { min = -150, max = 900 },
				[4] = { min = 900 },
			},
		},
		--THE DIAMOND
		mus = {
			{
				index = 3,	--Basement
				type = "interior",
				size = { w = 2048, h = 1024 },
				scale = 0.7,
				bounds = {
					x = { min = -3200 },
					y = { min = -3500, max = 3800 },
					z = { max = -900 },
				},
			},
			{
				index = 2,	--Ground floor
				type = "interior",
				size = { w = 2048, h = 1024 },
				scale = 0.7,
				bounds = {
					x = { min = -3200 },
					y = { min = -3550, max = -600 },
					z = { min = -1100, max = -500 },
				},
			},
			{
				index = 1,	--Main floor
				type = "interior",
				size = { w = 2048, h = 1024 },
				scale = 0.7,
				bounding_boxes = {
					{
						x = { min = -3850 },
						y = { min = -600, max = 1000 },
						z = { min = -900 },
					},
					{
						x = { min = -1600, max = 200 },
						y = { min = 2600, max = 4400 },
					},
					{
						z = { min = -500 },
					},
				},
			},
			{
				index = 1,	--Exterior
				type = "exterior",
				size = { w = 2048, h = 1024 },
				scale = 0.5,
			},
			elevations = {
				[1] = { max = -850 },
				[2] = { min = -850, max = -400 },
				[3] = { min = -400 },
			},
		},
		--HOTLINE MIAMI DAY 1
		mia_1 = {
			{
				index = 3,	--Motel upper floor
				type = "exterior",
				size = { w = 1024, h = 512 },
				scale = 0.5,
				use_map_bounds = true,
				bounds = {
					x = { min = -650, max = 5600 },
					y = { min = -4450, max = -1400 },
					z = { min = 150 },
				},
			},
			{
				index = 2,	--Motel groud floor
				type = "exterior",
				size = { w = 1024, h = 512 },
				scale = 0.5,
				use_map_bounds = true,
				bounds = {
					x = { min = -650, max = 5600 },
					y = { min = -4450, max = -1400 },
					z = { max = 150 },
				},
			},
			{
				index = 2,	--Basement
				type = "interior",
				size = { w = 1024, h = 512 },
				scale = 0.5,
				--use_map_bounds = true,
				bounds = {
					z = { max = -200 },
				},
			},
			{
				index = 1,	--Overview
				type = "exterior",
				size = { w = 2048, h = 1024 },
				scale = 0.35,
			},
			elevations = {
				[1] = { max = -25 },
				[2] = { min = -25, max = 415 },
				[3] = { min = 415 },
			},
		},
		--HOTLINE MIAMI DAY 2
		mia_2 = {
			{
				index = 1,	--Ground floor
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.6,
				use_map_bounds = true,
				bounds = {
					z = { max = 200 },
				},
			},
			{
				index = 2,	--2nd floor
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.6,
				bounds = {
					z = { max = 600 },
				},
			},
			{
				index = 3,	--3rd floor
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.6,
				bounds = {
					z = { max = 1000 },
				},
			},
			{
				index = 4,	--4th floor
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.6,
				bounds = {
					z = { max = 1400 },
				},
			},
			{
				index = 5,	--Penthouse
				type = "interior",
				size = { w = 1024, h = 1024 },
				scale = 0.6,
			},
			elevations = {
				[1] = { max = 350 },
				[2] = { min = 350, max = 750 },
				[3] = { min = 750, max = 1150 },
				[4] = { min = 1150, max = 1550 },
				[5] = { min = 1500, max = 1950 },
				[6] = { min = 1950 },
			},
		},
		--GOLDEN GRIN CASINO
		kenaz = {
			{
				index = 2,	--Interior (fairly inaccurate north/south)
				type = "interior",
				size = { w = 1024, h = 2048 },
				scale = 0.6,
				use_map_bounds = true,
			},
		--	elevations = {
		--		[1] = { max = 350 },
		--		[2] = { min = 350, max = 750 },
		--	},
		},
		--BENEATH THE MOUNTAIN
		pbr = {
			{
				index = 1,	--Topside
				type = "interior",
				size = { w = 2048, h = 2048 },
				scale = 0.4,
				use_map_bounds = true,
				bounds = {
					z = { max = 500 },
				},
			},
			{
				index = 2,	--Mountain complex
				type = "exterior",
				size = { w = 2048, h = 2048 },
				scale = 0.5,
				bounds = {
					z = { min = 500 },
				},
			},
			elevations = {
				[1] = { max = 500 },
				[2] = { min = 500 },
			},
		},
	}

	HUDMiniMap._INDEX.gallery = deep_clone(HUDMiniMap._INDEX.framing_frame_1)	--ART GALLERY
	HUDMiniMap._INDEX.gallery.data_override = tweak_data.preplanning.locations.framing_frame_1
	HUDMiniMap._INDEX.firestarter_3 = deep_clone(HUDMiniMap._INDEX.branchbank)	--FIRESTARTER DAY 3
	HUDMiniMap._INDEX.firestarter_3.data_override = tweak_data.preplanning.locations.branchbank
	HUDMiniMap._INDEX.crojob3_night = deep_clone(HUDMiniMap._INDEX.crojob3)	--THE BOMB: FOREST (NIGHT)


	function HUDMiniMap:init(parent)
		self._parent = parent
		self._current_index = 0
		self._zoom = 1
		self._level = managers.job:current_level_id()
		self._level_data = self._level and (self._INDEX[self._level] and self._INDEX[self._level].data_override or tweak_data.preplanning.locations[self._level])
		self._enabled = self._level_data and true or false
		self._rotate_with_player = false
		self._map_objects = {}
		self._scheduled_for_deletion = {}
		
		self._panel = self._parent:panel({
			name = "map_panel",
			visible = self._enabled,
			w = self.WIDTH,
			h = self.HEIGHT,
		})

		if HUDManager.CUSTOM_TEAMMATE_PANEL then
			self._panel:set_bottom(self._parent:h())
			self._panel:set_right(self._parent:w())
		else
			self._panel:set_center(0, self._parent:h() / 2)
			self._panel:set_left(0)
		end

		self._map = self._panel:bitmap({
			name = "map",
			blend_mode = "add",
			w = self.WIDTH,
			h = self.HEIGHT,
			alpha = 0.5,
			layer = 1,
		})
		
		self._map_bg = self._panel:rect({
			blend_mode = "normal",
			color = Color.black,
			alpha = 0.5,
			h = self._panel:h(),
			w = self._panel:w(),
		})
		
		self._player_avatar = self._panel:text({
			align = "center",
			vertical = "center",
			text = "V",
			font = tweak_data.menu.pd2_small_font,
			font_size = 15,
			color = Color.green,
			blend_mode = "normal",
			layer = 1,
		})
	end
	
	function HUDMiniMap:available()
		return self._level_data and true or false
	end
	
	function HUDMiniMap:enabled()
		return self._enabled and true or false
	end

	function HUDMiniMap:set_enabled(status)
		if self._level_data then
			self._enabled = status
			self._panel:set_visible(status)
		end
	end

	function HUDMiniMap:set_zoom(zoom)
		self._zoom = math.max(zoom, 0)
	end

	function HUDMiniMap:set_rotate_with_player(status)
		self._rotate_with_player = status
	end

	function HUDMiniMap:update(t, dt)
		if not (self._enabled and self._level_data and managers.player:player_unit() and alive(managers.player:player_unit())) then
			return
		end
		
		local player_pos = managers.player:player_unit():position()
		if self:_check_bounds(player_pos) then
			self._player_rotation = managers.player:player_unit():camera():rotation():yaw()
			self._current_rotation = (self._current_map_tweak.rotation or 0) - (self._rotate_with_player and (self._current_map_tweak.rotation - self._player_rotation) or 0)
			local x, y, elevation = self:world_to_map_coordinates(player_pos.x, player_pos.y, player_pos.z)
			self:_update_map(x, y)
			self:_update_player_avatar(x, y)
			self:_update_map_objects(player_pos, elevation)
			
			self._map_bg:set_rotation(self._current_rotation)
			self._map:set_rotation(self._current_rotation)
		end
	end

	function HUDMiniMap:_update_map(x, y)
		self._left_bound = math.clamp(x - self.WIDTH / (2 * self._map_scale), 0, self._current_map.size.w - self.WIDTH / self._map_scale)
		self._top_bound = math.clamp(y - self.HEIGHT / (2 * self._map_scale), 0, self._current_map.size.h - self.HEIGHT / self._map_scale)
		
		self._map:set_image(self._current_map_tweak.texture, self._left_bound, self._top_bound, self.WIDTH / self._map_scale, self.HEIGHT / self._map_scale)
	end

	function HUDMiniMap:_update_player_avatar(absolute_x, absolute_y)
		local player_rotation = self._rotate_with_player and 0 or ((self._current_map_tweak.rotation or 0) - self._player_rotation)	
		self._player_avatar:set_rotation(180 + player_rotation)
		local x, y = self:get_relative_map_coordinates(absolute_x, absolute_y)
		x = math.clamp(x, - 3, HUDMiniMap.WIDTH + 3)
		y = math.clamp(y, - 3, HUDMiniMap.HEIGHT + 3)
		x, y = self:rotate_coordinates(x, y)
		self._player_avatar:set_center(x, y)
	end

	function HUDMiniMap:_update_map_objects(player_pos, player_elevation)
		for _, name in ipairs(self._scheduled_for_deletion) do
			if self._map_objects[name] then
				self:_delete_item(name)
			end
		end
		self._scheduled_for_deletion = {}
	
		for _, obj in pairs(self._map_objects) do
			obj:panel():set_visible(obj:update_position(player_pos, player_elevation))
			obj:apply_rotation(self._current_rotation)
		end
	end

	function HUDMiniMap:_check_bounds(pos)
		local function check_bounds(bounds, map_data)
			local bx = bounds and bounds.x or map_data.use_map_bounds and { min = self._level_data[map_data.index].x1, max = self._level_data[map_data.index].x2 }
			local by = bounds and bounds.y or map_data.use_map_bounds and { min = self._level_data[map_data.index].y1, max = self._level_data[map_data.index].y2 }
			local bz = bounds and bounds.z
			
			if	(not bx or ((not bx.min or bx.min <= pos.x) and (not bx.max or bx.max >= pos.x))) and
				(not by or ((not by.min or by.min <= pos.y) and (not by.max or by.max >= pos.y))) and
				(not bz or ((not bz.min or bz.min <= pos.z) and (not bz.max or bz.max >= pos.z))) then
					return true
			end
		end
		
		local function update_selected(index)
			if self._current_index ~= index then
				self._current_index = index
				self._current_map = self._INDEX[self._level][self._current_index]
				self._current_map_tweak = self._level_data[self._current_map.index]
				self._map_scale = self._zoom * (self._current_map.scale or 1)
			end
		end
		
		for i, map_data in ipairs(self._INDEX[self._level] or {}) do
			if map_data.bounding_boxes then
				for _, bounds in ipairs(map_data.bounding_boxes) do
					if check_bounds(bounds, map_data) then
						update_selected(i)
						return true
					end
				end
			elseif check_bounds(map_data.bounds, map_data) then
				update_selected(i)
				return true
			end
		end
		
		self._current_index = 0
		self._current_map = nil
		self._current_map_tweak = nil
		return false
	end
	
	function HUDMiniMap:_delete_item(name)
		--log_print("out.log", string.format("HUDMiniMap:_delete_item(%s)\n", tostring(name)))
		if alive(self._panel) then
			self._panel:remove(self._map_objects[name]:panel())
		end
		self._map_objects[name] = nil
	end





	function HUDMiniMap:register_item(class, name, ...)
		--log_print("out.log", string.format("HUDMiniMap:register_item(%s)\n", tostring(name)))
		if not self._map_objects[name] then
			--log_print("out.log", string.format("\tAdding item\n"))
			self._map_objects[name] = class:new(self, name, ...)
		end

		return self._map_objects[name]
	end

	function HUDMiniMap:item(name)
		return self._map_objects[name]
	end

	function HUDMiniMap:unregister_item(name)
		--log_print("out.log", string.format("HUDMiniMap:unregister_item(%s)\n", tostring(name)))
		if self._map_objects[name] then
			--log_print("out.log", string.format("\tScheduling item for deletion\n"))
			table.insert(self._scheduled_for_deletion, name)
		end
	end

	function HUDMiniMap:rotate_coordinates(x, y)
		local rot_x = x
		local rot_y = y
		
		if self._current_rotation ~= 0 then
			local tmp_x = rot_x - HUDMiniMap.WIDTH / 2
			local tmp_y = rot_y - HUDMiniMap.HEIGHT / 2
			local radius = math.sqrt((tmp_x)^2 + (tmp_y)^2)
			local angle = math.atan2((tmp_y), (tmp_x)) + self._current_rotation
			
			rot_x = radius * math.cos(angle) + HUDMiniMap.WIDTH / 2
			rot_y = radius * math.sin(angle) + HUDMiniMap.HEIGHT / 2
		end
		
		return rot_x, rot_y
	end

	function HUDMiniMap:world_to_map_coordinates(world_x, world_y, world_z)
		local map_x = self._current_map.size.w * (world_x - self._current_map_tweak.x1) / (self._current_map_tweak.x2 - self._current_map_tweak.x1)
		local map_y = self._current_map.size.h * (world_y - self._current_map_tweak.y2) / (self._current_map_tweak.y1 - self._current_map_tweak.y2)
		local elevation = 1
		
		if self._INDEX[self._level].elevations then
			for i, data in pairs(self._INDEX[self._level].elevations) do
				if (not data.max or world_z < data.max) and (not data.min or world_z >= data.min) then
					elevation = i
					break
				end
			end
		end
		
		return map_x, map_y, elevation
	end

	function HUDMiniMap:get_relative_map_coordinates(x, y)
		local relative_x = (x - self._left_bound) * self._map_scale
		local relative_y = (y - self._top_bound) * self._map_scale

		return relative_x, relative_y
	end

	function HUDMiniMap:world_coordinate_on_map(world_x, world_y, world_z, map)
		local map_tweak = map and self._level_data[map.index] or self._current_map_tweak
		return world_x >= map_tweak.x1 and world_x <= map_tweak.x2 and world_y >= map_tweak.y1 and world_y <= map_tweak.y2
	end

	function HUDMiniMap:relative_coordinate_on_map(x, y, map)
		local map = map or self._current_map
		return x >= 0 and x <= self.WIDTH and y >= 0 and y <= self.HEIGHT
	end


	
	
	
	
	
	
	HUDMiniMapItem = HUDMiniMapItem or class()

	function HUDMiniMapItem:init(map, name, params)
		self._map = map
		self._parent = map._panel
		self._name = name
		
		local params = params or {}
		self._unit = params.unit
		self._position = params.position
		self._show_offscreen = params.show_offscreen or false
		self._show_only_on_same_elevation = params.show_only_on_same_elevation or false
		
		self._panel = self._parent:panel({
			name = "minimap_panel_" .. name,
			visible = false,
			w = params.w or 0,
			h = params.h or 0,
		})
	end

	function HUDMiniMapItem:panel()
		return self._panel
	end

	function HUDMiniMapItem:delete()
		self._deleted = true
		self._map:unregister_item(self._name)
	end

	function HUDMiniMapItem:update_position(player_pos, player_elevation)
		if not self._unit or alive(self._unit) then
			self._position = self._unit and self:_get_unit_position() or self._position		
			
			if self._position then
				local map_x, map_y, elevation = self._map:world_to_map_coordinates(self._position.x, self._position.y, self._position.z)
				self._x, self._y = self._map:get_relative_map_coordinates(map_x, map_y)
				self._elevation = elevation
				local is_onscreen = self._map:relative_coordinate_on_map(self._x, self._y)
				
				if self._show_offscreen or is_onscreen then
					self._x = math.clamp(self._x, 3, HUDMiniMap.WIDTH - 3)
					self._y = math.clamp(self._y, 3, HUDMiniMap.HEIGHT - 3)
					self:_set_onscreen(is_onscreen)
					return true
				end
				
				return false
			end
		end
		
		self:delete()
		return false
	end
		
	function HUDMiniMapItem:apply_rotation(rotation)
		if not self._deleted and self._panel:visible() then
			local x, y = self._map:rotate_coordinates(self._x, self._y)
			self._panel:set_center(x, y)
		end
	end

	function HUDMiniMapItem:_set_onscreen(onscreen)
		--Placeholder
	end

	function HUDMiniMapItem:_get_unit_position()
		return self._unit:position()
	end




	HUDMiniMapUnitItem = HUDMiniMapUnitItem or class(HUDMiniMapItem)

	function HUDMiniMapUnitItem:init(map, name, unit, params)
		params.w = params.size or 12
		params.h = params.size or 12
		params.unit = unit

		HUDMiniMapItem.init(self, map, name, params)
		
		self._symbol = params.symbol or "V"
		
		self._avatar = self._panel:text({
			align = "center",
			vertical = "center",
			text = tostring(self._symbol),
			visible = true,
			font = tweak_data.menu.pd2_small_font,
			font_size = params.size or 12,
			color = params.color or Color.white,
			blend_mode = "normal",
			layer = 1,
		})
	end

	function HUDMiniMapUnitItem:update_position(player_pos, player_elevation)
		if HUDMiniMapItem.update_position(self, player_pos, player_elevation) then
			if self:_check_unit_okay() then
				if self._elevation ~= player_elevation then
					if self._show_only_on_same_elevation then
						return false
					end
					
					self._do_rotation = false
					self._avatar:set_alpha(0.75)
					self._avatar:set_text(self._elevation > player_elevation and "+" or "-")
				else
					self._do_rotation = true
					self._avatar:set_alpha(self._is_onscreen and 1 or 0.75)
					self._avatar:set_text(self._symbol)
				end
				
				return true
			else
				self:delete()
			end
		end
		
		return false
	end

	function HUDMiniMapUnitItem:apply_rotation(rotation)
		if not self._deleted and alive(self._unit) then
			local rot = self._do_rotation and ((self._is_player and 180 or 0) - self._unit:movement():m_head_rot():yaw() + rotation) or 0
			self._avatar:set_rotation(rot)
		end

		return HUDMiniMapItem.apply_rotation(self, rotation)
	end

	function HUDMiniMapUnitItem:_set_onscreen(onscreen)
		self._is_onscreen = onscreen
		self._avatar:set_alpha(onscreen and 1 or 0.75)
	end

	function HUDMiniMapUnitItem:_check_unit_okay()
		return alive(self._unit) and not self._unit:character_damage():dead() and not (self._exclude_slots and self._unit:in_slot(self._exclude_slots))
	end


	HUDMiniMapEnemyItem = HUDMiniMapEnemyItem or class(HUDMiniMapUnitItem)

	HUDMiniMapEnemyItem._exclude_slots = World:make_slot_mask(16, 22)

	function HUDMiniMapEnemyItem:init(map, name, unit)
		local params = { color = Color.red, symbol = "V" }
		
		HUDMiniMapUnitItem.init(self, map, name, unit, params)
	end

	HUDMiniMapCriminalItem = HUDMiniMapCriminalItem or class(HUDMiniMapUnitItem)

	function HUDMiniMapCriminalItem:init(map, name, unit)
		local data = managers.criminals:character_data_by_unit(unit)
		local peer_id = managers.criminals:character_color_id_by_unit(unit)
		self._is_player = data and not data.ai or false
		local params = { show_offscreen = true, color = peer_id and tweak_data.chat_colors[peer_id]:with_alpha(1) or Color.white, symbol = "V" }
		
		HUDMiniMapUnitItem.init(self, map, name, unit, params)
	end

	HUDMiniMapCivilianItem = HUDMiniMapCivilianItem or class(HUDMiniMapUnitItem)

	function HUDMiniMapCivilianItem:init(map, name, unit)
		local params = { color = Color.yellow, symbol = "V" }
		
		HUDMiniMapUnitItem.init(self, map, name, unit, params)
	end
	
	function HUDMiniMapCivilianItem:_check_unit_okay()
		return not self._unit:anim_data().tied and HUDMiniMapUnitItem._check_unit_okay(self)
	end

	HUDMiniMapCameraItem = HUDMiniMapCameraItem or class(HUDMiniMapUnitItem)

	function HUDMiniMapCameraItem:init(map, name, unit)
		local params = { w = 10, h = 10, color = Color(1, 0.64, 0), symbol = "c" }

		HUDMiniMapUnitItem.init(self, map, name, unit, params)
	end

	function HUDMiniMapCameraItem:apply_rotation(rotation)
		return HUDMiniMapItem.apply_rotation(self, rotation)
	end

	function HUDMiniMapCameraItem:_check_unit_okay()
		return self._unit:enabled() and not self._unit:base():destroyed()
	end

	
	
	
	
elseif RequiredScript == "lib/units/contourext" then

	local add_original = ContourExt.add
	local _clear_original = ContourExt._clear

	function ContourExt:add(type, ...)
		if managers.hud:minimap_available() and not string.find(type, "flash") then --Custom marking safeguard, ignore
			local key = alive(self._unit) and tostring(self._unit:key())
			local class
			
			if self._unit:in_slot(managers.slot:get_mask("civilians")) then
				class = HUDMiniMapCivilianItem
			elseif self._unit:in_slot(managers.slot:get_mask("enemies")) then
				class = HUDMiniMapEnemyItem
			elseif self._unit:base() and self._unit:base().security_camera then
				class = HUDMiniMapCameraItem
			end
			
			if key and class then
				managers.hud:register_minimap_item(class, key, self._unit)
			end
		end
	
		return add_original(self, type, ...)
	end
	
	function ContourExt:_clear(...)
		local key = alive(self._unit) and tostring(self._unit:key())
		if key and managers.hud:minimap_available() then
			local item = managers.hud:minimap_item(key)
			if item then
				item:delete()
			end
		end
	
		return _clear_original(self, ...)
	end
	
elseif RequiredScript == "lib/managers/criminalsmanager" then

	local set_unit_original = CriminalsManager.set_unit
	local add_character_original = CriminalsManager.add_character

	
	function CriminalsManager:set_unit(name, ...)
		set_unit_original(name, ...)
		
		if managers.hud:minimap_available() then
			for id, data in pairs(self._characters) do
				if data.name == name and data.unit ~= managers.player:player_unit() then
					local key = alive(data.unit) and tostring(data.unit:key())
					if key then
						managers.hud:register_minimap_item(HUDMiniMapCriminalItem, key, data.unit)
					end
					return
				end
			end
		end
	end
	
	function CriminalsManager:add_character(name, ...)
		add_character_original(self, name, ...)
	
		if managers.hud:minimap_available() then
			for id, data in pairs(self._characters) do
				if data.name == name and data.unit ~= managers.player:player_unit() then
					local key = alive(data.unit) and tostring(data.unit:key())
					if key then
						managers.hud:register_minimap_item(HUDMiniMapCriminalItem, key, data.unit)
					end
					return
				end
			end
		end
	end
	
end