local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = 40
L1_1 = 183
L2_1 = 1
L3_1 = elfhdr
L3_1 = L3_1.ident
L4_1 = string
L4_1 = L4_1.byte
L5_1 = L3_1
L6_1 = 6
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == L2_1 then
  L5_1 = elfhdr
  L5_1 = L5_1.machine
  if L5_1 == L0_1 then
    goto lbl_24
  end
  L5_1 = elfhdr
  L5_1 = L5_1.machine
  if L5_1 == L1_1 then
    goto lbl_24
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_24::
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
