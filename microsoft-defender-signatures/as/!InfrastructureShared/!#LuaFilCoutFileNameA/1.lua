-- Threat: !InfrastructureShared
-- Name: !#Lua:FilCoutFileName.A
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -14) == "\\component_600" then
  mp.set_mpattribute("Lua:FilCoutFileName.A")
end
return mp.CLEAN
