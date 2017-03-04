local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply


-- 2x times and inputs
-- note that T1 battey is only 1.5x
local battery = {"lithium-ion-battery", "silver-zinc-battery"}
multiply({'__time__', '__inputs__'}, 2.0, i2r(battery))

-- result count to 8 from 12
local bball = {"nitinol-bearing-ball", "titanium-bearing-ball", "steel-bearing-ball", "ceramic-bearing-ball"}
multiply('__yield__' , 0.6666666, i2r(bball))

--  3x times and inputs
local bearing = { "ceramic-bearing", "steel-bearing", "titanium-bearing", "nitinol-bearing"}
multiply({'__time__', '__inputs__'}, 3.0, i2r(bearing))

-- 3x times of all gear wheels (alloy expansion happens in recipe-smelting)
local gear = { "brass-gear-wheel", "nitinol-gear-wheel", "steel-gear-wheel", "titanium-gear-wheel", "tungsten-gear-wheel" }
multiply('__time__', 3.0 , i2r(gear))

-- ignore this one -- bob isnt using it anymore
-- "cobalt-oxide-from-copper"

-- handle flying robot frames 2-4: 3.5x inputs
local frf = {"flying-robot-frame-2", "flying-robot-frame-3", "flying-robot-frame-4"}
multiply('__inputs__', 3.5, i2r(frf))

