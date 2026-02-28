local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.ppid
  if L1_1 then
    goto lbl_22
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_22::
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.utf8p2
if not L1_1 then
  L1_1 = ""
end
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if not L2_1 then
  L2_1 = "NO_IMG_PATH"
end
L3_1 = L0_1.ppid
L4_1 = L0_1.cmd_line
if not L4_1 then
  L4_1 = "NO_CMD_LINE"
end
L5_1 = MpCommon
L5_1 = L5_1.Base64Encode
L6_1 = L2_1
L7_1 = "|"
L8_1 = L4_1
L6_1 = L6_1 .. L7_1 .. L8_1
L5_1 = L5_1(L6_1)
L6_1 = ";"
L7_1 = L1_1
L8_1 = ";"
L9_1 = L3_1
L5_1 = L5_1 .. L6_1 .. L7_1 .. L8_1 .. L9_1
L6_1 = "RemoteInvocation:DCOM.MMC20|"
L7_1 = MpCommon
L7_1 = L7_1.Base64Encode
L8_1 = L2_1
L7_1 = L7_1(L8_1)
L6_1 = L6_1 .. L7_1
L7_1 = reportSessionInformationInclusive
L7_1 = L7_1()
L8_1 = AppendToRollingQueue
L9_1 = L6_1
L10_1 = L3_1
L11_1 = safeJsonSerialize
L12_1 = L7_1
L11_1 = L11_1(L12_1)
L12_1 = 3600
L13_1 = 100
L14_1 = 1
L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L8_1 = recursiveTriggerSig
L9_1 = "RemoteInvocation:DCOM.MMC20"
L10_1 = L5_1
L11_1 = L3_1
L12_1 = 0
L8_1(L9_1, L10_1, L11_1, L12_1)
L8_1 = reportRelevantUntrustedEntities
L8_1()
L8_1 = reportTimingData
L8_1()
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
