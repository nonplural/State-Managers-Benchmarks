local statehandler_attr = {}

-- Set state as an Attribute with expiration timestamp
function statehandler_attr.imposestate(subject, state, duration)
	-- Set attribute 'state' to os.clock() + duration to track expiry time
	subject:SetAttribute(state, os.clock() + (duration or 0))
end

-- Check if state attribute exists and not expired
function statehandler_attr.checkforstate(states, subject)
	local now = os.clock()
	for _, state in ipairs(states) do
		local expiry = subject:GetAttribute(state)
		if expiry and expiry > now then
			return true
		end
	end
	return false
end

return statehandler_attr
