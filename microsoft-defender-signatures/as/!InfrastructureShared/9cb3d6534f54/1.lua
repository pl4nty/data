local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = isTamperProtectionOn
L0_1 = L0_1()
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = "(windows-defender(-features|-gui)?[^-\\w])"
L2_1 = false
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = L1_1
L5_1 = L0_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
_ = L4_1
L2_1 = L3_1
if L2_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
