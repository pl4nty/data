-- Threat: !InfrastructureShared
-- Name: 5cb3c1ad7a5c
-- Type: 21

local l_0_0 = this_sigattrlog[1]
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
if not l_0_1 then
  return mp.CLEAN
end
if #l_0_1 < 12 or l_0_1:sub(-12):lower():find("\\%x%x%x%x%x%x%x.exe") ~= 1 then
  return mp.CLEAN
end
return mp.INFECTED
