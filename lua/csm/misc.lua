local csm = SF.csm

-- Starfall
function csm.starfall_processor:quotaUsed()
	return self.instance.cpu_total
end

function csm.starfall_processor:quotaAverage()
	return self.instance.cpu_average
end

function csm.starfall_processor:quotaAverage()
	return self.instance.cpu_average
end

function csm.starfall_processor:quotaMax()
	return self.instance.cpuQuota
end

function csm.starfall_processor:getState()
	local state = self:GetNWInt("State")
	
	if state == self.States.Normal then
		return "Normal"
	elseif state == self.States.Error then
		return "Error"
	else
		return "None"
	end
end

function csm.starfall_processor:getError()
	if self.error and self.error.message then
		return self.error.message
	end
end

if CLIENT then
	function csm.starfall_processor:getName()
		return self.name
	end
else
	function csm.starfall_screen:getLinked()
		if self.link then
			return SF.Entities.Wrap(self.link)
		end
	end
end

function csm.expadv_gate:getState()
	local state = self:GetExpVar("FLOAT", 4)
	
	if state == -1 then
		return "Compile"
	elseif state == 0 then
		return "Offline"
	elseif state == 1 then
		return "Online"
	elseif state == 2 then
		return "Alert"
	elseif state == 3 then
		return "Crashed"
	elseif state == 4 then
		return "Burned"
	end
end