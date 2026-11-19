-- Threat: !InfrastructureShared
-- Name: 15b354a3971a
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\microsoft\\edge", 1, true) or string.find(l_0_0, "\\temp\\edgemitmp", 1, true) or string.find(l_0_0, "\\google\\chrome\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
