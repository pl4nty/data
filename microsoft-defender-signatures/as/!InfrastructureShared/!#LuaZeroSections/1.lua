local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 5242880 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 1
L2_1 = elfhdr
L2_1 = L2_1.shnum
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = esec
  L5_1 = L5_1[L4_1]
  L6_1 = L5_1.offset
  if L6_1 == 0 then
    L6_1 = L5_1.size
    if L6_1 == 0 then
      goto lbl_25
    end
  end
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  do return L6_1 end
  ::lbl_25::
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
