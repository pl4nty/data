-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\66b364cfff92\1.luac 

-- params : ...
-- function num : 0
if isnull((this_sigattrlog[2]).utf8p1) or isnull((this_sigattrlog[1]).utf8p2) then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[2]).utf8p1
local l_0_1 = (string.lower)((this_sigattrlog[1]).utf8p2)
local l_0_2 = "[\\\"]mavinject.exe\" %d+ /injectrunning \"?c:\\-windows\\-system32\\-subsystems\\-appventsubsystems[36][24].dll\"? 1$"
if (string.find)(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4 = (string.match)(l_0_0, "imagename:.+;targetprocessppid:(%d+):(%d+)$")
local l_0_5, l_0_6 = (string.match)(l_0_1, "(%d+) .-injectrunning (.+)$")
if isnull(l_0_6) or isnull(l_0_3) or isnull(l_0_5) or l_0_3 ~= l_0_5 then
  return mp.CLEAN
end
if not isnull(((bm.get_current_process_startup_info)()).ppid) then
  TrackPidAndTechniqueBM(((bm.get_current_process_startup_info)()).ppid, "T1055.001", "processinjection")
end
local l_0_7 = (string.format)("pid:%d,ProcessStart:%d", l_0_3, l_0_4)
TrackPidAndTechniqueBM(l_0_7, "T1055.001", "processinjection_target")
;
(bm.add_related_process)(l_0_7)
local l_0_8, l_0_9 = pcall(mp.GetExecutablesFromCommandLine, l_0_6)
if l_0_8 and not isnull(l_0_9[1]) then
  (bm.add_related_file)(l_0_9[1])
else
  ;
  (bm.add_related_string)("T1055.001_InjectedDLL_ErrorScanning", l_0_6, bm.RelatedStringBMReport)
end
return mp.INFECTED

