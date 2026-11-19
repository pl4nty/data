-- Threat: !InfrastructureShared
-- Name: bdb3bb598033
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0)
end
return mp.INFECTED
