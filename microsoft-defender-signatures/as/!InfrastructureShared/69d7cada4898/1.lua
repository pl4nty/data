local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = {}
L2_1 = add_parents_mp
L2_1 = L2_1()
L1_1.Parents = L2_1
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = "(?i)(?:verclsid|xwizard|rundll32).*\\{(.*?)\\}"
L6_1 = L3_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L1_1.CLSID = L5_1
L6_1 = IsKeyInRollingQueue
L7_1 = "Potential_COM_Hijacked_CLSIDs"
L8_1 = string
L8_1 = L8_1.lower
L9_1 = L5_1
L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1)
L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L6_1 then
  L1_1.CLSID_BM = L7_1
  L8_1 = safeJsonSerialize
  L9_1 = L1_1
  L8_1 = L8_1(L9_1)
  L9_1 = set_research_data
  L10_1 = "NewServiceRegistered_LoadsBeforeAV"
  L11_1 = MpCommon
  L11_1 = L11_1.Base64Encode
  L12_1 = L8_1
  L11_1 = L11_1(L12_1)
  L12_1 = false
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = MpCommon
  L9_1 = L9_1.BmTriggerSig
  L10_1 = L0_1.ppid
  L11_1 = "APML_SuspCLSIDExec_A"
  L12_1 = L8_1
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
