local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local i2r = item2recipes
local multiply = marathomaton.multiply
local replace2item = marathomaton.get_items_from_category_replaceable

local recipes


-- half yield on all products of products of crude oil
marathomaton.modify_all_yields(0.5, 'sulfur')
marathomaton.modify_all_yields(0.5, 'lubricant')
multiply('__inputs__', 2.0, i2r({'solid-fuel'}))
marathomaton.modify_all_recipes('plastic-bar', 2)

-- slow down all science
if marathomaton.config.modify_science then
  recipes = i2r(cat2items({'tool'}))
  multiply('__time__', 2.5, recipes)
  multiply('__inputs__', 5, recipes)
  -- except ones that require alien artifacts
  multiply('alien-artifact', 0.2, recipes)
end

-- slow down some select intermediates
multiply('__time__', 3.0, i2r({'iron-gear-wheel'}))
recipes = i2r({'copper-cable'})
multiply('__time__', 4.0, recipes)
multiply('__inputs__', 2.0, recipes)
recipes = i2r({'electronic-circuit'})
multiply('__time__', 16.0, recipes)
multiply('__inputs__', 3.0, recipes)
marathomaton.modify_all_yields(0.5, 'sulfuric-acid')
recipes = i2r({'battery'})
multiply('__time__', 1.5, recipes)
multiply('__inputs__', 1.5, recipes)
multiply('__inputs__', 3.5, i2r({'flying-robot-frame'}))


------- building slowdowns
-- slow down early burner game. TODO autodetect all burners
multiply('iron-gear-wheel', 2.0, i2r({'burner-inserter', 'inserter', 'long-handed-inserter', 'burner-mining-drill', 'burner-assembling-machine'}))

-- slower assmebling machines
local buildings = i2r(replace2item('assembling-machine', 'assembling-machine'))
multiply('__upgrade__', 6.0, buildings)
multiply('__time__', 6.0, buildings)

-- all labs and mining drills 
multiply({'__time__', '__upgrade__'}, 6.0, i2r(cat2items({'lab'})))
multiply({'__time__', '__upgrade__'}, 6.0, i2r(replace2item('mining-drill', 'mining-drill')))
-- except for burner
multiply({'__time__', '__upgrade__'}, 0.166666, i2r({'burner-mining-drill'}))

-- slow down T1 electricity
local pipe = cat2items('pipe')
local boiler = i2r(cat2items('boiler'))
multiply('__upgrade__', 2.0, boiler)
multiply(pipe, 7.5, boiler)
local steam_engine = i2r(cat2items({'generator'}))
multiply('__time__', 60.0, steam_engine)
multiply('__upgrade__', 4.0, steam_engine)
multiply('__upgrade__', 4.0, i2r({'steam-engine'}))

-- slow down T2 electricity
multiply({'__upgrade__', '__time__'}, 2.0, i2r(cat2items({'accumulator' , 'solar-panel'})))

-- make getting military harder in early game
multiply({'iron-gear-wheel', 'iron-plate'}, 2.0, i2r(cat2items({'gun', 'ammo', 'capsule'})))
multiply({'iron-gear-wheel', 'iron-plate'}, 5.0, i2r(cat2items({'ammo-turret', 'electric-turret', 'fluid-turret'})))

