local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if not (L0_1 < 128) then
  L0_1 = mp
  L0_1 = L0_1.FOOTERPAGE_SZ
  if not (L0_1 < 22) then
    goto lbl_12
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_12::
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = 276
if L0_1 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "Lua:OutlookAttachZip"
L2_1 = L2_1(L3_1)
if L2_1 and 20971520 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.FOOTERPAGE_SZ
L2_1 = L2_1 - 21
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = footerpage
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 101010256 then
  L3_1 = mp
  L3_1 = L3_1.readprotection
  L4_1 = false
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = L0_1 - L1_1
  L5_1 = L1_1
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = mp
  L4_1 = L4_1.readprotection
  L5_1 = true
  L4_1(L5_1)
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "PK\005\006"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L2_1 = L4_1
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  if L2_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.FOOTERPAGE_SZ
  L4_1 = L2_1 + L4_1
  L2_1 = L4_1 - L1_1
end
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = footerpage
L5_1 = L2_1 + 12
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = footerpage
L6_1 = L2_1 + 16
L4_1 = L4_1(L5_1, L6_1)
L5_1 = L4_1 + L3_1
if L0_1 < L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 338
L6_1 = mp
L6_1 = L6_1.readu_u16
L7_1 = footerpage
L8_1 = L2_1 + 10
L6_1 = L6_1(L7_1, L8_1)
L7_1 = 700
if L6_1 > L7_1 then
  L6_1 = L7_1
end
L8_1 = L5_1 * L6_1
if L3_1 > L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.readprotection
L9_1 = false
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.readfile
L9_1 = L4_1
L10_1 = L3_1
L8_1 = L8_1(L9_1, L10_1)
L9_1 = mp
L9_1 = L9_1.readprotection
L10_1 = true
L9_1(L10_1)
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = 0
L10_1 = 1
L11_1 = 80
L12_1 = 0
L13_1 = mp
L13_1 = L13_1.readu_u32
L14_1 = L8_1
L15_1 = L10_1
L13_1 = L13_1(L14_1, L15_1)
if L13_1 ~= 33639248 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = {}
L13_1[".doc"] = ""
L13_1[".docm"] = ""
L13_1[".dotm"] = ""
L13_1[".dot"] = ""
L13_1[".xls"] = ""
L13_1[".xlsm"] = ""
L13_1[".ppt"] = ""
L13_1[".pptm"] = ""
L13_1[".exe"] = ""
L13_1[".dll"] = ""
L13_1[".scr"] = ""
while L10_1 ~= nil do
  L9_1 = L9_1 + 1
  L14_1 = mp
  L14_1 = L14_1.readu_u16
  L15_1 = L8_1
  L16_1 = L10_1 + 28
  L14_1 = L14_1(L15_1, L16_1)
  L15_1 = string
  L15_1 = L15_1.sub
  L16_1 = L8_1
  L17_1 = L10_1 + 46
  L18_1 = L10_1 + 46
  L18_1 = L18_1 + L14_1
  L18_1 = L18_1 - 1
  L15_1 = L15_1(L16_1, L17_1, L18_1)
  if L15_1 ~= nil then
    L16_1 = string
    L16_1 = L16_1.lower
    L17_1 = L15_1
    L16_1 = L16_1(L17_1)
    L15_1 = L16_1
  end
  L17_1 = L15_1
  L16_1 = L15_1.sub
  L18_1 = -5
  L16_1 = L16_1(L17_1, L18_1)
  L18_1 = L16_1
  L17_1 = L16_1.sub
  L19_1 = -4
  L17_1 = L17_1(L18_1, L19_1)
  L18_1 = L13_1[L17_1]
  if L18_1 == nil then
    L18_1 = L13_1[L16_1]
    if L18_1 == nil then
      goto lbl_206
    end
  end
  L18_1 = mp
  L18_1 = L18_1.readu_u32
  L19_1 = L8_1
  L20_1 = L10_1 + 24
  L18_1 = L18_1(L19_1, L20_1)
  L19_1 = mp
  L19_1 = L19_1.readu_u32
  L20_1 = L8_1
  L21_1 = L10_1 + 20
  L19_1 = L19_1(L20_1, L21_1)
  if 268435456 < L18_1 and 0 < L19_1 then
    L20_1 = L18_1 / L19_1
    if L11_1 < L20_1 then
      L12_1 = L18_1 / L19_1
    end
  end
  ::lbl_206::
  L18_1 = L10_1 + 46
  L18_1 = L18_1 + L14_1
  L18_1 = L18_1 + 36
  L10_1 = nil
  if not (L3_1 > L18_1) then
    break
  end
  L19_1 = mp
  L19_1 = L19_1.readu_u32
  L20_1 = L8_1
  L21_1 = L18_1
  L19_1 = L19_1(L20_1, L21_1)
  if L19_1 == 33639248 then
    L10_1 = L18_1
  else
    break
  end
  if L6_1 < L9_1 then
    break
  end
end
if 80 <= L12_1 then
  L14_1 = mp
  L14_1 = L14_1.set_mpattribute
  L15_1 = "//ZipCompressionRatioGTE80"
  L14_1(L15_1)
  if L0_1 <= 5242880 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "Lua:LE5MZipWithLargeFile"
    L14_1(L15_1)
  elseif L0_1 <= 16777216 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "Lua:GT5LE10MZipWithLargeFile"
    L14_1(L15_1)
  elseif L0_1 <= 67108864 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "Lua:GT10LE40MZipWithLargeFile"
    L14_1(L15_1)
  elseif L0_1 <= 134217728 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "Lua:GT40LE80MZipWithLargeFile"
    L14_1(L15_1)
  elseif L0_1 <= 301989888 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "Lua:GT80LE120MZipWithLargeFile"
    L14_1(L15_1)
  elseif 301989888 < L0_1 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "Lua:GT120MZipWithLargeFile"
    L14_1(L15_1)
  end
end
if 100 <= L12_1 then
  L14_1 = mp
  L14_1 = L14_1.set_mpattribute
  L15_1 = "//ZipCompressionRatioGTE100"
  L14_1(L15_1)
end
if 250 <= L12_1 then
  L14_1 = mp
  L14_1 = L14_1.set_mpattribute
  L15_1 = "//ZipCompressionRatioGTE250"
  L14_1(L15_1)
end
if 500 <= L12_1 then
  L14_1 = mp
  L14_1 = L14_1.set_mpattribute
  L15_1 = "//ZipCompressionRatioGTE500"
  L14_1(L15_1)
end
if 1000 <= L12_1 then
  L14_1 = mp
  L14_1 = L14_1.set_mpattribute
  L15_1 = "//ZipCompressionRatioGTE1000"
  L14_1(L15_1)
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
