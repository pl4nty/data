local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "MpInternal_researchdata=newlyCreated="
  L2_1 = "true"
  L1_1 = L1_1 .. L2_1
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "MpInternal_researchdata=cmd="
  L4_1 = L1_1
  L3_1 = L3_1 .. L4_1
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSDEVICEPATH
L3_1 = L3_1(L4_1)
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 or not L2_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L4_1 == "" or L2_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1
L6_1 = "\\"
L7_1 = L2_1
L5_1 = L5_1 .. L6_1 .. L7_1
L6_1 = sysio
L6_1 = L6_1.GetPEVersionInfo
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = L6_1.OriginalFilename
if L7_1 then
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "MpInternal_researchdata=parentProcessOFN="
  L10_1 = L7_1
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
