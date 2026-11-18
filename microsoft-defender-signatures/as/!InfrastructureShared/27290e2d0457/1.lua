-- Threat: !InfrastructureShared
-- Name: 27290e2d0457
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "androidmanifest", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
