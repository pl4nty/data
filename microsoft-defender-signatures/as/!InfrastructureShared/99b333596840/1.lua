local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
end
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "(%w+%.exe)$"
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L2_1
L2_1 = GetRollingQueueKeyValue
L3_1 = "app_version_"
L4_1 = L1_1
L3_1 = L3_1 .. L4_1
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = sysio
  L3_1 = L3_1.GetPEFixedVersionInfo
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = "app_version_"
  L5_1 = L1_1
  L4_1 = L4_1 .. L5_1
  L5_1 = 31536000
  L6_1 = 50
  L7_1 = L3_1.FileVersion
  if L7_1 ~= 0 then
    L7_1 = Version_to_str
    L8_1 = L3_1.FileVersion
    L7_1 = L7_1(L8_1)
    L8_1 = AppendToRollingQueue
    L9_1 = L4_1
    L10_1 = L0_1
    L11_1 = L7_1
    L12_1 = L5_1
    L13_1 = L6_1
    L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
    L8_1 = bm
    L8_1 = L8_1.add_related_string
    L9_1 = "SQLVersion"
    L10_1 = L7_1
    L11_1 = bm
    L11_1 = L11_1.RelatedStringBMReport
    L8_1(L9_1, L10_1, L11_1)
  else
    L7_1 = bm
    L7_1 = L7_1.add_related_string
    L8_1 = "SQLVersion"
    L9_1 = "ERROR"
    L10_1 = bm
    L10_1 = L10_1.RelatedStringBMReport
    L7_1(L8_1, L9_1, L10_1)
  end
else
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "SQLVersion"
  L5_1 = L2_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
