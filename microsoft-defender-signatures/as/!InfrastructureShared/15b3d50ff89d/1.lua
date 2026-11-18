-- Threat: !InfrastructureShared
-- Name: 15b3d50ff89d
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\notepad++", 1, true) or string.find(l_0_0, "\\nvidia", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
