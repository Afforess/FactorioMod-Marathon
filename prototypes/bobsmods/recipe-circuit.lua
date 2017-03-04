local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- firstly, the boards
---- wooden     : 5x time, .5x yield
---- phenolic   : .5x yield, 2x cost
---- fiberglass : .5x yield
-- next the circuit boards
---- basic      : 8x time, 3x upgrade
---- circuit    : 3x upgrade
---- superior   : 3x upgrade
---- multi-layer: 3x upgrade
-- next the electronic boards
---- electronic circuit : 2.5x time, 2x upgrade
---- advanced circuit   : 1.6x time, 1.75x upgrade
---- processing unit    : 1.5x time, 2x upgrade
---- advanced processing: 1.6x time, 1.75x upgrade
-- finally components
---- solder       : 2x time, 0.333x yield
---- basic        : 2x time, 0.333x yield
---- electronic   : 3x costs
---- intergrated  : 3x costs
---- processing   : 3x costs
-- summary : 
---- boards .5x yield, 
---- circuit boards 3x upgrade costs,
---- electronic boards 1.6x time, 1.75x (rounded??) upgrade costs,
---- components 3x costs,
---- T1 items all additional 6x slower,
---- phenolic also 3x cost cuz its weird

-- TODO automatically generate these
local boards = {'wooden-board', 'phenolic-board', 'fibreglass-board'}
local circuit_boards = {"basic-circuit-board", "circuit-board", "superior-circuit-board", "multi-layer-circuit-board"}
local electronic_boards = {"electronic-circuit",  "advanced-circuit", "processing-unit",  "advanced-processing-unit"}

multiply('__time__', 6.0, i2r(boards))
multiply('__yield__', 0.5, i2r(boards))
multiply('__inputs__', 3.0, i2r({'phenolic-board'}))

multiply('__time__', 2.4, i2r(circuit_boards))
multiply('__inputs__', 3.0, i2r(circuit_boards))
multiply(boards, 0.33333333, i2r(circuit_boards))

multiply('__time__', 4.0, i2r(electronic_boards))
multiply('__inputs__', 1.75, i2r(electronic_boards))
-- multiply(circuit_boards, 0.5, i2r(electronic_boards))

multiply('__time__', 2.0, i2r({"solder", "basic-electronic-components"}))
multiply('__yield__', 0.333333333, i2r({"solder", "basic-electronic-components"}))
multiply('__inputs__', 3.0, i2r({"electronic-components", "intergrated-electronics", "processing-electronics"}))

multiply('__time__', 2.5, i2r({ circuit_boards[1], electronic_boards[1] }))

