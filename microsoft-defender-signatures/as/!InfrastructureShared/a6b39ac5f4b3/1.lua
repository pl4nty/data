local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
if L0_1 then
  L1_1 = L0_1.matched
  if L1_1 then
    goto lbl_11
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_11::
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
if L1_1 then
  L2_1 = L1_1.matched
  if L2_1 then
    goto lbl_21
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_21::
L2_1 = ProcessCodeInjection
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
