-- log(serpent.block(data.raw.recipe))

if marathon ~= nil then
  log('Error! Marathon mod detected -- cannot continue.')
  marathomaton.incompatible = true
else
  marathomaton.incompatible = false
  require("prototypes.item")
  require("prototypes.recipe")
  require("prototypes.recipe-smelting")
  
  if bobmods and bobmods.config then
	  require("prototypes.bobsmods.recipe")
	  require("prototypes.bobsmods.recipe-circuit")
	  require("prototypes.bobsmods.recipe-misc")
	  require("prototypes.bobsmods.recipe-production")
	  require("prototypes.bobsmods.recipe-logistics")
	  -- require("prototypes.bobsmods.recipe-power")
	  require("prototypes.bobsmods.recipe-intermediate")
	  require("prototypes.bobsmods.recipe-smelting")
  end
end




