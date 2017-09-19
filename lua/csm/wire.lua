local csm = SF.csm

local eunwrap = SF.Entities.Unwrap

function unwrapEnt(e)
	local e = eunwrap(e)
	if IsValid(e) then return e end
	SF.Throw("Entity is not valid.", 2)
end



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

