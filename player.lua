function player_update()

	--physics
	player.dy+=gravity
	player.dx*=friction

	--controls

	if btn(⬅️) then
		player.running=true
		player.dx-=player.acc
		player.flp=true
	end

	if btn(➡️) then
		player.running=true
		player.dx+=player.acc
		player.flp=false
	end

  --slide
	if player.running
	and not btn(⬅️)
	and not btn(➡️)
	and not player.falling
	and not player.jumping then
		player.running=false
		player.sliding=true
	end

  --jump
	if btnp(❎)
	and player.landed then
		player.dy-=player.boost
		player.landed=false
	end

  --check collision up and down
	if player.dy>0 then
		player.falling=true
		player.landed=false
		player.jumping=false

		player.dy=limit_speed(player.dy,player.max_dy)

		if coll_map(player,"down",0) then
			player.landed=true
			player.falling=false
			player.dy=0
			player.y-=((player.y+player.h+1)%8)-1
		end
	elseif player.dy<0 then
		player.jumping=true
		if coll_map(player,"up",1) then
			player.dy=0
		end
	end

	--check collision left and right
	if player.dx<0 then

		player.dx=limit_speed(player.dx,player.max_dx)

		if coll_map(player,"left",1) then
			player.dx=0
		end
	elseif player.dx>0 then

		player.dx=limit_speed(player.dx,player.max_dx)

		if coll_map(player,"right",1) then
			player.dx=0
		end
	end

  --stop sliding
	if player.sliding then
		if abs(player.dx)<.2
		or player.running then
			player.dx=0
			player.sliding=false
		end
	end

	player.x+=player.dx
	player.y+=player.dy

  --limit player to map
	-- if player.x<map_start then
	-- 	player.x=map_start
	-- end
	-- if player.x>map_end-player.w then
	-- 	player.x=map_end-player.w
	-- end
end

function player_animate()
	if player.jumping then
		player.sp=8
	elseif player.falling then
		player.sp=11
	elseif player.sliding then
		player.sp=9
	elseif player.running == true then
		if time()-player.anim>.08 then
			player.anim=time()
			player.sp+=1
			if player.sp>8 then
				player.sp=5
			end
		end
	else --player idle
		if time()-player.anim>.1 then
			player.anim=time()
			player.sp+=1
			if player.sp>4 then
				player.sp=1
			end
		end
	end
end

function limit_speed(num,maximum)
	return mid(-maximum,num,maximum)
end