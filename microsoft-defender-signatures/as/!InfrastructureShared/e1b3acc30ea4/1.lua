-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e1b3acc30ea4\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p2) then
  local l_0_0 = (this_sigattrlog[5]).utf8p2
  local l_0_1 = (bm.get_current_process_startup_info)()
  if not l_0_1 or not next(l_0_1) or not l_0_1.command_line or not l_0_1.integrity_level then
    return mp.CLEAN
  end
  if l_0_1.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
    return mp.CLEAN
  end
  local l_0_2 = (string.lower)(l_0_1.command_line)
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC53: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("azure")("datadog") do
    -- DECOMPILER ERROR at PC58: Overwrote pending register: R9 in 'AssignReg'

    if (("program files\\\\microsoft").find)(l_0_2, l_0_8, 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_9 = (mp.GetParentProcInfo)()
  if l_0_9 and l_0_9.IntegrityLevel and MpCommon.SECURITY_MANDATORY_HIGH_RID <= l_0_9.IntegrityLevel then
    bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
    if l_0_1.ppid then
      (bm.request_SMS)(l_0_1.ppid, "h+")
      ;
      (bm.add_action)("SmsAsyncScanEvent", 1)
    end
    ;
    (bm.add_related_string)("[->] SUSPICIOUS URL: ", l_0_0, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("[->] COMMAND: ", l_0_1.command_line, bm.RelatedStringBMReport)
    pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/SuspMemExec.MK!sms")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

