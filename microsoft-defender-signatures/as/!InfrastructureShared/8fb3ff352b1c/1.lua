local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p1
  L0_1 = L0_1(L1_1)
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContextNoPath
  L2_1 = "CreatedAppDataMsi"
  L3_1 = L0_1
  L4_1 = 10
  L1_1(L2_1, L3_1, L4_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
