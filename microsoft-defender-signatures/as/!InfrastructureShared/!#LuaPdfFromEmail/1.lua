local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 1048576 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "PDF:ScanAllUris"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
