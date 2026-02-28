local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if not L1_1 then
  L1_1 = "NO_IMG_PATH"
end
L2_1 = L0_1.ppid
L3_1 = L0_1.cmd_line
if not L3_1 then
  L3_1 = "NO_CMD_LINE"
end
L4_1 = MpCommon
L4_1 = L4_1.Base64Encode
L5_1 = L1_1
L6_1 = "|"
L7_1 = L3_1
L5_1 = L5_1 .. L6_1 .. L7_1
L4_1 = L4_1(L5_1)
L5_1 = ";"
L6_1 = L2_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = "RemoteInvocation:PSEXEC|"
L6_1 = MpCommon
L6_1 = L6_1.Base64Encode
L7_1 = L1_1
L6_1 = L6_1(L7_1)
L5_1 = L5_1 .. L6_1
L6_1 = reportSessionInformationInclusive
L6_1 = L6_1()
L7_1 = AppendToRollingQueue
L8_1 = L5_1
L9_1 = L2_1
L10_1 = safeJsonSerialize
L11_1 = L6_1
L10_1 = L10_1(L11_1)
L11_1 = 3600
L12_1 = 100
L13_1 = 1
L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L7_1 = recursiveTriggerSig
L8_1 = "RemoteInvocation:PSEXEC"
L9_1 = L4_1
L10_1 = L2_1
L11_1 = 0
L7_1(L8_1, L9_1, L10_1, L11_1)
L7_1 = reportRelevantUntrustedEntities
L7_1()
L7_1 = reportTimingData
L7_1()
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
