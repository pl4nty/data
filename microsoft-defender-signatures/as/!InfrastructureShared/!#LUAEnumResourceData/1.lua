local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 33554432 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = 2
L4_1 = 9
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 ~= ":\\users\\" then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "Lua:TriggerLUAEnumResourceData"
  L1_1 = L1_1(L2_1)
  if L1_1 ~= true then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end

function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  L4_2 = 524288
  L5_2 = 30
  L6_2 = #A3_2
  if L5_2 < L6_2 then
    return A3_2
  end
  if 0 < A2_2 then
    A1_2 = A0_2 + A1_2
  else
    A1_2 = A0_2
  end
  L6_2 = {}
  L6_2[1] = "LUA:HasResType_RT_CURSOR"
  L6_2[2] = "LUA:HasResType_RT_BITMAP"
  L6_2[3] = "LUA:HasResType_RT_ICON"
  L6_2[4] = "LUA:HasResType_RT_MENU"
  L6_2[5] = "LUA:HasResType_RT_DIALOG"
  L6_2[6] = "LUA:HasResType_RT_STRING"
  L6_2[7] = "LUA:HasResType_RT_FONTDIR"
  L6_2[8] = "LUA:HasResType_RT_FONT"
  L6_2[9] = "LUA:HasResType_RT_ACCELERATOR"
  L6_2[10] = "LUA:HasResType_RT_RCDATA"
  L6_2[11] = "LUA:HasResType_RT_MESSAGETABLE"
  L6_2[12] = "LUA:HasResType_RT_GROUP_CURSOR"
  L6_2[14] = "LUA:HasResType_RT_GROUP_ICON"
  L6_2[16] = "LUA:HasResType_RT_VERSION"
  L6_2[17] = "LUA:HasResType_RT_DLGINCLUDE"
  L6_2[19] = "LUA:HasResType_RT_PLUGPLAY"
  L6_2[20] = "LUA:HasResType_RT_VXD"
  L6_2[21] = "LUA:HasResType_RT_ANICURSOR"
  L6_2[22] = "LUA:HasResType_RT_ANIICON"
  L6_2[23] = "LUA:HasResType_RT_HTML"
  L6_2[24] = "LUA:HasResType_RT_MANIFEST"
  L7_2 = pe
  L7_2 = L7_2.mmap_rva
  L8_2 = A1_2
  L9_2 = 16
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = mp
  L8_2 = L8_2.readu_u16
  L9_2 = L7_2
  L10_2 = 13
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = mp
  L9_2 = L9_2.readu_u16
  L10_2 = L7_2
  L11_2 = 15
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L9_2 + L8_2
  if L10_2 == 0 then
    return A3_2
  end
  L11_2 = 0
  L12_2 = L10_2 - 1
  L13_2 = 1
  for L14_2 = L11_2, L12_2, L13_2 do
    L15_2 = L14_2 * 8
    L15_2 = L15_2 + 16
    L15_2 = L15_2 + A1_2
    L16_2 = pe
    L16_2 = L16_2.mmap_rva
    L17_2 = L15_2
    L18_2 = 8
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = mp
    L17_2 = L17_2.readu_u32
    L18_2 = L16_2
    L19_2 = 5
    L17_2 = L17_2(L18_2, L19_2)
    L18_2 = mp
    L18_2 = L18_2.readu_u32
    L19_2 = L16_2
    L20_2 = 1
    L18_2 = L18_2(L19_2, L20_2)
    if L14_2 >= L8_2 and A2_2 == 0 then
      L19_2 = L6_2[L18_2]
      if L19_2 then
        L19_2 = mp
        L19_2 = L19_2.set_mpattribute
        L20_2 = L6_2[L18_2]
        L19_2(L20_2)
      end
    end
    L19_2 = mp
    L19_2 = L19_2.bitand
    L20_2 = L17_2
    L21_2 = 268435455
    L19_2 = L19_2(L20_2, L21_2)
    L20_2 = mp
    L20_2 = L20_2.bitand
    L21_2 = L17_2
    L22_2 = 2147483648
    L20_2 = L20_2(L21_2, L22_2)
    if L20_2 ~= 0 then
      if A2_2 < 3 then
        L20_2 = EnumResourceCRC32s
        L21_2 = A0_2
        L22_2 = L19_2
        L23_2 = A2_2 + 1
        L24_2 = A3_2
        L20_2(L21_2, L22_2, L23_2, L24_2)
      end
    else
      L20_2 = pe
      L20_2 = L20_2.mmap_rva
      L21_2 = A0_2 + L19_2
      L22_2 = 16
      L20_2 = L20_2(L21_2, L22_2)
      L21_2 = mp
      L21_2 = L21_2.readu_u32
      L22_2 = L20_2
      L23_2 = 1
      L21_2 = L21_2(L22_2, L23_2)
      L22_2 = mp
      L22_2 = L22_2.readu_u32
      L23_2 = L20_2
      L24_2 = 5
      L22_2 = L22_2(L23_2, L24_2)
      if L4_2 <= L22_2 then
        L23_2 = mp
        L23_2 = L23_2.set_mpattribute
        L24_2 = "Lua:InterestingResourceDataSizeGTE0x80000!CrcSkipped"
        L23_2(L24_2)
        return A3_2
      end
      L23_2 = pe
      L23_2 = L23_2.mmap_rva
      L24_2 = L21_2
      L25_2 = L22_2
      L23_2 = L23_2(L24_2, L25_2)
      L24_2 = mp
      L24_2 = L24_2.crc32
      L25_2 = -1
      L26_2 = L23_2
      L27_2 = 1
      L28_2 = 0
      L24_2 = L24_2(L25_2, L26_2, L27_2, L28_2)
      L25_2 = "Lua:InterestingResourceData"
      L26_2 = string
      L26_2 = L26_2.sub
      L27_2 = L23_2
      L28_2 = 1
      L29_2 = 8
      L26_2 = L26_2(L27_2, L28_2, L29_2)
      if L26_2 == "\137PNG\r\n\026\n" then
        L26_2 = mp
        L26_2 = L26_2.set_mpattribute
        L27_2 = string
        L27_2 = L27_2.format
        L28_2 = "%sFormat:PNG!crc0x%08x"
        L29_2 = L25_2
        L30_2 = L24_2
        L27_2, L28_2, L29_2, L30_2 = L27_2(L28_2, L29_2, L30_2)
        L26_2(L27_2, L28_2, L29_2, L30_2)
      else
        L26_2 = string
        L26_2 = L26_2.sub
        L27_2 = L23_2
        L28_2 = 1
        L29_2 = 3
        L26_2 = L26_2(L27_2, L28_2, L29_2)
        if L26_2 == "(\000\000" and 8192 <= L22_2 then
          L26_2 = mp
          L26_2 = L26_2.set_mpattribute
          L27_2 = string
          L27_2 = L27_2.format
          L28_2 = "%sFormat:ICO!crc0x%08x"
          L29_2 = L25_2
          L30_2 = L24_2
          L27_2, L28_2, L29_2, L30_2 = L27_2(L28_2, L29_2, L30_2)
          L26_2(L27_2, L28_2, L29_2, L30_2)
        else
          L26_2 = string
          L26_2 = L26_2.sub
          L27_2 = L23_2
          L28_2 = 1
          L29_2 = 2
          L26_2 = L26_2(L27_2, L28_2, L29_2)
          if L26_2 == "BM" and 12288 <= L22_2 then
            L26_2 = mp
            L26_2 = L26_2.set_mpattribute
            L27_2 = string
            L27_2 = L27_2.format
            L28_2 = "%sFormat:BMP!crc0x%08x"
            L29_2 = L25_2
            L30_2 = L24_2
            L27_2, L28_2, L29_2, L30_2 = L27_2(L28_2, L29_2, L30_2)
            L26_2(L27_2, L28_2, L29_2, L30_2)
          elseif 131072 <= L22_2 then
            L26_2 = mp
            L26_2 = L26_2.set_mpattribute
            L27_2 = string
            L27_2 = L27_2.format
            L28_2 = "%sSizeGTE0x20000!crc0x%08x"
            L29_2 = L25_2
            L30_2 = L24_2
            L27_2, L28_2, L29_2, L30_2 = L27_2(L28_2, L29_2, L30_2)
            L26_2(L27_2, L28_2, L29_2, L30_2)
          elseif 73728 <= L22_2 then
            L26_2 = mp
            L26_2 = L26_2.set_mpattribute
            L27_2 = string
            L27_2 = L27_2.format
            L28_2 = "%sSizeGTE0x12000!crc0x%08x"
            L29_2 = L25_2
            L30_2 = L24_2
            L27_2, L28_2, L29_2, L30_2 = L27_2(L28_2, L29_2, L30_2)
            L26_2(L27_2, L28_2, L29_2, L30_2)
          elseif 32768 <= L22_2 then
            L26_2 = mp
            L26_2 = L26_2.set_mpattribute
            L27_2 = string
            L27_2 = L27_2.format
            L28_2 = "%sSizeGTE0x8000!crc0x%08x"
            L29_2 = L25_2
            L30_2 = L24_2
            L27_2, L28_2, L29_2, L30_2 = L27_2(L28_2, L29_2, L30_2)
            L26_2(L27_2, L28_2, L29_2, L30_2)
          end
        end
      end
      L26_2 = #A3_2
      L26_2 = L26_2 + 1
      A3_2[L26_2] = L24_2
    end
  end
  return A3_2
