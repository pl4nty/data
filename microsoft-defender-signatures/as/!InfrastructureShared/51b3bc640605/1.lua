-- Threat: !InfrastructureShared
-- Name: 51b3bc640605
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if bm.GetSignatureMatchDuration() > 12000000000 then
  return mp.CLEAN
end
local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
  l_0_1 = this_sigattrlog[3].utf8p1
end
if not isLolbinFilename(l_0_1) then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine(l_0_0)
return mp.INFECTED
