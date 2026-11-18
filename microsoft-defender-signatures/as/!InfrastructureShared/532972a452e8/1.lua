-- Threat: !InfrastructureShared
-- Name: 532972a452e8
-- Type: 21

local l_0_0 = mp.getfilename()
l_0_0 = l_0_0.lower(l_0_0)
if string.find(l_0_0, ".lnk", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
