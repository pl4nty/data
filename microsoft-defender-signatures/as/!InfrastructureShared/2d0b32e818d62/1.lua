-- Threat: !InfrastructureShared
-- Name: 2d0b32e818d62
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[10].matched and not isnull(this_sigattrlog[10].utf8p2) then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and not isnull(this_sigattrlog[11].utf8p2) then
  l_0_0 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and not isnull(this_sigattrlog[12].utf8p2) then
  l_0_0 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched and not isnull(this_sigattrlog[13].utf8p2) then
  l_0_0 = this_sigattrlog[13].utf8p2
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.GetExecutablesFromCommandLine, l_0_0)
if not l_0_1 or isnull(l_0_2) or #l_0_2 < 2 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_2[#l_0_2])
if not (not isnull(l_0_4) and not string.find(l_0_4, "mshta%.exe$") and sysio.IsFileExists(l_0_4)) or not mp.IsKnownFriendlyFile(l_0_4, false, true) then
  return mp.CLEAN
end
bm.add_related_string("MSHTA_ExecSignedPE", l_0_4, bm.RelatedStringBMReport)
bm.add_related_file(l_0_4)
mp.TriggerScanResource("file", l_0_4)
return mp.INFECTED
