local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = 1
L1_1 = 3
L2_1 = 62
L3_1 = 40
L4_1 = 183
L5_1 = 1
L6_1 = elfhdr
L6_1 = L6_1.ident
L7_1 = string
L7_1 = L7_1.byte
L8_1 = L6_1
L9_1 = 6
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == L5_1 then
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L1_1 then
    goto lbl_35
  end
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L2_1 then
    goto lbl_35
  end
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L3_1 then
    goto lbl_35
  end
  L8_1 = elfhdr
  L8_1 = L8_1.machine
  if L8_1 == L4_1 then
    goto lbl_35
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_35::
L8_1 = 1685382481
L9_1 = 1
L10_1 = elfhdr
L10_1 = L10_1.phnum
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = ephdrs
  L13_1 = L13_1[L12_1]
  L14_1 = L13_1.type
  if L14_1 == L8_1 then
    L14_1 = mp
    L14_1 = L14_1.bitand
    L15_1 = L13_1.flags
    L16_1 = L0_1
    L14_1 = L14_1(L15_1, L16_1)
    if L14_1 == L0_1 then
      L14_1 = mp
      L14_1 = L14_1.INFECTED
      return L14_1
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
