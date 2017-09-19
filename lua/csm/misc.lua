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

function csm.starfall_processor:quotaMax ()
	return self.instance.cpuQuota
end

if CLIENT then
	function csm.starfall_processor:getName()
		return self.name
	end
end