-- Threat: !InfrastructureShared
-- Name: 9bb39a54b134
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(l_0_0, ".tmp\\", 1, true) or string.find(l_0_0, "\\temp\\", 1, true) then
  return mp.INFECTED
end
if string.find(l_0_0, "\\program files\\", 1, true) or string.find(l_0_0, "\\program files (x86)\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
