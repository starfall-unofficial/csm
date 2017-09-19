local csm = SF.csm


function csm.gmod_wire_expression2:getName()
	return self:GetNWString("name", "generic")
end


if SERVER then
	function csm.gmod_wire_expression2:getName()
		return self:GetGateName()
	end
	
	function csm.gmod_wire_expression2:isErrored()
		return self.error
	end

	function csm.gmod_wire_expression2:getCpuUsage()
		if not self.context then return 0 end
		
		return self.context.timebench
	end

	local function getOn(self)
		return self:GetOn()
	end

	csm.gmod_wire_button = getOn
	csm.gmod_wire_dynamic_button = getOn
end