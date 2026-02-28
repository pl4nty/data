local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
if L1_1 < 17 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "word/embeddings/oleobject%d.+bin.+->.+%.class$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "ole stream %d.+->.+%.class$"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_31
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_31::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