end

EnumResourceCRC32s = L1_1

function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = {}
  L1_2 = peattributes
  L1_2 = L1_2.isdll
  if not L1_2 then
    L1_2 = peattributes
    L1_2 = L1_2.isexe
    if not L1_2 then
      goto lbl_40
    end
  end
  L1_2 = pehdr
  L1_2 = L1_2.DataDirectory
  L2_2 = pe
  L2_2 = L2_2.IMAGE_DIRECTORY_ENTRY_RESOURCE
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.RVA
  L2_2 = pehdr
  L2_2 = L2_2.DataDirectory
  L3_2 = pe
  L3_2 = L3_2.IMAGE_DIRECTORY_ENTRY_RESOURCE
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.Size
  if 0 < L1_2 and 0 < L2_2 then
    L3_2 = mp
    L3_2 = L3_2.readprotection
    L4_2 = false
    L3_2(L4_2)
    L3_2 = EnumResourceCRC32s
    L4_2 = L1_2
    L5_2 = 0
    L6_2 = 0
    L7_2 = L0_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = mp
    L3_2 = L3_2.readprotection
    L4_2 = true
    L3_2(L4_2)
  end
  ::lbl_40::
  return L0_2
end

GetResourceCRC32s = L1_1
L1_1 = {}
L1_1[3404687433] = "LUA:ConstructorIconFile1"
L2_1 = GetResourceCRC32s
L2_1 = L2_1()
L3_1 = #L2_1
if L3_1 < 5 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:ResourceDataEntryLT5"
  L3_1(L4_1)
end
L3_1 = #L2_1
if 5 <= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:ResourceDataEntryGE5"
  L3_1(L4_1)
end
L3_1 = #L2_1
if 10 <= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:ResourceDataEntryGE10"
  L3_1(L4_1)
end
L3_1 = #L2_1
if 15 <= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:ResourceDataEntryGE15"
  L3_1(L4_1)
end
L3_1 = #L2_1
if 20 <= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:ResourceDataEntryGE20"
  L3_1(L4_1)
end
L3_1 = 1
L4_1 = #L2_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = L2_1[L6_1]
  L7_1 = L1_1[L7_1]
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = L2_1[L6_1]
    L8_1 = L1_1[L8_1]
    L7_1(L8_1)
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
