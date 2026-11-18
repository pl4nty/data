-- Threat: !InfrastructureShared
-- Name: 2129b729910e
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "[DocWrite]", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
