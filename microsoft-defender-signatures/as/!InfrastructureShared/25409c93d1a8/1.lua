-- Threat: !InfrastructureShared
-- Name: 25409c93d1a8
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("%-%>.%d%d%d%d%d%d%d%d%d%d+/.%d%d%d%d%d%d%d%d%d%d+%.class$") ~= nil and mp.getfilesize() <= 2048 then
  mp.set_mpattribute("Lua:Java/MaliciousClassName")
end
return mp.INFECTED
