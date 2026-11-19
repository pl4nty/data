-- Threat: !InfrastructureShared
-- Name: 12fb33f6a414b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("destip=([^;]+)")
if l_0_1 ~= nil and l_0_1 ~= "" and isPublicIP(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
