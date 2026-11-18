-- Threat: !InfrastructureShared
-- Name: 122b3bfa148e9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0)
end
return mp.INFECTED
