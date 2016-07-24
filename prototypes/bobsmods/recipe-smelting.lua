if bobmods.config.plates and bobmods.config.plates.CheaperSteel then
	-- Ignore cheaper steel setting
	Recipe.select('steel-plate').apply('energy_required', 27.5).ingredients = {{"iron-plate", 10}}
end
