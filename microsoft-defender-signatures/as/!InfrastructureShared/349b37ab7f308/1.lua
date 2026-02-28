local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L5_1 = L5_1.utf8p1
    L4_1 = L4_1(L5_1)
    L0_1 = L4_1
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L5_1 = L5_1.image_path
    L4_1 = L4_1(L5_1)
    L1_1 = L4_1
    L4_1 = tonumber
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L5_1 = L5_1.ppid
    L4_1 = L4_1(L5_1)
    L2_1 = L4_1
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[9]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[9]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[9]
    L5_1 = L5_1.utf8p1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
  end
end
if L0_1 and L3_1 then
  L4_1 = pcall
  L5_1 = bm
  L5_1 = L5_1.GetModAddress
  L6_1 = L2_1
  L7_1 = L3_1
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 then
    L6_1 = isnull
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    if not L6_1 then
      goto lbl_68
    end
  end
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  do return L6_1 end
  ::lbl_68::
  L6_1 = pcall
  L7_1 = bm
  L7_1 = L7_1.GetProcAddress
  L8_1 = L2_1
  L9_1 = L3_1
  L10_1 = "ldrpmrdatabase"
  L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L8_1 = isnull
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if not L8_1 then
      goto lbl_85
    end
  end
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  do return L8_1 end
  ::lbl_85::
  L8_1 = pcall
  L9_1 = bm
  L9_1 = L9_1.GetProcAddress
  L10_1 = L2_1
  L11_1 = L3_1
  L12_1 = "avrfpapilookupcallbackroutine"
  L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 then
    L10_1 = isnull
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if not L10_1 then
      goto lbl_102
    end
  end
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  do return L10_1 end
  ::lbl_102::
  L10_1 = bm
  L10_1 = L10_1.add_related_string
  L11_1 = "Sus Image Patch: "
  L12_1 = L1_1
  L13_1 = bm
  L13_1 = L13_1.RelatedStringBMReport
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = bm
  L10_1 = L10_1.add_related_string
  L11_1 = "Sus ntdll Address: "
  L12_1 = L5_1
  L13_1 = bm
  L13_1 = L13_1.RelatedStringBMReport
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = bm
  L10_1 = L10_1.add_related_string
  L11_1 = "Sus LdrpMrdataBase Address: "
  L12_1 = L7_1
  L13_1 = bm
  L13_1 = L13_1.RelatedStringBMReport
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = bm
  L10_1 = L10_1.add_related_string
  L11_1 = "Sus AvrfpAPILookupCallbackRoutine Address: "
  L12_1 = L9_1
  L13_1 = bm
  L13_1 = L13_1.RelatedStringBMReport
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
