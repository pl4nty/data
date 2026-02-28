local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 then
  L3_1 = L2_1.ppid
  if L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.BmTriggerSig
    L4_1 = L2_1.ppid
    L5_1 = "Tampering_PPL_ClipUpMisuse"
    L6_1 = L1_1
    L3_1(L4_1, L5_1, L6_1)
  end
end
L3_1 = set_research_data
L4_1 = "TamperingCmd"
L5_1 = MpCommon
L5_1 = L5_1.Base64Encode
L6_1 = L1_1
L5_1 = L5_1(L6_1)
L6_1 = false
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
