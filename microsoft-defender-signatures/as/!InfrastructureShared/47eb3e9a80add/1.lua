local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p1
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[9]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[9]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[9]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
end
if L2_1 then
  L3_1 = pcall
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L2_1
  L6_1 = "vmbaseaddress:(%d+)"
  L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 then
    L5_1 = isnull
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      goto lbl_61
    end
  end
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  do return L5_1 end
  ::lbl_61::
  L5_1 = pcall
  L6_1 = string
  L6_1 = L6_1.match
  L7_1 = L2_1
  L8_1 = "vmbytescopied:(%d+)"
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 then
    L7_1 = isnull
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      goto lbl_77
    end
  end
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  do return L7_1 end
  ::lbl_77::
  L7_1 = nil
  L8_1 = nil
  if L0_1 then
    L7_1 = L0_1
    L8_1 = "32"
  elseif L1_1 then
    L7_1 = L1_1
    L8_1 = "64"
  end
  if L7_1 then
    L9_1 = pcall
    L10_1 = sysio
    L10_1 = L10_1.GetPEVersionInfo
    L11_1 = L7_1
    L9_1, L10_1 = L9_1(L10_1, L11_1)
    if L9_1 then
      L11_1 = isnull
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if not L11_1 then
        goto lbl_104
      end
    end
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    do return L11_1 end
    ::lbl_104::
    L11_1 = L10_1.OriginalFilename
    L12_1 = L10_1.ProductVersion
    L13_1 = L10_1.FileVersion
    L14_1 = isnull
    L15_1 = L11_1
    L14_1 = L14_1(L15_1)
    if not L14_1 then
      L14_1 = isnull
      L15_1 = L12_1
      L14_1 = L14_1(L15_1)
      if not L14_1 then
        L14_1 = isnull
        L15_1 = L13_1
        L14_1 = L14_1(L15_1)
        if not L14_1 then
          goto lbl_125
        end
      end
    end
    L14_1 = mp
    L14_1 = L14_1.CLEAN
    do return L14_1 end
    ::lbl_125::
    L14_1 = bm
    L14_1 = L14_1.add_related_string
    L15_1 = "PRODUCT VERSION: "
    L16_1 = L12_1
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = bm
    L14_1 = L14_1.add_related_string
    L15_1 = "FILE VERSION: "
    L16_1 = L13_1
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
    L14_1 = bm
    L14_1 = L14_1.add_related_string
    L15_1 = "ARCH: "
    L16_1 = L8_1
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
  end
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "PATCHED BYTES: "
  L11_1 = L6_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "ETW ABSOLUTE PATCHED ADDRESS: "
  L11_1 = L4_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
