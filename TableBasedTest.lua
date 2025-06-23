local StateService = require(game.ReplicatedStorage.new)
local plr = {} -- dummy player

StateService:AddPlayer(plr)
local psm = StateService:Get(plr)

local iterationSets = {1000, 10000, 100000, 1000000}

for _, iterations in ipairs(iterationSets) do
	local startTime = os.clock()

	for i = 1, iterations do
		local isStunned = psm:Is("Stun")
		if not isStunned then
			psm:Set("Stun", 0.55)
		end
	end

	local duration = os.clock() - startTime
	print("-------------------------")
	print(string.format("(Table-Based): Iterations: %d -- Total: %.6f seconds, Per iteration: %.9f seconds", iterations, duration, duration / iterations))
end
