
script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  player.insert({name='iron-plate', count=1})
end)

--[[
function detect_marathon()
  if marathomaton.incompatible == true then
    game.print("Error detected! Marathomaton is incompatible with marathon mod. Changes have not been applied.") 
  end 
end

script.on_configuration_changed(detect_marathon)
--]]


