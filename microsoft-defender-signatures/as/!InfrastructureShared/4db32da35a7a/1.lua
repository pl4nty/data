-- Threat: !InfrastructureShared
-- Name: 4db32da35a7a
-- Type: 21

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
if string.find(l_0_0, "\\conhost.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
