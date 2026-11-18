-- Threat: !InfrastructureShared
-- Name: 42b33e6c900c
-- Type: 21

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p1
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not string.find(l_0_0, "\\temp\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "([^\\]+)$")
if l_0_1 == nil then
  return mp.CLEAN
end
if not string.find(l_0_1, "^chrome%-%d%d%d%d%.ps1$") then
  return mp.CLEAN
end
bm.set_detection_string(l_0_0)
return mp.INFECTED
