function _update()
  player_update()
  player_animate()

  --simple camera
  -- cam_x=player.x-64+(player.w/2)
  -- if cam_x<map_start then
  --  cam_x=map_start
  -- end
  -- if cam_x>map_end-128 then
  --    cam_x=map_end-128
  -- end
  -- camera(cam_x,0)
  
  if player.x < cam_x then
  	cam_x -= scroll_step
  elseif player.x >= cam_x + scroll_step then
  	cam_x += scroll_step
  end
  
end

function _draw()
  cls(12)
  camera(cam_x, 0)
	map(0,0)
  spr(player.sp,player.x,player.y,1,1,player.flp)
end