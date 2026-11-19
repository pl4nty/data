-- Threat: !InfrastructureShared
-- Name: 158b34bdb709b
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if isnull(this_sigattrlog[6]) or isnull(this_sigattrlog[8]) then
  return mp.CLEAN
end
local l_0_0 = mp.ContextualExpandEnvironmentVariables(MpCommon.PathToWin32Path(this_sigattrlog[6].utf8p1) or "")
local l_0_1 = mp.ContextualExpandEnvironmentVariables(MpCommon.PathToWin32Path(this_sigattrlog[8].utf8p1) or "")
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
bm.add_related_file(l_0_1)
local l_0_2 = string.match(this_sigattrlog[6].utf8p2, ";FSize:(.*)") or -1
local l_0_3 = string.match(this_sigattrlog[8].utf8p2, ";FSize:(.*)") or -1
bm.set_detection_string(safeJsonSerialize({
  SAMPath = l_0_0,
  SECURITYPath = l_0_1,
  SAMSize = l_0_2,
  SECURITYSize = l_0_3
}))
bm.add_related_string("DumpInfo", safeJsonSerialize({
  SAMPath = l_0_0,
  SECPath = l_0_1,
  SAMSize = l_0_2,
  SECSize = l_0_3,
  SAMInfo = this_sigattrlog[6].utf8p2,
  SECInfo = this_sigattrlog[8].utf8p2
}), bm.RelatedStringBMReport)
return mp.INFECTED
