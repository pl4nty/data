-- Threat: !InfrastructureShared
-- Name: e1b3acc30ea4
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[5].matched and not isnull(this_sigattrlog[5].utf8p2) then
  local l_0_0 = this_sigattrlog[5].utf8p2
  local l_0_1 = bm.get_current_process_startup_info()
  if not (l_0_1 and next(l_0_1) and l_0_1.command_line) or not l_0_1.integrity_level then
    return mp.CLEAN
  end
  if l_0_1.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(l_0_1.command_line)
  local l_0_3 = {
    "azure",
    "datadog",
    "splunk",
    "servicenow",
    "windows\\\\system32\\\\",
    "program files\\\\microsoft"
  }
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if string.find(l_0_2, l_0_5, 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_6 = mp.GetParentProcInfo()
  if l_0_6 and l_0_6.IntegrityLevel and l_0_6.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
    bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
    if l_0_1.ppid then
      bm.request_SMS(l_0_1.ppid, "h+")
      bm.add_action("SmsAsyncScanEvent", 1)
    end
    bm.add_related_string("[->] SUSPICIOUS URL: ", l_0_0, bm.RelatedStringBMReport)
    bm.add_related_string("[->] COMMAND: ", l_0_1.command_line, bm.RelatedStringBMReport)
    pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/SuspMemExec.MK!sms")
    return mp.INFECTED
  end
end
return mp.CLEAN
