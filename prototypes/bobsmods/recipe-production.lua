local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- air, water, void pumps : 3.5x upgrade, 2.5x time costs
-- most other buildings (eg chemical, electrolysers): 2.25x upgrade costs

local pumps = i2r(subgroup2items('bob-pump'))
multiply('__upgrade__', 3.5, pumps)
multiply('__time__', 2.5, pumps)

-- unfortunately bob pumps are coded as assembling machines so we have to fix this
-- multiply('__time__', 0.5, pumps)
-- multiply('__upgrade__', 0.166666666, pumps)


