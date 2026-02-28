local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.image_path
  if L1_1 then
    L1_1 = L0_1.image_path
    L2_1 = L1_1
    L1_1 = L1_1.match
    L3_1 = "([^\\]+)$"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = ""
    end
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 == "w3wp.exe" then
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
      if L3_1 then
        L4_1 = MpCommon
        L4_1 = L4_1.BmTriggerSig
        L5_1 = L0_1.ppid
        L6_1 = "PFApp_IISSrvExploit_A"
        L7_1 = L3_1
        L4_1(L5_1, L6_1, L7_1)
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
