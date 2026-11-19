-- Threat: !InfrastructureShared
-- Name: 70b36e750345
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\appdata\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
