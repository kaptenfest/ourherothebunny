function _init()
	player={
		sp=1,
		x=10,
		y=100,
		w=8,
		h=8,
		flp=false,
		dx=0,
		dy=0,
		max_dx=2,
		max_dy=3,
		acc=0.5,
		boost=4,
		anim=0,
		running=false,
		jumping=false,
		falling=false,
		sliding=false,
		landed=false
	}

	gravity=0.3
	friction=0.85
	
	tile_size=8
	screen_tiles=16
	scroll_step=screen_tiles*tile_size
	
	--simple camera
	cam_x=0

	target_cam_x = 0


	--map limits
	-- map_start=0
	-- map_end=1024
	
end
