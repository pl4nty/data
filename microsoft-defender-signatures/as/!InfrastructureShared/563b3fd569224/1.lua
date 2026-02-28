local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L1_1 = false
L2_1 = this_sigattrlog
L2_1 = L2_1[12]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[12]
  L0_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[13]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[13]
  L0_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[14]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[14]
  L0_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[15]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[15]
  L0_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[16]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[16]
  L0_1 = L2_1.utf8p1
  L1_1 = true
end
L2_1 = this_sigattrlog
L2_1 = L2_1[17]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[17]
  L0_1 = L2_1.utf8p1
  L1_1 = true
end
L2_1 = this_sigattrlog
L2_1 = L2_1[18]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[18]
  L0_1 = L2_1.utf8p1
  L1_1 = true
end
L2_1 = this_sigattrlog
L2_1 = L2_1[19]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[19]
  L0_1 = L2_1.utf8p1
  L1_1 = true
end
L2_1 = IsSenseRelatedProc
L2_1 = L2_1()
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 then
  L3_1 = L2_1.ppid
  if L3_1 then
    goto lbl_88
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_88::
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = hasSeenBefore
L6_1 = L4_1
L7_1 = L0_1
L8_1 = 7
L9_1 = "TamperingAttemptInMachine"
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 and 3 <= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = 7200
L8_1 = 500
if L1_1 == true then
  L9_1 = AppendToRollingQueue
  L10_1 = "TamperingAlerts_LimitedSet_A"
  L11_1 = L4_1
  L12_1 = "_"
  L13_1 = L0_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L12_1 = L2_1.ppid
  L13_1 = L7_1
  L14_1 = L8_1
  L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
else
  L9_1 = AppendToRollingQueue
  L10_1 = "RemotDropped_Malware"
  L11_1 = L4_1
  L12_1 = "_"
  L13_1 = L0_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L12_1 = L2_1.ppid
  L13_1 = L7_1
  L14_1 = L8_1
  L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
end
L9_1 = GetRollingQueueCount
L10_1 = "TamperingAlerts_LimitedSet_A"
L9_1 = L9_1(L10_1)
L10_1 = GetRollingQueueCount
L11_1 = "RemotDropped_Malware"
L10_1 = L10_1(L11_1)
L11_1 = L9_1 + L10_1
if L11_1 < 2 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = false
L12_1 = GetRollingQueue
L13_1 = "TamperingAlerts_LimitedSet_A"
L12_1 = L12_1(L13_1)
L13_1 = GetRollingQueue
L14_1 = "RemotDropped_Malware"
L13_1 = L13_1(L14_1)
if 1 < L10_1 or 1 < L9_1 then
  L11_1 = true
elseif L10_1 == 1 then
  L14_1 = next
  L15_1 = L13_1
  L14_1, L15_1 = L14_1(L15_1)
  L16_1 = pairs
  L17_1 = L12_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L21_1 = L15_1.value
    L22_1 = L20_1.value
    if L21_1 == L22_1 then
      L11_1 = true
      break
    end
  end
else
  L14_1 = next
  L15_1 = L12_1
  L14_1, L15_1 = L14_1(L15_1)
  L16_1 = pairs
  L17_1 = L13_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L21_1 = L15_1.value
    L22_1 = L20_1.value
    if L21_1 == L22_1 then
      L11_1 = true
      break
    end
  end
end
if L11_1 then
  L14_1 = bm
  L14_1 = L14_1.add_related_string
  L15_1 = "TamperingAlertsOnMachine"
  L16_1 = safeJsonSerialize
  L17_1 = L12_1
  L16_1 = L16_1(L17_1)
  L17_1 = bm
  L17_1 = L17_1.RelatedStringBMReport
  L14_1(L15_1, L16_1, L17_1)
  L14_1 = bm
  L14_1 = L14_1.add_related_string
  L15_1 = "NonTamperingAlertsOnMachine"
  L16_1 = safeJsonSerialize
  L17_1 = L13_1
  L16_1 = L16_1(L17_1)
  L17_1 = bm
  L17_1 = L17_1.RelatedStringBMReport
  L14_1(L15_1, L16_1, L17_1)
  L14_1 = add_parents
  L14_1()
  L14_1 = reportRelevantUntrustedEntitiesForPid
  L15_1 = L2_1.ppid
  L14_1 = L14_1(L15_1)
  L15_1 = bm
  L15_1 = L15_1.add_related_string
  L16_1 = "UntrustedEntities"
  L17_1 = safeJsonSerialize
  L18_1 = L14_1
  L17_1 = L17_1(L18_1)
  L18_1 = bm
  L18_1 = L18_1.RelatedStringBMReport
  L15_1(L16_1, L17_1, L18_1)
  L15_1 = mp
  L15_1 = L15_1.INFECTED
  return L15_1
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
