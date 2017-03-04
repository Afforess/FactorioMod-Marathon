
local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- miscellaneous changes
multiply({'__time__', '__inputs__'}, 3.0, item2recipes({'bob-resin-oil', 'bob-rubber', 'gas-canister'}))
multiply('__time__', 5.0, item2recipes('bob-resin-wood'))
multiply('__yield__', 0.2, item2recipes("empty-canister"))


-- multiply "t2" requirements for turrets slightly, not as much as t1 reqs
multiply({'steel-plate', 'steel-gear-wheel'}, 2.0, item2recipes(cat2items({'ammo-turret', 'electric-turret', 'fluid-turret'})))

