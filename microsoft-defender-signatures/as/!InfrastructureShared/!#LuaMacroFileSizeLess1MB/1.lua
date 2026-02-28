local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 524288 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "MACRO_FILE_SIZE:L0.5MB"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
