local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L2_1 = false
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = "(\\s(stop|delete)\\s(sense|windefend|wdfilter|diagtrack)(\\s|$))"
L5_1 = L1_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
_ = L4_1
L2_1 = L3_1
if L2_1 == true then
  L3_1 = isTamperProtectionOn
  L3_1 = L3_1()
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.LOWFI
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
