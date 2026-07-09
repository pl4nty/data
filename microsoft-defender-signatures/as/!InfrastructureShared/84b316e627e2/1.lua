-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b316e627e2\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\program files\\", 1, true) or (string.find)(l_0_1, "\\program files (x86)\\", 1, true) or (string.find)(l_0_1, "\\windows\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (bm.get_current_process_startup_info)()
if isnull(l_0_2) or isnull(l_0_2.ppid) then
  return mp.CLEAN
end
local l_0_3 = 120
AddTechniqueGlobal("NetQosDotnetWmiClientObserved", l_0_3)
;
(bm.add_related_file)(l_0_0)
;
(bm.add_related_string)("netqos_client", l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1562.004", "netqos_dotnet_wmi_client_marker", 28800)
return mp.INFECTED

