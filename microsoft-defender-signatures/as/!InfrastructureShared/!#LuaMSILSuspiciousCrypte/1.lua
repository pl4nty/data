local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L2_1 = pe
L2_1 = L2_1.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
L1_1 = L1_1[L2_1]
L1_1 = L1_1.Size
if L0_1 == 0 or L1_1 == 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.mmap_rva
L3_1 = L0_1
L4_1 = 20
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L2_1
L5_1 = 1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 72 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = L2_1
L5_1 = 9
L3_1 = L3_1(L4_1, L5_1)
L4_1 = pe
L4_1 = L4_1.mmap_rva
L5_1 = L3_1
L6_1 = 256
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L4_1
L7_1 = 1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 1112167234 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L4_1
L7_1 = 13
L5_1 = L5_1(L6_1, L7_1)
L6_1 = string
L6_1 = L6_1.sub
L7_1 = L4_1
L8_1 = 17
L9_1 = 18
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 == "v2" then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:MSIL:FrameworkV2"
  L7_1(L8_1)
elseif L6_1 == "v4" then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:MSIL:FrameworkV4"
  L7_1(L8_1)
else
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:MSIL:UnknownFrameworkVersion"
  L7_1(L8_1)
end
L7_1 = 17 + L5_1
L8_1 = L7_1 + 4
L9_1 = L7_1 + 2
if 256 <= L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.readu_u16
L10_1 = L4_1
L11_1 = L7_1 + 2
L9_1 = L9_1(L10_1, L11_1)
if L9_1 ~= 5 then
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:MSIL:NonStandardStreamCount"
  L10_1(L11_1)
end
L10_1 = {}
L10_1["#~"] = true
L10_1["#GUID"] = true
L10_1["#US"] = true
L10_1["#Blob"] = true
L10_1["#Strings"] = true
L11_1 = L8_1
L12_1 = 0
L13_1 = L9_1 - 1
L14_1 = 1
for L15_1 = L12_1, L13_1, L14_1 do
  if 20 <= L15_1 or 256 <= L11_1 then
    break
  end
  L11_1 = L11_1 + 8
  L16_1 = ""
  while L11_1 < 256 do
    L18_1 = L4_1
    L17_1 = L4_1.byte
    L19_1 = L11_1
    L17_1 = L17_1(L18_1, L19_1)
    if L17_1 == 0 then
      break
    end
    L17_1 = L16_1
    L18_1 = string
    L18_1 = L18_1.char
    L20_1 = L4_1
    L19_1 = L4_1.byte
    L21_1 = L11_1
    L19_1, L20_1, L21_1 = L19_1(L20_1, L21_1)
    L18_1 = L18_1(L19_1, L20_1, L21_1)
    L16_1 = L17_1 .. L18_1
    L11_1 = L11_1 + 1
  end
  L17_1 = L10_1[L16_1]
  if L17_1 == nil then
    L17_1 = mp
    L17_1 = L17_1.set_mpattribute
    L18_1 = "Lua:MSIL:NonStandardStreamName"
    L17_1(L18_1)
    break
  end
  L17_1 = #L16_1
  L17_1 = L17_1 + 4
  L18_1 = #L16_1
  L18_1 = L18_1 % 4
  L17_1 = L17_1 - L18_1
  L18_1 = #L16_1
  L17_1 = L17_1 - L18_1
  L11_1 = L11_1 + L17_1
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
