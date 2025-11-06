-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12bb330b6a252\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) or not l_0_0.command_line then
  return mp.CLEAN
end
do
  local l_0_1 = (string.lower)(l_0_0.command_line)
  if (string.find)(l_0_1, "gpsvc", 1, true) ~= nil and (string.find)(l_0_1, "schedule", 1, true) ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
    ;
    (bm.add_related_file)(l_0_1)
    ;
    (bm.add_related_string)("[->] MEDICATED SCRIPT: ", l_0_1, bm.RelatedStringBMReport)
    ;
    (bm.request_SMS)(l_0_0.ppid, "h+")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
    triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/SusGPOUpdate.MK")
    add_parents()
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

