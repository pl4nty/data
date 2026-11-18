-- Threat: !InfrastructureShared
-- Name: 2bb3a316eaf0
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\program files", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
