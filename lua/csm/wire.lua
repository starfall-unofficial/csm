local csm = SF.csm

local eunwrap = SF.Entities.Unwrap

function unwrapEnt(e)
	local e = eunwrap(e)
	if IsValid(e) then return e end
	SF.Throw("Entity is not valid.", 2)
end

if SERVER then

	function csm.gmod_wire_expression2:getName()
		local self = unwrapEnt(self)
		
		if IsValid(self) and self.GetGateName then
			return self:GetGateName() or ""
		end
		
		return ""
	end


	function csm.gmod_wire_expression2:getCpuUsage()
		local self = unwrapEnt(self)
		
		if not self.context then return 0 end
		
		return self.context.timebench
	end

	local function getOn(self)
		local self = unwrapEnt(self)
		
		return self:GetOn()
	end

	csm.gmod_button = getOn -- not really wire
	csm.gmod_wire_button = getOn
	csm.gmod_wire_dynamic_button = getOn

end