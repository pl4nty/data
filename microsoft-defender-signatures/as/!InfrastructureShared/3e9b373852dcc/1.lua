local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p1
  L4_1 = L4_1(L5_1)
  L0_1 = L4_1
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p1
    L4_1 = L4_1(L5_1)
    L1_1 = L4_1
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[12]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[12]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[12]
    L5_1 = L5_1.utf8p2
    L4_1 = L4_1(L5_1)
    L2_1 = L4_1
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[10]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[10]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[10]
    L5_1 = L5_1.utf8p2
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
  end
end
if L2_1 and L3_1 then
  L4_1 = pcall
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L2_1
  L7_1 = "regionsize:(%d+)"
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 then
    L6_1 = isnull
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    if not L6_1 then
      goto lbl_80
    end
  end
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  do return L6_1 end
  ::lbl_80::
  L6_1 = nil
  L7_1 = nil
  L8_1 = versioning
  L8_1 = L8_1.GetProcessorArchitecture
  L8_1 = L8_1()
  if L8_1 == 0 then
    L6_1 = L1_1
    L7_1 = "32"
  elseif L8_1 == 9 then
    L9_1 = this_sigattrlog
    L9_1 = L9_1[1]
    L9_1 = L9_1.matched
    if L9_1 then
      L6_1 = L0_1
      L7_1 = "32"
    else
      L9_1 = this_sigattrlog
      L9_1 = L9_1[2]
      L9_1 = L9_1.matched
      if L9_1 then
        L6_1 = L1_1
        L7_1 = "64"
      end
    end
  end
  if L6_1 then
    L9_1 = pcall
    L10_1 = sysio
    L10_1 = L10_1.GetPEVersionInfo
    L11_1 = L6_1
    L9_1, L10_1 = L9_1(L10_1, L11_1)
    if L9_1 then
      L11_1 = isnull
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if not L11_1 then
        goto lbl_123
      end
    end
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    do return L11_1 end
    ::lbl_123::
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
          goto lbl_144
        end
      end
    end
    L14_1 = mp
    L14_1 = L14_1.CLEAN
    do return L14_1 end
    ::lbl_144::
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
    L16_1 = L7_1
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
  end
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "PATCHED BYTES: "
  L11_1 = L5_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "MALCIOUS PATH: "
  L11_1 = L3_1
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
