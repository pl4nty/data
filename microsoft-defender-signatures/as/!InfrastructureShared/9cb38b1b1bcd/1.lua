local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = tonumber
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.utf8p1
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 < 315392 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsSenseRelatedProc
L1_1 = L1_1()
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L1_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.image_path
    if L8_1 ~= nil then
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = MpCommon
      L9_1 = L9_1.PathToWin32Path
      L10_1 = L7_1.image_path
      L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1)
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L8_1
      L11_1 = "gravostyle"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if not L9_1 then
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "typeedit"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if not L9_1 then
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "lasertype"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if not L9_1 then
            goto lbl_69
          end
        end
      end
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      do return L9_1 end
      ::lbl_69::
      L9_1 = sysio
      L9_1 = L9_1.IsFileExists
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.IsKnownFriendlyFile
        L10_1 = L8_1
        L11_1 = true
        L12_1 = false
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        if not L9_1 then
          L9_1 = bm
          L9_1 = L9_1.add_related_file
          L10_1 = L8_1
          L9_1(L10_1)
        end
      end
    end
  end
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = bm
L5_1 = L5_1.get_imagepath
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L5_1()
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L4_1 = sysio
L4_1 = L4_1.IsFileExists
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.IsKnownFriendlyFile
  L5_1 = L3_1
  L6_1 = true
  L7_1 = false
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if not L4_1 then
    L4_1 = bm
    L4_1 = L4_1.add_related_file
    L5_1 = L3_1
    L4_1(L5_1)
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
