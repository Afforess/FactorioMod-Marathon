local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

local function keys_array(dict)
  to_ret = {}
  for key, _ in pairs(dict) do
    table.insert(to_ret, key)
  end
  return to_ret
end

local expansion_rate = { 2.5, 2.5, 2.5, 3.0, 3.0, 3.5, 4.0, 4.0, 5.0, 5.0, 5.0, 5.0, 6.0, 6.0, 6.0 }
local stack_rate     = { 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0 }

local function explode_all(_items)
  local items = keys_array(_items)
  -- sort by [item].order and use increasing expansion rate (2.5, 2.5, 3, 3, ..)
  table.sort(items, function(a,b) return data.raw.item[a].order < data.raw.item[b].order end)
  -- log(serpent.block(items))
  for i, item in ipairs(items) do
    -- change every recipe that produces this item to now produce multipler times more of the item,
    -- and if the result is not an integer, multiply each ingredient, time, result of the recipe to compensate
    marathomaton.modify_all_yields(expansion_rate[i], item)
    -- now make everything that uses this item consume multiplier times more
    marathomaton.modify_all_recipes(item, expansion_rate[i])
    -- also increase the stack size
    data.raw.item[item].stack_size = data.raw.item[item].stack_size * stack_rate[i]
  end
end

-- dont ignore cheaper steel setting - just use our multiplier
-- also increase smelting machine costs?? no

-- slow down all smelting recipes by 2x -- already done in ../recipe.lua
-- other smelting categories
local smelting = {
  ['mixing-furnace']    =1.5, -- affects alloy plates
  ['chemical-furnace']  =2.0, -- chemical plates and powders
  ['blast-smelting']    =2.5, -- making angel ingot
  ['induction-smelting']=3.0, -- making angel molten
  ['casting']           =3.5, -- affects angel plates
  ['ore-processing']    =4.0, -- making angel processed ore
  ['pellet-pressing']   =5.0, -- making angel processed pellet
  ['liquifying']        =6.0, -- making chemical liquid angel stuffs
}
marathomaton.slowdown_recipe_category(smelting)

-- create smelting bottlenecks for all these plate types: (no iron or copper here)
explode_all(subgroup2items({'bob-material'}))
explode_all(subgroup2items({'bob-alloy'}))
-- explode_all(subgroup2items({'bob-resource'}))
explode_all({['carbon']=true, ['glass']=true, ['resin']=true, ['rubber']=true})

