-- Threat: !InfrastructureShared
-- Name: 252913e5ce95
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->(Rtf", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
