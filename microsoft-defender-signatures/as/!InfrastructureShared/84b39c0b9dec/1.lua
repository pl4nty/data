local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = MpCommon
L1_1 = L1_1.GetProcessAttributeValue
L2_1 = L0_1.ppid
L3_1 = "inherit:PFApp_Parent"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.GetProcessAttributeValue
  L2_1 = L0_1.ppid
  L3_1 = "PFApp_Parent"
  L1_1 = L1_1(L2_1, L3_1)
end
L2_1 = "ruby.exe"
if not L1_1 then
  L3_1 = {}
  L1_1 = L3_1
end
L3_1 = bm
L3_1 = L3_1.get_connection_string
L3_1 = L3_1()
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "Uri=(.-;)"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "^%a+://([^:/]+)"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = "PFApp_HOST"
L7_1 = MpCommon
L7_1 = L7_1.AnomalyEventLookup
L8_1 = L6_1
L9_1 = "MarkerRecord_"
L10_1 = L2_1
L9_1 = L9_1 .. L10_1
L10_1 = 1
L7_1 = L7_1(L8_1, L9_1, L10_1)
L8_1 = MpCommon
L8_1 = L8_1.GetCurrentTimeT
L8_1 = L8_1()
L9_1 = L8_1
L10_1 = nil
L11_1 = nil
L12_1 = {}
L12_1.TrackedProcess = L2_1
L12_1.SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.C"
L12_1.AnomalyTableName = "Appomaly_Network_HOST"
if L7_1 then
  L13_1 = L7_1.Count
  if L13_1 then
    L9_1 = L7_1.Count
  end
else
  L9_1 = L8_1
  L13_1 = pcall
  L14_1 = MpCommon
  L14_1 = L14_1.AnomalyEventUpdate
  L15_1 = L6_1
  L16_1 = "MarkerRecord_"
  L17_1 = L2_1
  L16_1 = L16_1 .. L17_1
  L17_1 = L8_1
  L18_1 = 1
  L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
  L11_1 = L14_1
  L10_1 = L13_1
  if L10_1 then
    L13_1 = bm
    L13_1 = L13_1.trigger_sig
    L14_1 = "AnomalyTableMarker_Rcr"
    L15_1 = safeJsonSerialize
    L16_1 = L12_1
    L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L15_1(L16_1)
    L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
  else
    L12_1.Error = L11_1
    L13_1 = bm
    L13_1 = L13_1.trigger_sig
    L14_1 = "AnomalyTable_Error"
    L15_1 = safeJsonSerialize
    L16_1 = L12_1
    L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L15_1(L16_1)
    L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
end
L13_1 = L8_1 - L9_1
L13_1 = L13_1 / 60
L14_1 = L2_1
L15_1 = "_"
L16_1 = L5_1
L14_1 = L14_1 .. L15_1 .. L16_1
L15_1 = MpCommon
L15_1 = L15_1.AnomalyEventLookup
L16_1 = L6_1
L17_1 = L14_1
L18_1 = 1
L15_1 = L15_1(L16_1, L17_1, L18_1)
if not L15_1 then
  if 43200 < L13_1 then
    L12_1.minutes_elapsed = L13_1
    L12_1.isTest = "false"
    L12_1.processAttrib = L1_1
    L16_1 = bm
    L16_1 = L16_1.add_related_string
    L17_1 = "AdditionalInfo"
    L18_1 = safeJsonSerialize
    L19_1 = L12_1
    L18_1 = L18_1(L19_1)
    L19_1 = bm
    L19_1 = L19_1.RelatedStringBMReport
    L16_1(L17_1, L18_1, L19_1)
    L16_1 = mp
    L16_1 = L16_1.INFECTED
    return L16_1
  else
    L16_1 = pcall
    L17_1 = MpCommon
    L17_1 = L17_1.AnomalyEventUpdate
    L18_1 = L6_1
    L19_1 = L14_1
    L20_1 = 1
    L21_1 = 1
    L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
    L11_1 = L17_1
    L10_1 = L16_1
  end
else
  L16_1 = L15_1.Count
  L16_1 = L16_1 + 1
  L17_1 = pcall
  L18_1 = MpCommon
  L18_1 = L18_1.AnomalyEventUpdate
  L19_1 = L6_1
  L20_1 = L14_1
  L21_1 = L16_1
  L22_1 = 1
  L17_1, L18_1 = L17_1(L18_1, L19_1, L20_1, L21_1, L22_1)
  L11_1 = L18_1
  L10_1 = L17_1
end
if not L10_1 then
  L12_1.Key = L14_1
  L12_1.Error = L11_1
  L16_1 = bm
  L16_1 = L16_1.trigger_sig
  L17_1 = "AnomalyTable_Error"
  L18_1 = safeJsonSerialize
  L19_1 = L12_1
  L18_1, L19_1, L20_1, L21_1, L22_1 = L18_1(L19_1)
  L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
end
L16_1 = mp
L16_1 = L16_1.CLEAN
return L16_1
