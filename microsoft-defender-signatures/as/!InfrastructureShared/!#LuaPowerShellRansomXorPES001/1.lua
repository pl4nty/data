local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 20480 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfooter
L2_1 = 0
L3_1 = 4096
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "bxor"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readheader
L4_1 = 0
L5_1 = 4096
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = ""
L5_1 = string
L5_1 = L5_1.gmatch
L6_1 = L2_1
L7_1 = "bxor%s+(0x%x%x)"
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
for L8_1 in L5_1, L6_1, L7_1 do
  if L8_1 ~= nil and L8_1 ~= "" then
    L9_1 = string
    L9_1 = L9_1.gmatch
    L10_1 = L3_1
    L11_1 = "(0x%x%x)"
    L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
    for L12_1 in L9_1, L10_1, L11_1 do
      if L12_1 ~= nil and L12_1 ~= "" then
        L13_1 = L4_1
        L14_1 = string
        L14_1 = L14_1.char
        L15_1 = mp
        L15_1 = L15_1.bitxor
        L16_1 = L12_1
        L17_1 = L8_1
        L15_1, L16_1, L17_1, L18_1 = L15_1(L16_1, L17_1)
        L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
        L4_1 = L13_1 .. L14_1
      end
    end
  end
end
if L4_1 ~= nil and L4_1 ~= "" then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "0x4d,0x5a,0x90,0x00,0x03,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0xff,0xff"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:PEembedViaXOR.S001"
    L5_1(L6_1)
  end
end
L5_1 = ""
L6_1 = string
L6_1 = L6_1.gmatch
L7_1 = L2_1
L8_1 = "bxor%s+(%d?%d%d?)"
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
for L9_1 in L6_1, L7_1, L8_1 do
  if L9_1 ~= nil and L9_1 ~= "" then
    L10_1 = string
    L10_1 = L10_1.gmatch
    L11_1 = L3_1
    L12_1 = "(0x%x%x)"
    L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1)
    for L13_1 in L10_1, L11_1, L12_1 do
      if L13_1 ~= nil and L13_1 ~= "" then
        L14_1 = L5_1
        L15_1 = string
        L15_1 = L15_1.char
        L16_1 = mp
        L16_1 = L16_1.bitxor
        L17_1 = L13_1
        L18_1 = L9_1
        L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
        L15_1 = L15_1(L16_1, L17_1, L18_1)
        L5_1 = L14_1 .. L15_1
      end
    end
  end
end
if L5_1 ~= nil and L5_1 ~= "" then
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = "0x4d,0x5a,0x90,0x00,0x03,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0xff,0xff"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:PEembedViaXOR.S001"
    L6_1(L7_1)
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
