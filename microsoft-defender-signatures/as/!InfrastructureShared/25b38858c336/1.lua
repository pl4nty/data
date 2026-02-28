local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = nil
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = GetRollingQueueKeyValue
L3_1 = "SpPatchVersion"
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = "SpPatchVersion"
  L4_1 = 86400
  L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  L6_1 = sysio
  L6_1 = L6_1.RegOpenKey
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if not L6_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = sysio
  L7_1 = L7_1.RegEnumKeys
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = pairs
  L9_1 = L7_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = string
    L13_1 = L13_1.find
    L14_1 = L12_1
    L15_1 = "{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_"
    L16_1 = 1
    L17_1 = true
    L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
    if not L13_1 then
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if not L13_1 then
        L13_1 = string
        L13_1 = L13_1.find
        L14_1 = L12_1
        L15_1 = "{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_"
        L16_1 = 1
        L17_1 = true
        L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
        if not L13_1 then
          goto lbl_132
        end
      end
    end
    L13_1 = sysio
    L13_1 = L13_1.RegOpenKey
    L14_1 = L5_1
    L15_1 = "\\"
    L16_1 = L12_1
    L14_1 = L14_1 .. L15_1 .. L16_1
    L13_1 = L13_1(L14_1)
    if L13_1 then
      L14_1 = sysio
      L14_1 = L14_1.GetRegValueAsString
      L15_1 = L13_1
      L16_1 = "DisplayVersion"
      L14_1 = L14_1(L15_1, L16_1)
      L2_1 = L14_1
      if L2_1 ~= nil then
        L14_1 = AppendToRollingQueue
        L15_1 = L3_1
        L16_1 = L0_1
        L17_1 = L2_1
        L18_1 = L4_1
        L14_1(L15_1, L16_1, L17_1, L18_1)
        L14_1 = bm
        L14_1 = L14_1.add_related_string
        L15_1 = "SpPatchVersion"
        L16_1 = L2_1
        L17_1 = bm
        L17_1 = L17_1.RelatedStringBMReport
        L14_1(L15_1, L16_1, L17_1)
        L14_1 = mp
        L14_1 = L14_1.INFECTED
        do return L14_1 end
        break
      end
      L14_1 = sysio
      L14_1 = L14_1.GetRegValueAsString
      L15_1 = L13_1
      L16_1 = "DisplayName"
      L14_1 = L14_1(L15_1, L16_1)
      L1_1 = L14_1
      if L1_1 ~= nil then
        L14_1 = AppendToRollingQueue
        L15_1 = L3_1
        L16_1 = L0_1
        L17_1 = L1_1
        L18_1 = L4_1
        L14_1(L15_1, L16_1, L17_1, L18_1)
        L14_1 = bm
        L14_1 = L14_1.add_related_string
        L15_1 = "SpPatchVersion"
        L16_1 = L1_1
        L17_1 = bm
        L17_1 = L17_1.RelatedStringBMReport
        L14_1(L15_1, L16_1, L17_1)
        L14_1 = mp
        L14_1 = L14_1.INFECTED
        return L14_1
      end
    end
    do break end
    ::lbl_132::
  end
else
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "SpPatchVersion"
  L5_1 = L2_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
