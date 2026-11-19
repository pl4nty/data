-- Threat: !InfrastructureShared
-- Name: 10eb3f5dc6ae3
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\barco\\cmsclient\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
