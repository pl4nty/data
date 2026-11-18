-- Threat: !InfrastructureShared
-- Name: d7b3298ec96f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
end
return mp.INFECTED
