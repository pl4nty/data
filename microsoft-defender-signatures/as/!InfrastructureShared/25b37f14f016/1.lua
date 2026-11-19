-- Threat: !InfrastructureShared
-- Name: 25b37f14f016
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
