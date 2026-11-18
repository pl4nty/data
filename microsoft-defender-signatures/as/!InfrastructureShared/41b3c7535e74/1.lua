-- Threat: !InfrastructureShared
-- Name: 41b3c7535e74
-- Type: 21

if not this_sigattrlog[3].utf8p1 then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if #l_0_0 < 12 or string.sub(l_0_0, -12) ~= "\\svchost.exe" then
  return mp.CLEAN
end
local l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
if string.find(l_0_1, "\\appdata\\", 1, true) == nil and string.find(l_0_1, "\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
