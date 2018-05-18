--- Usage Example:
-- function csm.gmod_wire_expression2:getName()
--     ...
-- end

SF.DefaultEnvironment._CSM = true

SF.AddHook("postload", function(instance)
	local eunwrap = SF.Entities.Unwrap

	function unwrapEnt(e)
		local e = eunwrap(e)
		if IsValid(e) then return e end
		SF.Throw("Entity is not valid.", 2)
	end


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
					
					methods[class][name] = function(self, ...)
						local e = unwrapEnt(self)
						if e:GetClass() ~= class then
							SF.Throw("Invalid Class.", 2)
						end
						return fn(e, ...)
					end
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

	AddCSLuaFile("csm/gmod.lua")
	include("csm/gmod.lua")

	AddCSLuaFile("csm/wire.lua")
	include("csm/wire.lua")

	AddCSLuaFile("csm/misc.lua")
	include("csm/misc.lua")

end)
