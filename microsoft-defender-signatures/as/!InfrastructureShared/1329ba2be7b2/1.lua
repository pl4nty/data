-- Threat: !InfrastructureShared
-- Name: 1329ba2be7b2
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("classes.dex") then
  return mp.CLEAN
end
return mp.INFECTED
