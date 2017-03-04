local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- 2.5x usage of respective alloy in respective pipe
-- beware of rounding errors

local pipe = cat2items('pipe')
local pipe_ground = subgroup2items({'pipe-to-ground'})
multiply('__inputs__', 2.5, item2recipes(pipe))
multiply(pipe, 2, item2recipes(pipe_ground))
multiply('__inputs__', 2.5, item2recipes(pipe_ground))
multiply(pipe, 0.2, item2recipes(pipe_ground))

