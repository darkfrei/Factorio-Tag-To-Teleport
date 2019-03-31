

function on_chart_tag_added (event)
  local tag = event.tag
  local text = tag.text
  local icon = tag.icon
  local surface = tag.surface
  local position = tag.position
  
  -- game.print (text)
  local player = game.players[text] or game.players[event.player_index]

  if tag.icon and tag.icon.name == 'teleport-tag' then
    
    local new_position = surface.find_non_colliding_position('player', position, 128, 2)
    if new_position then
      local p_pos = player.position
      local distance = math.floor(((p_pos.x-new_position.x)^2 + (p_pos.y-new_position.y)^2)^0.5)
      player.print ('Traveled distance: '..distance)
      player.teleport(new_position, surface)
      tag.destroy()
    end
  end
end



script.on_event(defines.events.on_chart_tag_added, on_chart_tag_added)
-- tag :: LuaCustomChartTag
-- force :: LuaForce
-- player_index :: uint (optional)


-- script.on_event(defines.events.on_tick, on_tick)
