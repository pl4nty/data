local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.GetScannedPPID
    L1_1 = L1_1()
    if L1_1 == "" or L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = mp
    L2_1 = L2_1.GetProcessCommandLine
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L3_1 = MpCommon
    L3_1 = L3_1.BmTriggerSig
    L4_1 = L0_1.ppid
    L5_1 = "LLMPrompt_Malicious_B"
    L6_1 = L2_1 or L6_1
    if not L2_1 then
      L6_1 = ""
    end
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
