local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 256 or 15728640 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = headerpage
L1_1 = L1_1[5]
L1_1 = L1_1 == 2
L2_1 = headerpage
L2_1 = L2_1[6]
L2_1 = L2_1 == 2
L3_1 = 0
L4_1 = 0
L5_1 = 0
if L1_1 then
  L6_1 = mp
  L6_1 = L6_1.readu_u64
  L7_1 = headerpage
  L8_1 = 41
  L6_1 = L6_1(L7_1, L8_1)
  L3_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.readu_u16
  L7_1 = headerpage
  L8_1 = 59
  L6_1 = L6_1(L7_1, L8_1)
  L4_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.readu_u16
  L7_1 = headerpage
  L8_1 = 61
  L6_1 = L6_1(L7_1, L8_1)
  L5_1 = L6_1
else
  L6_1 = mp
  L6_1 = L6_1.readu_u32
  L7_1 = headerpage
  L8_1 = 33
  L6_1 = L6_1(L7_1, L8_1)
  L3_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.readu_u16
  L7_1 = headerpage
  L8_1 = 47
  L6_1 = L6_1(L7_1, L8_1)
  L4_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.readu_u16
  L7_1 = headerpage
  L8_1 = 49
  L6_1 = L6_1(L7_1, L8_1)
  L5_1 = L6_1
end
if L2_1 then
  if L1_1 then
    L6_1 = mp
    L6_1 = L6_1.bswap64
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    L3_1 = L6_1
  else
    L6_1 = mp
    L6_1 = L6_1.bswap32
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    L3_1 = L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.bswap16
  L7_1 = L4_1
  L6_1 = L6_1(L7_1)
  L4_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.bswap16
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
end
L6_1 = L4_1 * L5_1
L6_1 = L3_1 + L6_1
L7_1 = L6_1 + 128
if L0_1 < L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = false
L7_1(L8_1)
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = L6_1
L9_1 = L0_1 - L6_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.readprotection
L9_1 = true
L8_1(L9_1)
L8_1 = false
L9_1 = 0
L10_1 = {}
L11_1 = {}
L12_1 = "\127ELF"
L13_1 = "ELF"
L11_1[1] = L12_1
L11_1[2] = L13_1
L12_1 = {}
L13_1 = "PK\003\004"
L14_1 = "ZIP1"
L12_1[1] = L13_1
L12_1[2] = L14_1
L13_1 = {}
L14_1 = "PK\a\b"
L15_1 = "ZIP2"
L13_1[1] = L14_1
L13_1[2] = L15_1
L14_1 = {}
L15_1 = "7z\188\175"
L16_1 = "7Z"
L14_1[1] = L15_1
L14_1[2] = L16_1
L15_1 = {}
L16_1 = "\031\139"
L17_1 = "GZIP"
L15_1[1] = L16_1
L15_1[2] = L17_1
L16_1 = {}
L17_1 = "BZh"
L18_1 = "BZIP"
L16_1[1] = L17_1
L16_1[2] = L18_1
L10_1[1] = L11_1
L10_1[2] = L12_1
L10_1[3] = L13_1
L10_1[4] = L14_1
L10_1[5] = L15_1
L10_1[6] = L16_1
L11_1 = ipairs
L12_1 = L10_1
L11_1, L12_1, L13_1 = L11_1(L12_1)
for L14_1, L15_1 in L11_1, L12_1, L13_1 do
  L17_1 = L7_1
  L16_1 = L7_1.find
  L18_1 = L15_1[1]
  L19_1 = 1
  L20_1 = 4096
  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
  L9_1 = L16_1
  if L9_1 and 1 <= L9_1 then
    L16_1 = mp
    L16_1 = L16_1.vfo_add_buffer
    L18_1 = L7_1
    L17_1 = L7_1.sub
    L19_1 = L9_1
    L17_1 = L17_1(L18_1, L19_1)
    L18_1 = "[ELFOverlay_"
    L19_1 = L15_1[2]
    L20_1 = "]"
    L18_1 = L18_1 .. L19_1 .. L20_1
    L19_1 = mp
    L19_1 = L19_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L16_1(L17_1, L18_1, L19_1)
    L8_1 = true
  end
end
if L8_1 then
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
