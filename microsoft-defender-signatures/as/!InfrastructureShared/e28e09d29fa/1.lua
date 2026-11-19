-- Threat: !InfrastructureShared
-- Name: e28e09d29fa
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "assets/meta-data", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
