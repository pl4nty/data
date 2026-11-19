-- Threat: !InfrastructureShared
-- Name: 15b34e3ebdcd
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil and l_0_0 ~= "" and string.find(l_0_0, "bin/php", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
