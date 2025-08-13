-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a1b3c18077c3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
l_0_0["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
if not l_0_0[(string.lower)((versioning.GetOrgID)() or "")] then
  return mp.CLEAN
end
local l_0_1 = "WinlogonHelper"
if isnull((this_sigattrlog[1]).utf8p2) or (string.find)((this_sigattrlog[1]).utf8p2, "explorer%.exe$") then
  return mp.CLEAN
end
if not (string.match)((this_sigattrlog[1]).utf8p2, ";To:(.+)") then
  local l_0_2 = (MpCommon.PathToWin32Path)((this_sigattrlog[1]).utf8p2)
  l_0_2 = (mp.ContextualExpandEnvironmentVariables)(l_0_2)
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  ;
  (mp.IsKnownFriendlyFile)(l_0_2, false, true)
  do
    if (mp.IsKnownFriendlyFile)(l_0_2, false, true) == true then
      local l_0_3, l_0_4 = "yes"
    else
    end
    local l_0_5 = "no"
    local l_0_6 = bm.add_related_string
    local l_0_7 = l_0_1
    local l_0_8 = safeJsonSerialize
    l_0_8 = l_0_8({Shell = l_0_2, P2 = (this_sigattrlog[1]).utf8p2, Friendly = l_0_5})
    l_0_6(l_0_7, l_0_8, bm.RelatedStringBMReport)
    l_0_6 = bm
    l_0_6 = l_0_6.add_threat_file
    l_0_7 = l_0_2
    l_0_6(l_0_7)
    l_0_6 = bm
    l_0_6 = l_0_6.get_current_process_startup_info
    l_0_6 = l_0_6()
    if l_0_6 then
      l_0_7 = l_0_6.ppid
      if l_0_7 then
        l_0_7 = TrackPidAndTechniqueBM
        l_0_8 = l_0_6.ppid
        l_0_7(l_0_8, "T1547.004", "persist_winlogon_shell")
      end
    end
    l_0_7 = mp
    l_0_7 = l_0_7.INFECTED
    return l_0_7
  end
end

