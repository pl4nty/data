local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L2_1 = "net\\s+use\\s+(?<drive>\\w):\\s+\\\\\\\\\\w{2,5}\\.si@ssl\\\\\\w{1,3}"
L3_1 = false
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = L2_1
L6_1 = L1_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
_ = L5_1
L3_1 = L4_1
if L3_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
