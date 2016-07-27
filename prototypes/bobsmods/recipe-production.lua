Recipe.select('air-pump').apply('energy_required', 5).ingredients =
{
	{type="item", name="iron-plate", amount=10},
	{type="item", name="iron-gear-wheel", amount=10},
	{type="item", name="electronic-circuit", amount=10},
	{type="item", name="pipe", amount=10},
}

Recipe.select('air-pump-2').ingredients =
{
	{type="item", name="air-pump", amount=1},
	{type="item", name="steel-plate", amount=10},
	{type="item", name="steel-gear-wheel", amount=10},
	{type="item", name="advanced-circuit", amount=8},
	{type="item", name="pipe", amount=6},
}

Recipe.select('chemical-plant').ingredients =
{
	{type="item", name="steel-plate", amount=20},
	{type="item", name="iron-gear-wheel", amount=30},
	{type="item", name="electronic-circuit", amount=10},
	{type="item", name="pipe", amount=15},
}

if data.raw.item['steel-bearing'] and data.raw.item['steel-gear-wheel'] and data.raw.item['glass'] then
	Recipe.select('chemical-plant-2').ingredients =
	{
		{type="item", name="chemical-plant", amount=1},
		{type="item", name="glass", amount=15},
		{type="item", name="steel-bearing", amount=30},
		{type="item", name="steel-gear-wheel", amount=15},
		{type="item", name="advanced-circuit", amount=8},
		{type="item", name="pipe", amount=10},
	}
end

Recipe.select('electrolyser').ingredients =
{
	{type="item", name="stone-brick", amount=10},
	{type="item", name="electronic-circuit", amount=10},
	{type="item", name="pipe", amount=15},
}

Recipe.select('electrolyser-2').ingredients =
{
	{type="item", name="electrolyser", amount=1},
	{type="item", name="glass", amount=15},
	{type="item", name="steel-plate", amount=30},
	{type="item", name="advanced-circuit", amount=8},
	{type="item", name="pipe", amount=10},
}

Recipe.select('water-pump').apply('energy_required', 7).ingredients =
{
	{type="item", name="iron-plate", amount=10},
	{type="item", name="iron-gear-wheel", amount=15},
	{type="item", name="electronic-circuit", amount=10},
	{type="item", name="pipe", amount=20},
}

Recipe.select('water-pump-2').ingredients =
{
	{type="item", name="water-pump", amount=1},
	{type="item", name="steel-plate", amount=10},
	{type="item", name="steel-gear-wheel", amount=10},
	{type="item", name="advanced-circuit", amount=8},
	{type="item", name="pipe", amount=15},
}

Recipe.select('void-pump').ingredients =
{
	{type="item", name="iron-plate", amount=10},
	{type="item", name="iron-gear-wheel", amount=15},
	{type="item", name="electronic-circuit", amount=10},
	{type="item", name="pipe", amount=10},
}

if data.raw.item["basic-circuit-board"] then
	Recipe.select('electrolyser:ingredients:electronic-circuit').name = 'basic-circuit-board'
end

if data.raw.item["steel-pipe"] then
	Recipe.select('chemical-plant-2:ingredients:pipe').name = 'steel-pipe'
end

if data.raw.item["stone-pipe"] then
	Recipe.select('electrolyser:ingredients:pipe').name = 'stone-pipe'
end

if data.raw.item["plastic-pipe"] then
	Recipe.select('electrolyser-2:ingredients:pipe').name = 'plastic-pipe'
end

if data.raw.item["copper-pipe"] then
	Recipe.select('air-pump:ingredients:pipe').name = 'copper-pipe'
	Recipe.select('water-pump:ingredients:pipe').name = 'copper-pipe'
	Recipe.select('void-pump:ingredients:pipe').name = 'copper-pipe'
end

if data.raw.item["bronze-pipe"] then
	Recipe.select('air-pump-2:ingredients:pipe').name = 'bronze-pipe'
	Recipe.select('water-pump-2:ingredients:pipe').name = 'bronze-pipe'
end
