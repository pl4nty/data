-- Threat: !InfrastructureShared
-- Name: 7a7b30264cfed
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "acrodist.exe",
  "csrss.exe"
}) then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and next(l_0_0) and l_0_0.command_line then
  local l_0_1 = string.lower(l_0_0.command_line)
  if l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
    local l_0_2 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
    if l_0_2 and next(l_0_2) and l_0_2.IntegrityLevel and l_0_2.IntegrityLevel < MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
      bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
      bm.request_SMS(l_0_0.ppid, "h+")
      bm.add_action("SmsAsyncScanEvent", 1)
      bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_0_1, bm.RelatedStringBMReport)
      bm.add_related_file(l_0_1)
      pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/AMSI.HardwareBreakPoint.G!sms")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
