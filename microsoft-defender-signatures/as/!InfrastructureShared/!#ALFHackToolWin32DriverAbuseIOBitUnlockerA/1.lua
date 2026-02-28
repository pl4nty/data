local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSDEVICEPATH
L1_1 = L1_1(L2_1)
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil or L0_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L2_1 == "" or L0_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1
L4_1 = "\\"
L5_1 = L0_1
L3_1 = L3_1 .. L4_1 .. L5_1
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 == "werdbg.exe" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "MpInternal_researchdata=parentProcessPath="
L6_1 = L3_1
L5_1 = L5_1 .. L6_1
L4_1(L5_1)
L4_1 = sysio
L4_1 = L4_1.GetPEVersionInfo
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1.OriginalFilename
L6_1 = L4_1.InternalName
if L5_1 then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "MpInternal_researchdata=parentProcessOFN="
  L9_1 = L5_1
  L8_1 = L8_1 .. L9_1
  L7_1(L8_1)
elseif L6_1 then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "MpInternal_researchdata=parentProcessInternalName="
  L9_1 = L6_1
  L8_1 = L8_1 .. L9_1
  L7_1(L8_1)
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
