local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 4096 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.FOOTERPAGE_SZ
if L0_1 < 4096 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.readu_u32
  L1_1 = footerpage
  L2_1 = mp
  L2_1 = L2_1.FOOTERPAGE_SZ
  L2_1 = L2_1 - 4
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 ~= 0 then
    goto lbl_34
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_34::
L0_1 = 10
L1_1 = 8
L2_1 = mp
L2_1 = L2_1.readheader
L3_1 = 0
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readfooter
L4_1 = mp
L4_1 = L4_1.FOOTERPAGE_SZ
L4_1 = L4_1 - L0_1
L5_1 = L0_1
L3_1 = L3_1(L4_1, L5_1)
L4_1 = 0
L5_1 = 0
L6_1 = ""
L7_1 = 1
L8_1 = L1_1
L9_1 = 1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = string
  L11_1 = L11_1.byte
  L12_1 = L2_1
  L13_1 = L10_1
  L11_1 = L11_1(L12_1, L13_1)
  L5_1 = L11_1
  L11_1 = 1
  L12_1 = L0_1
  L13_1 = 1
  for L14_1 = L11_1, L12_1, L13_1 do
    L15_1 = mp
    L15_1 = L15_1.bitand
    L16_1 = string
    L16_1 = L16_1.byte
    L17_1 = L3_1
    L18_1 = L14_1
    L16_1 = L16_1(L17_1, L18_1)
    L17_1 = L10_1 - 1
    L18_1 = L14_1 - 1
    L17_1 = L17_1 * L18_1
    L16_1 = L16_1 + L17_1
    L17_1 = 255
    L15_1 = L15_1(L16_1, L17_1)
    L4_1 = L15_1
    L15_1 = mp
    L15_1 = L15_1.bitxor
    L16_1 = L5_1
    L17_1 = L4_1
    L15_1 = L15_1(L16_1, L17_1)
    L5_1 = L15_1
  end
  L11_1 = L6_1
  L12_1 = string
  L12_1 = L12_1.char
  L13_1 = L5_1
  L12_1 = L12_1(L13_1)
  L6_1 = L11_1 .. L12_1
end
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = L6_1
L9_1 = 1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.getfilesize
L8_1 = L8_1()
L8_1 = L8_1 - 14
if L7_1 == L8_1 then
  L7_1 = mp
  L7_1 = L7_1.readu_u32
  L8_1 = L6_1
  L9_1 = 5
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == 9460301 then
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
