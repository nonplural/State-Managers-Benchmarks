local statehandler_attr = require(game.ReplicatedStorage.old)

local dummySubject = Instance.new("Folder")
local iterationSets = {1000, 10000, 100000, 1000000}

for _, iterations in ipairs(iterationSets) do
	local startTime = os.clock()

	for i = 1, iterations do
		statehandler_attr.imposestate(dummySubject, "Stun", 0.55)
		local hasState = statehandler_attr.checkforstate({"Stun"}, dummySubject)
	end

	local duration = os.clock() - startTime
	print("-------------------------")
	print(string.format("(Instance-Based): Iterations: %d -- Total: %.6f seconds, Per iteration: %.9f seconds", iterations, duration, duration / iterations))
end
