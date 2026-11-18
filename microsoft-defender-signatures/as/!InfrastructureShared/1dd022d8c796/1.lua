-- Threat: !InfrastructureShared
-- Name: 1dd022d8c796
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, ".lnk", -4, true) or string.find(l_0_0, ".zip", -4, true) then
  return mp.INFECTED
end
return mp.CLEAN
