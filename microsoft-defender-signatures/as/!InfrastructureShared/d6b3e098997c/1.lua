-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3e098997c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
local l_0_2 = (mp.GetParentProcInfo)()
if not l_0_2 or not l_0_2.image_path then
  return mp.CLEAN
end
local l_0_3 = normalize_path(l_0_2.image_path)
if not l_0_3 or not StringEndsWith(l_0_3, "\\svchost.exe") then
  return mp.CLEAN
end
local l_0_4 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
if not l_0_4 or l_0_4 == "" or l_0_4 == "%windir%" then
  return mp.CLEAN
end
l_0_4 = normalize_path(l_0_4)
if not l_0_4 then
  return mp.CLEAN
end
if l_0_3 == l_0_4 .. "\\system32\\svchost.exe" or l_0_3 == l_0_4 .. "\\syswow64\\svchost.exe" then
  return mp.CLEAN
end
;
(bm.add_related_string)("[->] AMSI-FAIL MASQ-SVCHOST PARENT: ", l_0_3, bm.RelatedStringBMReport)
;
(bm.add_related_string)("[->] AMSI-FAIL MASQ-SVCHOST CMD: ", l_0_1, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
if l_0_0.ppid then
  (bm.request_SMS)(l_0_0.ppid, "h+")
  ;
  (bm.add_action)("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailMasqSvchost.AM")
add_parents()
return mp.INFECTED

