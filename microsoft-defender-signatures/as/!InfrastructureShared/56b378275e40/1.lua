-- Threat: !InfrastructureShared
-- Name: 56b378275e40
-- Type: 21

local l_0_0 = this_sigattrlog[1]
if not l_0_0 or not l_0_0.matched then
  return mp.CLEAN
end
if type(l_0_0.utf8p1) ~= "string" or type(l_0_0.utf8p2) ~= "string" then
  return mp.CLEAN
end
local l_0_1 = string.match(string.lower(l_0_0.utf8p1), "^(.-)\\\\")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "\\([^\\\\]+)$")
if l_0_2 ~= "win32" and l_0_2 ~= "win64" then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_0.utf8p2)
if not string.find(l_0_3, "\\programdata\\", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_3, "%.sct$") then
  return mp.CLEAN
end
return mp.INFECTED
