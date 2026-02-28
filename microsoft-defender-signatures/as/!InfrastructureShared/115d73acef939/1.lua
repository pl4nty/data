local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = {}
L1_1 = "sqlservr.exe"
L2_1 = "sqlps.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 then
  L2_1 = L1_1.image_path
  if L2_1 then
    L2_1 = L1_1.image_path
    L3_1 = L2_1
    L2_1 = L2_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = ""
    end
    L3_1 = Contains_any_caseinsenstive
    L4_1 = L2_1
    L5_1 = L0_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.GetScannedPPID
      L3_1 = L3_1()
      if L3_1 == "" or L3_1 == nil then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = mp
      L4_1 = L4_1.GetProcessCommandLine
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L5_1 = Contains_any_caseinsenstive
        L6_1 = L4_1
        L7_1 = {}
        L8_1 = "downloadstring"
        L9_1 = "downloadfile"
        L7_1[1] = L8_1
        L7_1[2] = L9_1
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 then
          L5_1 = MpCommon
          L5_1 = L5_1.BmTriggerSig
          L6_1 = L1_1.ppid
          L7_1 = "PFApp_SqlSrvExploit_B"
          L8_1 = L4_1
          L5_1(L6_1, L7_1, L8_1)
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
