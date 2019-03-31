script.on_event(defines.events.on_chart_tag_added, function(event)
    local tag = event.tag
    local text = tag.text
    local surface = tag.surface
    local position = tag.position

    local player = game.players[text] or game.players[event.player_index]

    if tag.icon and tag.icon.name == 'teleport-tag' then
        local new_position = surface.find_non_colliding_position('player', position, 128, 2)
        if new_position then
            local p_pos = player.position
            local distance = math.floor(((p_pos.x - new_position.x) ^ 2 + (p_pos.y - new_position.y) ^ 2) ^ 0.5)
            player.print('Traveled distance: ' .. distance)
            player.teleport(new_position, surface)
            tag.destroy()
        end
    end
end)
