-- Threat: !InfrastructureShared
-- Name: 59294f4a076d
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "->%(mof%d+%)") then
  mp.set_mpattribute("MofPackedScript")
end
return mp.INFECTED
