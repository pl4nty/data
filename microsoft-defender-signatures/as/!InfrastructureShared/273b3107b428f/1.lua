local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L3_1 = string
L3_1 = L3_1.lower
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = bm
L5_1 = L5_1.get_imagepath
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L5_1()
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L2_1 = L4_1.utf8p2
end
L4_1 = contains
L5_1 = L2_1
L6_1 = "^werfault.exe$"
L7_1 = false
L4_1 = L4_1(L5_1, L6_1, L7_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.get_process_relationships
L4_1, L5_1 = L4_1()
if L5_1 ~= nil then
  L6_1 = ipairs
  L7_1 = L5_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = L10_1.image_path
    if L11_1 ~= nil then
      L11_1 = L10_1.reason
      L12_1 = bm
      L12_1 = L12_1.RELATIONSHIP_INJECTION
      if L11_1 ~= L12_1 then
        L11_1 = L10_1.reason
        L12_1 = bm
        L12_1 = L12_1.RELATIONSHIP_CREATED
        if L11_1 ~= L12_1 then
          goto lbl_64
        end
      end
      L11_1 = string
      L11_1 = L11_1.lower
      L12_1 = L10_1.image_path
      L11_1 = L11_1(L12_1)
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L11_1
      L14_1 = "\\werfault.exe"
      L15_1 = -13
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 then
        L1_1 = L10_1.ppid
      end
    end
    ::lbl_64::
  end
end
if L4_1 ~= nil then
  L6_1 = ipairs
  L7_1 = L4_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = L10_1.image_path
    if L11_1 ~= nil then
      L11_1 = string
      L11_1 = L11_1.lower
      L12_1 = MpCommon
      L12_1 = L12_1.PathToWin32Path
      L13_1 = L10_1.image_path
      L12_1, L13_1, L14_1, L15_1, L16_1 = L12_1(L13_1)
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
      L0_1 = L11_1
    end
    L11_1 = sysio
    L11_1 = L11_1.IsFileExists
    L12_1 = L0_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = mp
      L11_1 = L11_1.IsKnownFriendlyFile
      L12_1 = L0_1
      L13_1 = true
      L14_1 = false
      L11_1 = L11_1(L12_1, L13_1, L14_1)
      if not L11_1 then
        L11_1 = bm
        L11_1 = L11_1.add_related_file
        L12_1 = L0_1
        L11_1(L12_1)
      end
    end
  end
end
L6_1 = sysio
L6_1 = L6_1.IsFileExists
L7_1 = L3_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.IsKnownFriendlyFile
  L7_1 = L3_1
  L8_1 = true
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 and L1_1 ~= nil then
    L6_1 = bm
    L6_1 = L6_1.request_SMS
    L7_1 = L1_1
    L8_1 = "M"
    L6_1(L7_1, L8_1)
    L6_1 = bm
    L6_1 = L6_1.add_action
    L7_1 = "SmsAsyncScanEvent"
    L8_1 = 1
    L6_1(L7_1, L8_1)
    L6_1 = bm
    L6_1 = L6_1.add_related_file
    L7_1 = L3_1
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
