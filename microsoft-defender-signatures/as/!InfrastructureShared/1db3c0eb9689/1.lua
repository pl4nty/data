-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1db3c0eb9689\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "WinlogonHelper"
if isnull((this_sigattrlog[1]).utf8p2) or (string.find)((this_sigattrlog[1]).utf8p2, "explorer%.exe$") then
  return mp.CLEAN
end
if not (string.match)((this_sigattrlog[1]).utf8p2, ";To:(.+)") then
  local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[1]).utf8p2)
  l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
  if isnull(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = bm.add_related_string
  local l_0_3 = l_0_0
  local l_0_4 = safeJsonSerialize
  local l_0_5 = {}
  l_0_5.Shell = l_0_1
  l_0_5.P2 = (this_sigattrlog[1]).utf8p2
  l_0_4 = l_0_4(l_0_5)
  l_0_5 = bm
  l_0_5 = l_0_5.RelatedStringBMReport
  l_0_2(l_0_3, l_0_4, l_0_5)
  l_0_2 = bm
  l_0_2 = l_0_2.add_threat_file
  l_0_3 = l_0_1
  l_0_2(l_0_3)
  l_0_2 = bm
  l_0_2 = l_0_2.get_current_process_startup_info
  l_0_2 = l_0_2()
  if l_0_2 then
    l_0_3 = l_0_2.ppid
    if l_0_3 then
      l_0_3 = TrackPidAndTechniqueBM
      l_0_4 = l_0_2.ppid
      l_0_5 = "T1547.004"
      l_0_3(l_0_4, l_0_5, "persist_winlogon_shell")
    end
  end
  l_0_3 = mp
  l_0_3 = l_0_3.INFECTED
  return l_0_3
end

