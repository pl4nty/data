-- Threat: !InfrastructureShared
-- Name: 168b37aeb76f7
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
