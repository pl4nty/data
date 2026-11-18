-- Threat: !InfrastructureShared
-- Name: 1e3b3e420632f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
end
local l_0_1 = string.gsub(l_0_0, "\"", "")
if not l_0_1 then
  return mp.CLEAN
end
if contains(l_0_1, "curl.*http.*ping.*script", false) then
  return mp.INFECTED
end
if contains(l_0_1, "curl.*http.*ping.*rundll", false) then
  return mp.INFECTED
end
return mp.CLEAN
