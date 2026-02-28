local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = 3
L1_1 = 62
L2_1 = 40
L3_1 = 183
L4_1 = 1
L5_1 = elfhdr
L5_1 = L5_1.ident
L6_1 = string
L6_1 = L6_1.byte
L7_1 = L5_1
L8_1 = 6
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == L4_1 then
  L7_1 = elfhdr
  L7_1 = L7_1.machine
  if L7_1 == L0_1 then
    goto lbl_34
  end
  L7_1 = elfhdr
  L7_1 = L7_1.machine
  if L7_1 == L1_1 then
    goto lbl_34
  end
  L7_1 = elfhdr
  L7_1 = L7_1.machine
  if L7_1 == L2_1 then
    goto lbl_34
  end
  L7_1 = elfhdr
  L7_1 = L7_1.machine
  if L7_1 == L3_1 then
    goto lbl_34
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_34::
L7_1 = 2
L8_1 = 1
L9_1 = elfhdr
L9_1 = L9_1.phnum
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = ephdrs
  L12_1 = L12_1[L11_1]
  L13_1 = L12_1.type
  if L13_1 == L7_1 then
    L13_1 = mp
    L13_1 = L13_1.INFECTED
    return L13_1
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
