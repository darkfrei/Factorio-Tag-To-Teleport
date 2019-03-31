script.on_event(defines.events.on_chart_tag_added, function(event)
    if not event.tag.icon or event.tag.icon.name ~= "teleport-tag" then
        return
    end

    local player = game.players[event.player_index]

    if event.tag.text == "" then
        teleport_player(player, event.tag)
        event.tag.destroy()
    else
        create_fixed_teleport_location(player, event.tag)
    end
end)

script.on_event(defines.events.on_chart_tag_modified, function(event)
    -- TODO if it was a fixed teleport location
        -- if its name got changed to invalid, delete tag and remove it from globals
        -- if its name got changed to valid one but it's a duplicate, delete tag and remove it from globals
        -- if its name got changed to valid one, change its position in globals
end)

script.on_event(defines.events.on_chart_tag_removed, function(event)
    -- TODO if it was a fixed teleport location, remove it from globals
end)


function create_fixed_teleport_location(player, tag)
    local first_char = string.sub(tag.text, 1, 1)
    local number = tonumber(first_char)

    if number == nil then
        player.print("Invalid name! First character must be a digit!")
        tag.destroy()
        do return end
    end

    global.teleports = global.teleports or {}
    if global.teleports[number] then
        player.print("Teleport " .. number .. " already exists!")
        tag.destroy()
    else
        game.print("Teleport '" .. tag.text .. "' created")
        global.teleports[number] = tag
    end
end

function teleport_player(player, tag)
    local position = tag.surface.find_non_colliding_position('player', tag.position, 128, 2)

    if position then
        player.print("Traveled distance: " .. distance(player.position, position))
        player.teleport(position, tag.surface)
    else
        player.print("No valid position found nearby that location!")
    end
end


function distance(position_1, position_2)
    return math.floor(((position_1.x - position_2.x) ^ 2 + (position_1.y - position_2.y) ^ 2) ^ 0.5)
end
