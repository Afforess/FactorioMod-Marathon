
-- all fuel is 50% as efficient
local fuel_value_multiplier = 0.5

for item_name, item_props in pairs(data.raw.item) do
  if item_props['fuel_value'] ~= nil then
    s = item_props['fuel_value']
    if string.sub(s, #s - 1, #s) == 'MJ' then
      n = 0 + string.sub(s, 1, #s-2)
      s = (n * fuel_value_multiplier) .. 'MJ'
    end
    item_props['fuel_value'] = s
  end
end

-- double stack size for pipe (since it's used heavily in boiler+engine)
-- might as well do it for all pipes, for consistency

for item_name, item_props in pairs(data.raw.item) do
  if item_props.subgroup == 'pipe' then
    item_props.stack_size = item_props.stack_size * 2
  end
end
