-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b39469942b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.lower)(l_0_0.command_line or "")
local l_0_3 = ""
local l_0_4 = (mp.GetParentProcInfo)()
if l_0_4 and l_0_4.image_path then
  l_0_3 = (string.lower)(l_0_4.image_path)
end
do
  if not contains(l_0_1, "\\sqlps.exe") then
    local l_0_5, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14 = contains
    l_0_8 = l_0_3
    local l_0_6 = nil
    local l_0_7 = nil
    l_0_10 = "\\sqlservr.exe"
    l_0_11 = "\\sqlagent.exe"
    l_0_5, l_0_9 = l_0_5(l_0_8, l_0_9), {l_0_10, l_0_11}
  end
  if not l_0_5 then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("[->] AMSI-FAIL SQL HOST: ", l_0_2, bm.RelatedStringBMReport)
  bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
  if l_0_0.ppid then
    (bm.request_SMS)(l_0_0.ppid, "h+")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
  end
  triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailSqlHost.AM")
  add_parents()
  return mp.INFECTED
end

