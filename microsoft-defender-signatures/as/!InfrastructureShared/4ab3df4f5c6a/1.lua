-- Threat: !InfrastructureShared
-- Name: 4ab3df4f5c6a
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if string.find(l_0_1, "\\program files\\", 1, true) ~= nil or string.find(l_0_1, "\\program files (x86)\\", 1, true) ~= nil or string.find(l_0_1, "\\appdata\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
