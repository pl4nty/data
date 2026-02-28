local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 < 2 or 5 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 5
L1_1 = L1_1(L2_1, L3_1)
L2_1 = L1_1 + 32
L3_1 = mp
L3_1 = L3_1.HEADERPAGE_SZ
if L2_1 > L3_1 or L1_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = headerpage
L5_1 = 9
L3_1 = L3_1(L4_1, L5_1)
if L2_1 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "U\139\236"
L5_1 = string
L5_1 = L5_1.len
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = 20
L7_1 = 0
L8_1 = mp
L8_1 = L8_1.readheader
L9_1 = 12
L10_1 = L6_1
L8_1 = L8_1(L9_1, L10_1)
L9_1 = 1
L10_1 = L6_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = string
  L13_1 = L13_1.byte
  L14_1 = L8_1
  L15_1 = L12_1
  L13_1 = L13_1(L14_1, L15_1)
  _t = L13_1
  L13_1 = mp
  L13_1 = L13_1.bitxor
  L14_1 = _t
  L15_1 = L7_1
  L13_1 = L13_1(L14_1, L15_1)
  L7_1 = L13_1
end
L9_1 = ""
L10_1 = ""
L11_1 = 0
L12_1 = mp
L12_1 = L12_1.readheader
L13_1 = 32
L14_1 = L5_1
L12_1 = L12_1(L13_1, L14_1)
L13_1 = 1
L14_1 = L5_1
L15_1 = 1
for L16_1 = L13_1, L14_1, L15_1 do
  L17_1 = string
  L17_1 = L17_1.byte
  L18_1 = L12_1
  L19_1 = L16_1
  L17_1 = L17_1(L18_1, L19_1)
  L11_1 = L17_1
  L17_1 = mp
  L17_1 = L17_1.bitxor
  L18_1 = L11_1
  L19_1 = L7_1
  L17_1 = L17_1(L18_1, L19_1)
  L10_1 = L17_1
  L17_1 = L9_1
  L18_1 = string
  L18_1 = L18_1.char
  L19_1 = L10_1
  L18_1 = L18_1(L19_1)
  L9_1 = L17_1 .. L18_1
end
if L9_1 ~= L4_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = 0
L14_1 = mp
L14_1 = L14_1.readheader
L15_1 = L2_1 + 12
L16_1 = L6_1
L14_1 = L14_1(L15_1, L16_1)
L15_1 = 1
L16_1 = L6_1
L17_1 = 1
for L18_1 = L15_1, L16_1, L17_1 do
  L19_1 = string
  L19_1 = L19_1.byte
  L20_1 = L14_1
  L21_1 = L18_1
  L19_1 = L19_1(L20_1, L21_1)
  L11_1 = L19_1
  L19_1 = mp
  L19_1 = L19_1.bitxor
  L20_1 = L11_1
  L21_1 = L13_1
  L19_1 = L19_1(L20_1, L21_1)
  L13_1 = L19_1
end
L15_1 = ""
L16_1 = mp
L16_1 = L16_1.readheader
L17_1 = L2_1 + 32
L18_1 = L5_1
L16_1 = L16_1(L17_1, L18_1)
L17_1 = 1
L18_1 = L5_1
L19_1 = 1
for L20_1 = L17_1, L18_1, L19_1 do
  L21_1 = string
  L21_1 = L21_1.byte
  L22_1 = L16_1
  L23_1 = L20_1
  L21_1 = L21_1(L22_1, L23_1)
  L11_1 = L21_1
  L21_1 = mp
  L21_1 = L21_1.bitxor
  L22_1 = L11_1
  L23_1 = L13_1
  L21_1 = L21_1(L22_1, L23_1)
  L10_1 = L21_1
  L21_1 = L15_1
  L22_1 = string
  L22_1 = L22_1.char
  L23_1 = L10_1
  L22_1 = L22_1(L23_1)
  L15_1 = L21_1 .. L22_1
end
if L15_1 ~= L4_1 then
  L17_1 = mp
  L17_1 = L17_1.CLEAN
  return L17_1
end
L17_1 = mp
L17_1 = L17_1.INFECTED
return L17_1
