local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local StateService = {}
local playerStates = {}


local function createStateMachine()
	return {
		current = nil,
		timer = 0,
		Set = function(self, state, duration)
			self.current = state
			self.timer = duration or 0
		end,
		Is = function(self, state)
			return self.current == state
		end,
		Update = function(self, dt)
			if self.timer > 0 then
				self.timer -= dt
				print(self.timer)
				if self.timer <= 0 then
					self.current = nil	
				end
			end
		end
	}
end


function StateService:AddPlayer(player)
	
	playerStates[player] = createStateMachine()

end

function StateService:RemovePlayer(player)
	playerStates[player] = nil
end

function StateService:Get(player)
	return playerStates[player]
end


RunService.Heartbeat:Connect(function(dt)
	for _, state in pairs(playerStates) do
		state:Update(dt)
	end
end)



return StateService
