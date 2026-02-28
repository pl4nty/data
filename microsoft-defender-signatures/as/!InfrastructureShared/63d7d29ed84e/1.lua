local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = MpCommon
L2_1 = L2_1.StringRegExpSearch
L3_1 = "(?i)-embedding\\s+(.*)"
L4_1 = L1_1
L2_1, L3_1 = L2_1(L3_1, L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L3_1
L6_1 = "'"
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = {}
L5_1 = add_parents_mp
L5_1 = L5_1()
L4_1.Parents = L5_1
L4_1.File_Path = L3_1
L5_1 = nil
L6_1 = IsKeyValuePairInRollingQueue
L7_1 = "MMC_SnapInCLSID"
L8_1 = "SnapInCLSID"
L9_1 = L3_1
L10_1 = false
L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 and L7_1 then
  L5_1 = true
  L4_1.CLSID_FromFile = L7_1
  L4_1.MSC_File_Matched = true
  L8_1 = string
  L8_1 = L8_1.match
  L9_1 = L7_1
  L10_1 = "(.-);"
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = IsKeyInRollingQueue
  L10_1 = "Potential_COM_Hijacked_CLSIDs"
  L11_1 = string
  L11_1 = L11_1.lower
  L12_1 = L8_1
  L11_1, L12_1, L13_1 = L11_1(L12_1)
  L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 then
    L4_1.COM_CLSID_Matched = true
    L4_1.CLSID_BM = L10_1
  end
end
if not L5_1 then
  L8_1 = IsKeyValuePairInRollingQueue
  L9_1 = "MMC_SnapInUrls"
  L10_1 = "SnapInUrls"
  L11_1 = L3_1
  L12_1 = false
  L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  L7_1 = L9_1
  L6_1 = L8_1
  if L6_1 and L7_1 then
    L5_1 = true
    L4_1.SnapIn_URL_FromFile = L7_1
    L4_1.MSC_File_Matched = true
  end
end
if L5_1 then
  L8_1 = safeJsonSerialize
  L9_1 = L4_1
  L8_1 = L8_1(L9_1)
  L9_1 = set_research_data
  L10_1 = "Evidence"
  L11_1 = MpCommon
  L11_1 = L11_1.Base64Encode
  L12_1 = L8_1
  L11_1 = L11_1(L12_1)
  L12_1 = false
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.GetParentProcInfo
  L9_1 = L9_1()
  if L9_1 then
    L10_1 = L9_1.ppid
    if L10_1 then
      L10_1 = MpCommon
      L10_1 = L10_1.BmTriggerSig
      L11_1 = L9_1.ppid
      L12_1 = "APML_SuspMMC_B"
      L13_1 = L8_1
      L10_1(L11_1, L12_1, L13_1)
    end
  end
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
