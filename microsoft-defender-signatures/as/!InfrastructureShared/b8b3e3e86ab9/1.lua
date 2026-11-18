-- Threat: !InfrastructureShared
-- Name: b8b3e3e86ab9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
return mp.INFECTED
