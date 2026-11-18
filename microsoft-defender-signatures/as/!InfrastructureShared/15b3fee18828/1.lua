-- Threat: !InfrastructureShared
-- Name: 15b3fee18828
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\6.pif", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
