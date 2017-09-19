local csm = SF.csm

if SERVER then
	function csm.gmod_button:getOn()
		return self:GetOn()
	end

	function csm.gmod_button:isToggle()
		return self:GetIsToggle()
	end
	
	function csm.gmod_button:getLabel()
		return self:GetLabel()
	end
	
	function csm.gmod_button:getKey()
		return self:GetKey()
	end
end