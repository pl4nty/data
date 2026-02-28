local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = this_sigattrlog
L1_1 = L1_1[23]
L1_1 = L1_1.matched
if L1_1 then
  L0_1.type = "BM_TP_IGNORE"
  L1_1 = this_sigattrlog
  L1_1 = L1_1[23]
  L1_1 = L1_1.reg_block_usermode
  L0_1.block_usermode = L1_1
  L1_1 = this_sigattrlog
  L1_1 = L1_1[23]
  L1_1 = L1_1.utf8p1
  L0_1.event = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[24]
  L1_1 = L1_1.matched
  if L1_1 then
    L0_1.type = "BM_TP_IGNORE"
    L1_1 = this_sigattrlog
    L1_1 = L1_1[24]
    L1_1 = L1_1.reg_block_usermode
    L0_1.block_usermode = L1_1
    L1_1 = this_sigattrlog
    L1_1 = L1_1[24]
    L1_1 = L1_1.utf8p1
    L0_1.event = L1_1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[25]
    L1_1 = L1_1.matched
    if L1_1 then
      L0_1.type = "BM_TP_BLOCK"
      L1_1 = this_sigattrlog
      L1_1 = L1_1[25]
      L1_1 = L1_1.reg_block_usermode
      L0_1.block_usermode = L1_1
      L1_1 = this_sigattrlog
      L1_1 = L1_1[25]
      L1_1 = L1_1.utf8p1
      L0_1.event = L1_1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[26]
      L1_1 = L1_1.matched
      if L1_1 then
        L0_1.type = "BM_TP_BLOCK"
        L1_1 = this_sigattrlog
        L1_1 = L1_1[26]
        L1_1 = L1_1.reg_block_usermode
        L0_1.block_usermode = L1_1
        L1_1 = this_sigattrlog
        L1_1 = L1_1[26]
        L1_1 = L1_1.utf8p1
        L0_1.event = L1_1
      end
    end
  end
end
L1_1 = next
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.add_related_string
L2_1 = "EventInfo"
L3_1 = safeJsonSerialize
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = bm
L4_1 = L4_1.RelatedStringBMReport
L1_1(L2_1, L3_1, L4_1)
L1_1 = add_parents
L1_1()
L1_1 = reportSessionInformationInclusive
L1_1()
L1_1 = {}
L2_1 = {}
L3_1 = "svchost.exe"
L4_1 = "gpsvc"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = {}
L4_1 = "svchost.exe"
L5_1 = "netsvcs"
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = {}
L5_1 = "CcmExec.exe"
L6_1 = ""
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = {}
L6_1 = "powershell.exe"
L7_1 = "Windows Defender Advanced Threat Protection"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = "ConfigSecurityPolicy.exe"
L8_1 = ""
L6_1[1] = L7_1
L6_1[2] = L8_1
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = checkParentCmdlineCaseInsensitive
L4_1 = L2_1.ppid
L5_1 = L1_1
L6_1 = 4
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = reportRelevantUntrustedEntitiesForPid
L8_1 = L2_1.ppid
L7_1 = L7_1(L8_1)
if L7_1 then
  L8_1 = next
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = bm
    L8_1 = L8_1.add_related_string
    L9_1 = "HasUntrustedEntities"
    L10_1 = "true"
    L11_1 = bm
    L11_1 = L11_1.RelatedStringBMReport
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = bm
    L8_1 = L8_1.add_related_string
    L9_1 = "UntrustedEntities"
    L10_1 = safeJsonSerialize
    L11_1 = L7_1
    L10_1 = L10_1(L11_1)
    L11_1 = bm
    L11_1 = L11_1.RelatedStringBMReport
    L8_1(L9_1, L10_1, L11_1)
  end
end
L8_1 = bm
L8_1 = L8_1.get_current_process_startup_info
L8_1 = L8_1()
if L8_1 then
  L9_1 = L8_1.ppid
  if L9_1 then
    goto lbl_161
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_161::
L9_1 = bm
L9_1 = L9_1.get_imagepath
L9_1 = L9_1()
L11_1 = L9_1
L10_1 = L9_1.match
L12_1 = "([^\\]+)$"
L10_1 = L10_1(L11_1, L12_1)
L11_1 = hasSeenBefore
L12_1 = L10_1
L13_1 = L0_1.event
L14_1 = 7
L15_1 = "TamperingAttemptInMachine"
L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
if not L11_1 or L12_1 < 3 then
  L13_1 = 7200
  L14_1 = 1000
  L15_1 = "TamperingAlerts_TPAggr_G"
  L16_1 = L10_1
  L17_1 = "_"
  L18_1 = L0_1.event
  L16_1 = L16_1 .. L17_1 .. L18_1
  L17_1 = L0_1.type
  if L17_1 == "BM_TP_BLOCK" then
    L17_1 = 10
    if L17_1 then
      goto lbl_191
    end
  end
  L17_1 = 5
  ::lbl_191::
  L18_1 = AppendToRollingQueue
  L19_1 = L15_1
  L20_1 = L16_1
  L21_1 = L17_1
  L22_1 = L13_1
  L23_1 = L14_1
  L18_1(L19_1, L20_1, L21_1, L22_1, L23_1)
  L18_1 = GetRollingQueueSumOfValues
  L19_1 = L15_1
  L18_1 = L18_1(L19_1)
  if 15 <= L18_1 then
    L19_1 = GetRollingQueue
    L20_1 = L15_1
    L19_1 = L19_1(L20_1)
    L20_1 = bm
    L20_1 = L20_1.add_related_string
    L21_1 = "Alerts"
    L22_1 = safeJsonSerialize
    L23_1 = L19_1
    L22_1 = L22_1(L23_1)
    L23_1 = bm
    L23_1 = L23_1.RelatedStringBMReport
    L20_1(L21_1, L22_1, L23_1)
    L20_1 = bm
    L20_1 = L20_1.add_related_string
    L21_1 = "Score"
    L22_1 = L18_1
    L23_1 = bm
    L23_1 = L23_1.RelatedStringBMReport
    L20_1(L21_1, L22_1, L23_1)
    L20_1 = mp
    L20_1 = L20_1.INFECTED
    return L20_1
  end
end
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
