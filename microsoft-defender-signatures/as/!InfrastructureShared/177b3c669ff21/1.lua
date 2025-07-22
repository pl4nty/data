-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\177b3c669ff21\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "SearchHijackIgfxtray"
local l_0_1 = (this_sigattrlog[5]).utf8p1
local l_0_2 = (this_sigattrlog[6]).utf8p1
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = (mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)(l_0_1) or "")
l_0_2 = (mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)(l_0_2) or "")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (string.match)((string.lower)(l_0_1), "(.+)%\\igfxtray%.exe")
local l_0_4 = (string.match)((string.lower)(l_0_2), "(.+)%\\hccutils%.dll")
if isnull(l_0_3) or isnull(l_0_4) or l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
local l_0_5 = bm.add_related_string
local l_0_6 = l_0_0
local l_0_7 = safeJsonSerialize
local l_0_8 = {}
l_0_8.Process = l_0_1
l_0_8.Module = l_0_2
l_0_7 = l_0_7(l_0_8)
l_0_8 = bm
l_0_8 = l_0_8.RelatedStringBMReport
l_0_5(l_0_6, l_0_7, l_0_8)
l_0_5 = bm
l_0_5 = l_0_5.add_threat_file
l_0_6 = l_0_2
l_0_5(l_0_6)
l_0_5 = bm
l_0_5 = l_0_5.get_current_process_startup_info
l_0_5 = l_0_5()
if l_0_5 then
  l_0_6 = l_0_5.ppid
  if l_0_6 then
    l_0_6 = TrackPidAndTechniqueBM
    l_0_7 = l_0_5.ppid
    l_0_8 = "T1574.001"
    l_0_6(l_0_7, l_0_8, "evasion_searchhijack_igfxtray")
  end
end
l_0_6 = mp
l_0_6 = l_0_6.INFECTED
return l_0_6

