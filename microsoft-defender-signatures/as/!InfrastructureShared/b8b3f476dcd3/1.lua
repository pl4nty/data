-- Threat: !InfrastructureShared
-- Name: b8b3f476dcd3
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 ~= nil and string.find(l_0_0, "\\appdata\\local\\temp\\system", 1, true) ~= nil and string.find(l_0_0, ".", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
