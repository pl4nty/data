local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 or 5242880 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 5
L2_1 = L2_1(L3_1, L4_1)
if L1_1 == 0 or L2_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = headerpage
L5_1 = 33
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.bitxor
L5_1 = L1_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= 9460301 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = ""
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = 32
L9_1 = 64
L10_1 = mp
L10_1 = L10_1.readheader
L11_1 = 0
L12_1 = L8_1
L10_1 = L10_1(L11_1, L12_1)
L11_1 = mp
L11_1 = L11_1.readheader
L12_1 = L8_1
L13_1 = L9_1
L11_1 = L11_1(L12_1, L13_1)
L12_1 = 1
L13_1 = L9_1
L14_1 = 1
for L15_1 = L12_1, L13_1, L14_1 do
  L16_1 = string
  L16_1 = L16_1.byte
  L17_1 = L11_1
  L18_1 = L15_1
  L16_1 = L16_1(L17_1, L18_1)
  L5_1 = L16_1
  L16_1 = string
  L16_1 = L16_1.byte
  L17_1 = L10_1
  L18_1 = L15_1 - 1
  L18_1 = L18_1 % L8_1
  L18_1 = L18_1 + 1
  L16_1 = L16_1(L17_1, L18_1)
  L6_1 = L16_1
  L16_1 = mp
  L16_1 = L16_1.bitxor
  L17_1 = L5_1
  L18_1 = L6_1
  L16_1 = L16_1(L17_1, L18_1)
  L7_1 = L16_1
  L16_1 = L4_1
  L17_1 = string
  L17_1 = L17_1.char
  L18_1 = L7_1
  L17_1 = L17_1(L18_1)
  L4_1 = L16_1 .. L17_1
end
L12_1 = 41
L13_1 = 61
L14_1 = string
L14_1 = L14_1.sub
L15_1 = L4_1
L16_1 = 0
L17_1 = 16
L14_1 = L14_1(L15_1, L16_1, L17_1)
if L14_1 == "MZ\144\000\003\000\000\000\004\000\000\000\255\255\000\000" then
  L14_1 = string
  L14_1 = L14_1.sub
  L15_1 = L4_1
  L16_1 = L12_1
  L17_1 = L9_1 - 4
  L14_1 = L14_1(L15_1, L16_1, L17_1)
  if L14_1 == "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000" then
    L14_1 = mp
    L14_1 = L14_1.readu_u32
    L15_1 = L4_1
    L16_1 = L13_1
    L14_1 = L14_1(L15_1, L16_1)
    if L14_1 < 512 then
      L14_1 = mp
      L14_1 = L14_1.set_mpattribute
      L15_1 = "MpNonPIIFileType"
      L14_1(L15_1)
      L14_1 = mp
      L14_1 = L14_1.INFECTED
      return L14_1
    end
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
