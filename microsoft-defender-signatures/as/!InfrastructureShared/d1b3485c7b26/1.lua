-- Threat: !InfrastructureShared
-- Name: d1b3485c7b26
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\rufus", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
