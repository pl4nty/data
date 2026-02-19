-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12fb384fbeabe\1.luac 

-- params : ...
-- function num : 0
if isnull(this_sigattrlog[5]) or isnull(this_sigattrlog[7]) then
  return mp.CLEAN
end
local l_0_0 = (mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((this_sigattrlog[5]).utf8p1) or "")
local l_0_1 = (mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((this_sigattrlog[7]).utf8p1) or "")
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_0)
;
(bm.add_related_file)(l_0_1)
do
  local l_0_2 = (string.match)((this_sigattrlog[5]).utf8p2, ";FSize:(.*)") or -1
  do
    local l_0_3 = nil
    local l_0_4 = nil
    local l_0_5 = (string.match)((this_sigattrlog[7]).utf8p2, ";FSize:(.*)") or -1
    local l_0_6 = bm.set_detection_string
    l_0_6(safeJsonSerialize({SAMPath = l_0_0, SYSTEMPath = l_0_1, SAMSize = l_0_4, SYSTEMSize = l_0_5}))
    l_0_6 = bm
    l_0_6 = l_0_6.add_related_string
    local l_0_7 = "DumpInfo"
    l_0_6(l_0_7, safeJsonSerialize({SAMPath = l_0_0, SYSPath = l_0_1, SAMSize = l_0_4, SYSSize = l_0_5, SAMInfo = (this_sigattrlog[5]).utf8p2, SYSInfo = (this_sigattrlog[7]).utf8p2}), bm.RelatedStringBMReport)
    l_0_6 = mp
    l_0_6 = l_0_6.INFECTED
    return l_0_6
  end
end

