-- Threat: !InfrastructureShared
-- Name: b6b3d843862c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
bm_AddRelatedFileFromCommandLine(l_0_0)
return mp.INFECTED
