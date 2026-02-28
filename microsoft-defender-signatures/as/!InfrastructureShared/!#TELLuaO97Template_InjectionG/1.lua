local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1, L5_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L0_1 = L1_1
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "->word/_rels/"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "/drawings/_rels/"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "/worksheets/_rels/"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_32
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_32::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
