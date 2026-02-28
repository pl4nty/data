local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_netmetadata
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = 0
L3_1 = 0
L4_1 = 0
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = {}
L9_1 = 1
L10_1 = 2
L11_1 = 3
L12_1 = 5
L13_1 = 7
L14_1 = 9
L15_1 = 11
L16_1 = 13
L17_1 = 18
L18_1 = 22
L19_1 = 24
L20_1 = 25
L21_1 = 28
L22_1 = 33
L23_1 = 36
L24_1 = 41
L25_1 = 42
L26_1 = 43
L27_1 = 44
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L8_1[4] = L12_1
L8_1[5] = L13_1
L8_1[6] = L14_1
L8_1[7] = L15_1
L8_1[8] = L16_1
L8_1[9] = L17_1
L8_1[10] = L18_1
L8_1[11] = L19_1
L8_1[12] = L20_1
L8_1[13] = L21_1
L8_1[14] = L22_1
L8_1[15] = L23_1
L8_1[16] = L24_1
L8_1[17] = L25_1
L8_1[18] = L26_1
L8_1[19] = L27_1
L9_1 = 1
L10_1 = #L8_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = L8_1[L12_1]
  L14_1 = L1_1.tokens
  L14_1 = L14_1[L13_1]
  if L13_1 == 1 then
    L3_1 = L14_1.count
  elseif L13_1 == 7 then
    L4_1 = L14_1.count
  elseif L13_1 == 9 then
    L6_1 = L14_1.count
  elseif L13_1 == 11 then
    L7_1 = L14_1.count
  elseif L13_1 == 33 then
    L5_1 = L14_1.count
  end
  L15_1 = L14_1.count
  L2_1 = L2_1 + L15_1
end
L9_1 = 300
if L4_1 <= 300 then
  L9_1 = L4_1
end
L10_1 = false
L11_1 = false
if L3_1 == 1 then
  L12_1 = mp
  L12_1 = L12_1.get_mpattribute
  L13_1 = "AGGR:IsDotNetAMSIScan"
  L12_1 = L12_1(L13_1)
  if L12_1 then
    L12_1 = L1_1.strheap_RVA
    L13_1 = pe
    L13_1 = L13_1.metadata_decode
    L14_1 = 1
    L15_1 = 3
    L13_1 = L13_1(L14_1, L15_1)
    L12_1 = L12_1 + L13_1
    L12_1 = L12_1 + 9
    L13_1 = pe
    L13_1 = L13_1.mmap_string_rva
    L14_1 = L12_1
    L15_1 = 64
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 then
      L14_1 = #L13_1
      if L14_1 == 12 then
        L14_1 = string
        L14_1 = L14_1.find
        L15_1 = L13_1
        L16_1 = "[%l%d]+.[de][lx][le]"
        L14_1 = L14_1(L15_1, L16_1)
        if L14_1 == 1 then
          L14_1 = mp
          L14_1 = L14_1.set_mpattribute
          L15_1 = "Lua:MSIL:PossiblyDynGenRuntimeClass.A"
          L14_1(L15_1)
        end
      end
    end
  end
else
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.AbnormalModuleCount"
  L12_1(L13_1)
end
if L5_1 == 1 then
  L12_1 = pe
  L12_1 = L12_1.metadata_decode
  L13_1 = 536870913
  L14_1 = 7
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 then
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "0x%08X"
    L15_1 = L12_1
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 == "0x00000000" then
      L13_1 = mp
      L13_1 = L13_1.set_mpattribute
      L14_1 = "Lua:MSIL.PublicKeyNull"
      L13_1(L14_1)
    end
  end
end
L12_1 = 1
L13_1 = L9_1
L14_1 = 1
for L15_1 = L12_1, L13_1, L14_1 do
  L16_1 = L1_1.strheap_RVA
  L17_1 = pe
  L17_1 = L17_1.metadata_decode
  L18_1 = 100663296 + L15_1
  L19_1 = 4
  L17_1 = L17_1(L18_1, L19_1)
  L16_1 = L16_1 + L17_1
  L17_1 = pe
  L17_1 = L17_1.mmap_string_rva
  L18_1 = L16_1
  L19_1 = 64
  L17_1 = L17_1(L18_1, L19_1)
  if L17_1 and not L10_1 then
    L18_1 = 1
    L19_1 = #L17_1
    L20_1 = 1
    for L21_1 = L18_1, L19_1, L20_1 do
      L23_1 = L17_1
      L22_1 = L17_1.byte
      L24_1 = L21_1
      L22_1 = L22_1(L23_1, L24_1)
      if 126 <= L22_1 or L22_1 <= 32 then
        L10_1 = true
        break
      end
    end
  end
  if L17_1 then
    L18_1 = #L17_1
    if L18_1 == 0 then
      L11_1 = true
    end
  end
end
if L10_1 or L11_1 then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.AbnormalMethod.Name"
  L12_1(L13_1)
end
if L2_1 < 100000 then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.MetadataSum:"
  L14_1 = tostring
  L15_1 = L2_1
  L14_1 = L14_1(L15_1)
  L13_1 = L13_1 .. L14_1
  L12_1(L13_1)
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.TotalMethods:"
  L14_1 = tostring
  L15_1 = L4_1
  L14_1 = L14_1(L15_1)
  L13_1 = L13_1 .. L14_1
  L12_1(L13_1)
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.TotalParams:"
  L14_1 = tostring
  L15_1 = L6_1
  L14_1 = L14_1(L15_1)
  L13_1 = L13_1 .. L14_1
  L12_1(L13_1)
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.TotalMemberRefs:"
  L14_1 = tostring
  L15_1 = L7_1
  L14_1 = L14_1(L15_1)
  L13_1 = L13_1 .. L14_1
  L12_1(L13_1)
end
if L2_1 == 158 and L4_1 == 10 and L6_1 == 5 and L7_1 == 46 then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.SuspiciousCrypter.A"
  L12_1(L13_1)
elseif (L4_1 == 625 or L4_1 == 630) and L6_1 == 135 and (L7_1 == 288 or L7_1 == 280) then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.SuspiciousCrypter.B"
  L12_1(L13_1)
elseif L2_1 == 236 and L4_1 == 22 and L6_1 == 15 and L7_1 == 51 then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.SuspiciousCrypter.C"
  L12_1(L13_1)
elseif L2_1 == 263 and L4_1 == 22 and L6_1 == 8 and L7_1 == 63 then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:MSIL.SuspiciousCrypter.D"
  L12_1(L13_1)
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
