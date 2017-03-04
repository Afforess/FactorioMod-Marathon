local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- for all the boilers 1-4 : increase upgrade costs by 2 and pipe costs by a further 6
-- for all (fast, slow, large, vanilla) accumulators : increase upgrade costs 2x, time by 2
-- for solar panels: 2x time, 2x upgrade costs
-- for steam engines 1-4: 60x time, 4x upgrade costs
-- for steam engine 1: an additional 4x upgrade cost

local pipe = cat2items('pipe')
local boiler = i2r(cat2items('boiler'))

multiply('__upgrade__', 2.0, boiler)
multiply(pipe, 6.0, boiler)
multiply({'__upgrade__', '__time__'}, 2.0, i2r(cat2items({'accumulator' , 'solar-panel'})))
local steam_engine = i2r(cat2items({'generator'}))
multiply('__time__', 60.0, steam_engine)
multiply('__upgrade__', 4.0, steam_engine)
multiply('__upgrade__', 4.0, i2r({'steam-engine'}))

