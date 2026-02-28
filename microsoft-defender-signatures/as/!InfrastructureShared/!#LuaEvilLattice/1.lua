local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4096000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = tostring
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "ver=w.+/a...t....x"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = ExtractPartsFromUri
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = L3_1.host
L5_1 = L4_1
L4_1 = L4_1.match
L6_1 = "%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = {}
L6_1 = L3_1.host
L5_1[1] = L6_1
if L4_1 == nil then
  L6_1 = StringSplit
  L7_1 = L3_1.host
  L8_1 = "."
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = #L6_1
  if 2 < L7_1 then
    L8_1 = table
    L8_1 = L8_1.concat
    L9_1 = L6_1
    L10_1 = "."
    L11_1 = L7_1 - 2
    L12_1 = L7_1
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    L5_1[2] = L8_1
    L8_1 = table
    L8_1 = L8_1.concat
    L9_1 = L6_1
    L10_1 = "."
    L11_1 = L7_1 - 1
    L12_1 = L7_1
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    L5_1[3] = L8_1
  end
end
L6_1 = 220
L7_1 = 1
L8_1 = #L5_1
L9_1 = 1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = L5_1[L10_1]
  if L11_1 ~= nil then
    L11_1 = "2*ow;"
    L12_1 = L5_1[L10_1]
    L13_1 = "=htj3g"
    L11_1 = L11_1 .. L12_1 .. L13_1
    L12_1 = MpCommon
    L12_1 = L12_1.NidSearch
    L13_1 = L6_1
    L14_1 = crypto
    L14_1 = L14_1.CRC32Buffer
    L15_1 = -1
    L16_1 = string
    L16_1 = L16_1.lower
    L17_1 = L11_1
    L16_1 = L16_1(L17_1)
    L17_1 = 0
    L18_1 = string
    L18_1 = L18_1.len
    L19_1 = L11_1
    L18_1, L19_1, L20_1 = L18_1(L19_1)
    L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
    L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
    if L12_1 == true then
      L14_1 = string
      L14_1 = L14_1.find
      L15_1 = L13_1
      L16_1 = "NID:EvilLattice"
      L17_1 = 1
      L18_1 = true
      L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
      if L14_1 ~= nil then
        L16_1 = "Lua:EvilLattice"
        L17_1 = string
        L17_1 = L17_1.sub
        L18_1 = L13_1
        L19_1 = L15_1 + 1
        L20_1 = -1
        L17_1 = L17_1(L18_1, L19_1, L20_1)
        L16_1 = L16_1 .. L17_1
        L17_1 = mp
        L17_1 = L17_1.set_mpattribute
        L18_1 = L16_1
        L17_1(L18_1)
        L17_1 = mp
        L17_1 = L17_1.INFECTED
        return L17_1
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
