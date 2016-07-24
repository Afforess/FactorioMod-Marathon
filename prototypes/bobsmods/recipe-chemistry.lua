Recipe.select("alumina").apply('energy_required', 6).apply('result_count', 6).ingredients =
{
	{type="item", name="sodium-hydroxide", amount=10},
	{type="item", name="bauxite-ore", amount=2},
}

if bobmods.config.plates.BatteryUpdate and data.raw.item["lead-plate"] and data.raw.item["sulfuric-acid"] then
	Recipe.select("battery").ingredients =
	{
		{type="item", name="lead-plate", amount=4},
		{type="fluid", name="sulfuric-acid", amount=4},
		{type="item", name="plastic-bar", amount=2}
	}
end

Recipe.select("coal-cracking").apply('energy_required', 6).apply('results',
{
	{type="fluid", name="heavy-oil", amount=0.8}
}).ingredients =
{
	{type="item", name="coal", amount=3},
	{type="fluid", name="water", amount=2}
}

Recipe.select("ferric-chloride-solution").apply('energy_required', 5).results =
{
	{type="fluid", name="ferric-chloride-solution", amount=3}
}

Recipe.select("liquid-fuel").apply('energy_required', 3).ingredients =
{
	{type="fluid", name="light-oil", amount=3}
}

Recipe.select("lithium-chloride").apply('energy_required', 2).ingredients =
{
	{type="fluid", name="lithia-water", amount=5}
}

Recipe.select("sulfur-2").energy_required = 1.5

Recipe.select("sulfuric-acid-2").apply('results',
{
	{type="fluid", name="sulfuric-acid", amount=1}
}).ingredients =
{
	{type="fluid", name="water", amount=1},
	{type="fluid", name="sulfur-dioxide", amount=1},
}
