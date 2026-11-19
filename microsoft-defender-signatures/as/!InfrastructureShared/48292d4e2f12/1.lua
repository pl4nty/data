-- Threat: !InfrastructureShared
-- Name: 48292d4e2f12
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("androidmanifest.xml") then
  return mp.INFECTED
end
return mp.CLEAN
