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
	
	function csm.gmod_cameraprop:getVecTrack()
		return SF.Vectors.Wrap(self:GetvecTrack())
	end
	
	function csm.gmod_cameraprop:getEntTrack()
		return SF.Entities.Wrap(self:GetentTrack())
	end
	
	function csm.gmod_cameraprop:getKey()
		return self:GetKey()
	end
	
	function csm.gmod_thruster:getOn()
		return self:GetNWBool("On")
	end
	
	function csm.gmod_thruster:getEffect()
		return self:GetNWString("Effect")
	end
	
	function csm.gmod_thruster:getSound()
		return self.SoundName
	end
	
	function csm.gmod_thruster:isToggle()
		return self.Toggle
	end
end