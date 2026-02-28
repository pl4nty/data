local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
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
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
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
if L2_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = sysio
L3_1 = L3_1.GetPEFixedVersionInfo
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.FileVersion
L5_1 = sysio
L5_1 = L5_1.GetPEVersionInfo
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L5_1.OriginalFilename
if L4_1 == 0 or not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = "app_version_"
L8_1 = L6_1
L7_1 = L7_1 .. L8_1
L8_1 = 31536000
L9_1 = 50
L10_1 = Version_to_str
L11_1 = L4_1
L10_1 = L10_1(L11_1)
L11_1 = AppendToRollingQueue
L12_1 = L7_1
L13_1 = L0_1
L14_1 = L10_1
L15_1 = L8_1
L16_1 = L9_1
L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
L11_1 = bm
L11_1 = L11_1.add_related_string
L12_1 = "AppVersionFixed"
L13_1 = L10_1
L14_1 = bm
L14_1 = L14_1.RelatedStringBMReport
L11_1(L12_1, L13_1, L14_1)
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
