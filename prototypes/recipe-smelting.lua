local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- slow down all smelting
marathomaton.slowdown_recipe_category({['smelting']=2.0})

-- dont slow iron down that much since it's getting exploded below
multiply('__time__', 0.5, i2r({'iron-plate'}))
-- fine adjustment for early game
multiply('__time__', 0.9, i2r({'copper-plate'}))

-- 2.5x stone brick inputs
multiply('__inputs__', 2.5, i2r({'stone-brick'}))

-- create smelting bottlenecks 
marathomaton.modify_all_yields(2.5, 'iron-plate')
marathomaton.modify_all_recipes('iron-plate', 2.5)
data.raw.item['iron-plate'].stack_size = data.raw.item['iron-plate'].stack_size * 2.5

marathomaton.modify_all_yields(5, 'copper-plate')
marathomaton.modify_all_recipes('copper-plate', 5)
data.raw.item['copper-plate'].stack_size = data.raw.item['copper-plate'].stack_size * 5

