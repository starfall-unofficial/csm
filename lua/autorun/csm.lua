--- Usage Example:
-- function csm.gmod_wire_expression2:getName()
--     ...
-- end

timer.Simple(0, function()
	SF.csm = {}
	local csm = SF.csm

	local methods = {}


	setmetatable(csm, {
		__index = function(t, class)
			return setmetatable({}, {
				__newindex = function(t, name, fn)
					if not methods[class] then
						methods[class] = {}
					end
					
					methods[class][name] = fn
				end,
			})
		end,
	})


	local oldindex = SF.Entities.Metatable.__index
	function SF.Entities.Metatable:__index(name)
		local o = oldindex[name]
		
		if o then return o end
		

		local e = SF.Entities.Unwrap(self)
		if not IsValid(e) then
			return
		end

		
		local class = e:GetClass()
		
		if methods[class] and methods[class][name] then
			return methods[class][name]
		end
	end

	
	AddCSLuaFile("csm/wire.lua")
	include("csm/wire.lua")
end)