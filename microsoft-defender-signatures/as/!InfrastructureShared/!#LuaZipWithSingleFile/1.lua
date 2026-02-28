local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 67324752 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 19
L0_1 = L0_1(L1_1, L2_1)
if 4194304 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 27
L1_1 = L1_1(L2_1, L3_1)
if not (128 < L1_1) and not (L1_1 < 4) then
  L2_1 = L1_1 + 31
  L3_1 = mp
  L3_1 = L3_1.HEADERPAGE_SZ
  if not (L2_1 > L3_1) then
    goto lbl_49
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_49::
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = footerpage
L5_1 = mp
L5_1 = L5_1.FOOTERPAGE_SZ
L5_1 = L5_1 - 21
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == 101010256 then
  L3_1 = mp
  L3_1 = L3_1.readu_u16
  L4_1 = footerpage
  L5_1 = mp
  L5_1 = L5_1.FOOTERPAGE_SZ
  L5_1 = L5_1 - 11
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= 1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
else
  L3_1 = 30 + L1_1
  L3_1 = L3_1 + L0_1
  L4_1 = mp
  L4_1 = L4_1.readu_u16
  L5_1 = headerpage
  L6_1 = 29
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1 + L4_1
  L3_1 = L3_1 + 1
  L4_1 = L3_1 + 46
  L4_1 = L4_1 + L1_1
  L5_1 = L2_1 - L4_1
  L6_1 = mp
  L6_1 = L6_1.readu_u32
  L7_1 = footerpage
  L8_1 = mp
  L8_1 = L8_1.FOOTERPAGE_SZ
  L8_1 = L8_1 - L5_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= 101010256 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.readu_u16
  L7_1 = footerpage
  L8_1 = mp
  L8_1 = L8_1.FOOTERPAGE_SZ
  L8_1 = L8_1 - L5_1
  L8_1 = L8_1 + 10
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= 1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = string
L4_1 = L4_1.char
L5_1 = headerpage
L6_1 = 31 + L1_1
L6_1 = L6_1 - 3
L5_1 = L5_1[L6_1]
L6_1 = headerpage
L7_1 = 31 + L1_1
L7_1 = L7_1 - 2
L6_1 = L6_1[L7_1]
L7_1 = headerpage
L8_1 = 31 + L1_1
L8_1 = L8_1 - 1
L7_1 = L7_1[L8_1]
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1, L7_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
if L3_1 ~= "exe" and L3_1 ~= "pif" and L3_1 ~= "scr" and L3_1 ~= ".js" and L3_1 ~= "jse" and L3_1 ~= "vbs" and L3_1 ~= "vbe" and L3_1 ~= "diagcab" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 == ".js" or L3_1 == "jse" then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "//LuaZipWithSingleJS"
  L4_1(L5_1)
end
if L3_1 == ".diagcab" then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "//LuaZipWithSingleDiagCab"
  L4_1(L5_1)
end
if L2_1 < 4000 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "//LuaZipLT4kbWithSingleFile"
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
