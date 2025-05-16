-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b31ff162f5\0x000006d7_luac 

-- params : ...
-- function num : 0
local l_0_0 = 3
local l_0_1 = 14
local l_0_2 = nil
local l_0_3 = "sys[tw][eo][mw][36%%]"
local l_0_4 = (bm.get_current_process_startup_info)()
if isnull(l_0_4) or isnull(l_0_4.ppid) then
  return mp.CLEAN
end
if (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p1) and not isnull((this_sigattrlog[1]).utf8p2) and (string.find)((string.lower)((this_sigattrlog[1]).utf8p1), l_0_3) then
  l_0_2 = (this_sigattrlog[1]).utf8p2
else
  if (this_sigattrlog[2]).matched and not isnull((this_sigattrlog[2]).utf8p1) and not isnull((this_sigattrlog[2]).utf8p2) and (string.find)((string.lower)((this_sigattrlog[2]).utf8p1), l_0_3) then
    l_0_2 = (this_sigattrlog[2]).utf8p2
    l_0_1 = 17
  else
    return mp.CLEAN
  end
end
local l_0_5, l_0_6 = commandline_to_argv(l_0_2)
if isnull(l_0_6) then
  return mp.CLEAN
end
if l_0_0 <= l_0_5 and l_0_5 <= l_0_1 then
  return mp.CLEAN
end
if l_0_1 < l_0_5 and (string.find)(l_0_2, "werfault.exe\"? /hc? /shared Global([%c\\])%w+ /t %d+ /p %d+ %d+ %d+ %d+ %d+ %d+ %d+") and ((string.find)(l_0_4.command_line, "svchost.exe\"? %-k WerSvcGroup$") or (string.find)(l_0_4.command_line, "C:\\ProgramData\\Microsoft\\AzureWatson\\[0-9]\\awdumpIFEO%.exe")) then
  return mp.CLEAN
end
local l_0_7 = {}
l_0_7["/?"] = true
l_0_7["-?"] = true
l_0_7["-h"] = true
l_0_7["/h"] = true
l_0_7["--help"] = true
l_0_7["/help"] = true
if l_0_5 == 2 and not isnull(l_0_6[2]) and l_0_7[l_0_6[2]] then
  return mp.CLEAN
end
local l_0_8 = (versioning.GetOrgID)()
if not isnull(l_0_8) and (string.lower)(l_0_8) == "18a87cdb-84c8-4f1e-88c7-1ff1babb4e1a" and (string.find)(l_0_4.command_line, "C:\\ProgramData\\Microsoft\\Windows Defender Advanced Threat Protection\\Downloads\\vaultsetup.exe", 1, true) then
  return mp.CLEAN
end
local l_0_9, l_0_10 = (bm.get_process_relationships)()
if not isnull(l_0_10) then
  for l_0_14,l_0_15 in pairs(l_0_10) do
    if not isnull(l_0_15.ppid) and not isnull(l_0_15.cmd_line) and l_0_15.cmd_line == l_0_2 then
      (bm.add_related_process)(l_0_15.ppid)
      TrackPidAndTechniqueBM(l_0_15.ppid, "T1055", "processinjection_target")
      TrackPidAndTechniqueBM(l_0_15.ppid, "T1036", "masquerade_werfault")
      ;
      (bm.trigger_sig)("MasqueradeWerFaultProcess", (string.format)("Created by %s", l_0_4.ppid), l_0_15.ppid)
    end
  end
end
do
  ;
  (bm.trigger_sig)("MasqueradeWerFaultProcess", "Created fake WerFault")
  TrackPidAndTechniqueBM(l_0_4.ppid, "T1055", "processinjection")
  return mp.INFECTED
end

