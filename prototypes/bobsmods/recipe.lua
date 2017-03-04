local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local i2r = item2recipes
local multiply = marathomaton.multiply
local recipes

-- undo some of the specific changes from base that we want to generalize to bobs
-- for instance undo the alien artifact science increase for all the different types of artifacts, since now you can self-produce them
if marathomaton.config.modify_science then
  recipes = i2r(cat2items({'tool'}))
  multiply('alien-artifact', 5.0, recipes)
end

-- see recipe-circuit
recipes = item2recipes({'electronic-circuit'})
multiply('__time__', 0.0625, recipes)
multiply('__inputs__', 0.33333333333333, recipes)

-- also multiply "t2" requirements for turrets slightly
multiply({'steel-plate', 'steel-gear-wheel'}, 2.0, item2recipes(cat2items({'ammo-turret', 'electric-turret', 'fluid-turret'})))
