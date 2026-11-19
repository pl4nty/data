-- Threat: !InfrastructureShared
-- Name: 15b3fa83b66e
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil and string.find(l_0_0, "\\wsmprovhost.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
