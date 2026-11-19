-- Threat: !InfrastructureShared
-- Name: 97b3336d943f
-- Type: 21

local l_0_0 = this_sigattrlog[2]
if not l_0_0 or not l_0_0.matched then
  return mp.CLEAN
end
if type(l_0_0.utf8p1) ~= "string" or type(l_0_0.utf8p2) ~= "string" then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if type(l_0_1) ~= "string" or string.len(l_0_1) < 13 then
  return mp.CLEAN
end
if string.lower(string.sub(l_0_1, -13)) ~= "\\vmtoolsd.exe" then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_0.utf8p2)
local l_0_3 = string.lower(l_0_0.utf8p1)
if l_0_3 ~= string.sub(l_0_2, 1, -6) then
  return mp.CLEAN
end
return mp.INFECTED
