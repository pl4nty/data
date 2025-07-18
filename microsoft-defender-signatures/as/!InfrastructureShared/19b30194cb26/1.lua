-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19b30194cb26\1.luac 

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
  ;
  (mp.IsKnownFriendlyFile)(l_0_1, false, true)
  do
    if (mp.IsKnownFriendlyFile)(l_0_1, false, true) == true then
      local l_0_2, l_0_3 = "yes"
    else
    end
    local l_0_4 = "no"
    local l_0_5 = bm.add_related_string
    local l_0_6 = l_0_0
    local l_0_7 = safeJsonSerialize
    l_0_7 = l_0_7({Shell = l_0_1, P2 = (this_sigattrlog[1]).utf8p2, Friendly = l_0_4})
    l_0_5(l_0_6, l_0_7, bm.RelatedStringBMReport)
    l_0_5 = bm
    l_0_5 = l_0_5.add_related_file
    l_0_6 = l_0_1
    l_0_5(l_0_6)
    l_0_5 = bm
    l_0_5 = l_0_5.get_current_process_startup_info
    l_0_5 = l_0_5()
    if l_0_5 then
      l_0_6 = l_0_5.ppid
      if l_0_6 then
        l_0_6 = TrackPidAndTechniqueBM
        l_0_7 = l_0_5.ppid
        l_0_6(l_0_7, "T1547.004", "persist_winlogon_shell")
      end
    end
    l_0_6 = mp
    l_0_6 = l_0_6.INFECTED
    return l_0_6
  end
end

