-- Threat: !InfrastructureShared
-- Name: 112b32b348bc7
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  local l_0_0 = this_sigattrlog[4].utf8p2
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1 and next(l_0_1) and l_0_1.command_line then
    local l_0_2 = string.lower(l_0_1.command_line)
    bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
    bm.request_SMS(l_0_1.ppid, "h+")
    bm.add_action("SmsAsyncScanEvent", 1)
    bm.add_related_string("[->] MEDICATED URL: ", l_0_0, bm.RelatedStringBMReport)
    bm.add_related_file(l_0_2)
  end
  triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/SusMemDownload.C")
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
