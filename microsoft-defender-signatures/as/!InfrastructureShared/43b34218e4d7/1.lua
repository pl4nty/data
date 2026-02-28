local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = "suid_file_taint"
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 then
  L2_1 = isTainted
  L3_1 = L1_1
  L4_1 = L0_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    goto lbl_16
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_16::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
