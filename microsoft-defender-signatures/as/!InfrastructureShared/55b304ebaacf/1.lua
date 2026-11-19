-- Threat: !InfrastructureShared
-- Name: 55b304ebaacf
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine(l_0_0)
bm.add_related_string("ProcessCreate_Param", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
