-- Threat: !InfrastructureShared
-- Name: 4fb3e3e79f54
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

if this_sigattrlog[2].matched and not isnull(this_sigattrlog[2].utf8p2) then
  local l_0_0 = this_sigattrlog[2].utf8p2
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1 and next(l_0_1) and l_0_1.command_line and l_0_1.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
    local l_0_2 = {
      "services.exe"
    }
    local l_0_3 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_1.ppid)
    if l_0_3 and next(l_0_3) and l_0_3.IntegrityLevel and l_0_3.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_HIGH_RID and IsProcNameInParentProcessTree("BM", l_0_2) then
      local l_0_4 = string.lower(l_0_1.command_line)
      bm_AddRelatedFileFromCommandLine(l_0_4, nil, nil, 1)
      bm.request_SMS(l_0_1.ppid, "h+")
      bm.add_action("SmsAsyncScanEvent", 1)
      bm.add_related_string("[->] MEDICATED URL: ", l_0_0, bm.RelatedStringBMReport)
      bm.add_related_file(l_0_4)
      pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/SusMemDownload.MK!sms")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
