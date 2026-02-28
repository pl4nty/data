local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 9
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == nil or L0_1 <= 0 or 32 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 13
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L1_1 == 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = 0
L3_1 = L0_1 - 1
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = L5_1 * 12
  L6_1 = L1_1 + L6_1
  L7_1 = mp
  L7_1 = L7_1.readu_u32
  L8_1 = headerpage
  L9_1 = L6_1 + 1
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = mp
  L8_1 = L8_1.readu_u32
  L9_1 = headerpage
  L10_1 = L6_1 + 9
  L8_1 = L8_1(L9_1, L10_1)
  if L7_1 == 4 then
    L9_1 = mp
    L9_1 = L9_1.readprotection
    L10_1 = false
    L9_1(L10_1)
    L9_1 = mp
    L9_1 = L9_1.readfile
    L10_1 = L8_1 + 24
    L11_1 = 4
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 == nil then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
    L10_1 = mp
    L10_1 = L10_1.readu_u32
    L11_1 = L9_1
    L12_1 = 1
    L10_1 = L10_1(L11_1, L12_1)
    L9_1 = L10_1
    L10_1 = mp
    L10_1 = L10_1.readfile
    L11_1 = L9_1
    L12_1 = 4
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 == nil then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L11_1 = mp
    L11_1 = L11_1.readu_u32
    L12_1 = L10_1
    L13_1 = 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == nil or L11_1 == 0 or 256 <= L11_1 then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
    L12_1 = mp
    L12_1 = L12_1.readfile
    L13_1 = L9_1 + 4
    L14_1 = L11_1
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 == nil then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
    L13_1 = string
    L13_1 = L13_1.gsub
    L14_1 = L12_1
    L15_1 = "%z"
    L16_1 = ""
    L13_1 = L13_1(L14_1, L15_1, L16_1)
    L14_1 = string
    L14_1 = L14_1.lower
    L15_1 = L13_1
    L14_1 = L14_1(L15_1)
    L13_1 = L14_1
    L14_1 = string
    L14_1 = L14_1.find
    L15_1 = L13_1
    L16_1 = "c:\\windows\\system32\\lsasrv.dll"
    L17_1 = 1
    L18_1 = true
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    if L14_1 then
      L14_1 = mp
      L14_1 = L14_1.readu_u64
      L15_1 = headerpage
      L16_1 = 25
      L14_1 = L14_1(L15_1, L16_1)
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = "LUA:MemDumpType_"
      L17_1 = string
      L17_1 = L17_1.format
      L18_1 = "%x"
      L19_1 = L14_1
      L17_1 = L17_1(L18_1, L19_1)
      L16_1 = L16_1 .. L17_1
      L15_1(L16_1)
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = "BM_MEMDUMP_FILE_LSASRV"
      L15_1(L16_1)
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
    break
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
