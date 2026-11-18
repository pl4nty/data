-- Threat: !InfrastructureShared
-- Name: 296b3229b17bb
-- Type: 21
-- Includes: BMLuaLib

if not this_sigattrlog[12].matched or isnull(this_sigattrlog[12].utf8p2) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.GetExecutablesFromCommandLine, this_sigattrlog[12].utf8p2)
if not l_0_0 or isnull(l_0_1) or #l_0_1 < 2 then
  return mp.CLEAN
end
local l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_1[#l_0_1])
if not (not isnull(l_0_2) and not string.find(l_0_2, "mshta%.exe$") and sysio.IsFileExists(l_0_2)) or not mp.IsKnownFriendlyFile(l_0_2, false, true) then
  return mp.CLEAN
end
bm.add_related_string("MSHTA_ExecSignedPE", l_0_2, bm.RelatedStringBMReport)
bm.add_related_file(l_0_2)
mp.TriggerScanResource("file", l_0_2)
return mp.INFECTED
