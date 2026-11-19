-- Threat: !InfrastructureShared
-- Name: b5b3f52482a0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
bm_AddRelatedFileFromCommandLine(l_0_0)
return mp.INFECTED
