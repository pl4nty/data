-- Threat: !InfrastructureShared
-- Name: 69b335ccffba
-- Type: 21
-- Includes: BMLuaLib

if bm.GetSignatureMatchDuration() > 12000000000 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
bm_AddRelatedFileFromCommandLine(l_0_0)
return mp.INFECTED
