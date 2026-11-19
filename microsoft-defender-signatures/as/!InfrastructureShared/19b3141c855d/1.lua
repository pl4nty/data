-- Threat: !InfrastructureShared
-- Name: 19b3141c855d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine(l_0_0)
return mp.INFECTED
