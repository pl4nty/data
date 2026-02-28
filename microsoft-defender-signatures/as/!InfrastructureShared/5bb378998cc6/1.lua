local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p2
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.ExpandEnvironmentVariables
L3_1 = "%WINDIR%\\SYSTEM32\\"
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = L1_1
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = versioning
L2_1 = L2_1.GetOsBuildNumber
L2_1 = L2_1()
L3_1 = versioning
L3_1 = L3_1.GetOsBuildMin
L3_1 = L3_1()
if L2_1 < 19044 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L2_1 == 19044 and L3_1 < 1826 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = sysio
L4_1 = L4_1.GetPEFixedVersionInfo
L5_1 = L0_1
L4_1 = L4_1(L5_1)
L5_1 = L4_1.FileVersion
L6_1 = crypto
L6_1 = L6_1.shr64
L7_1 = L5_1
L8_1 = 48
L6_1 = L6_1(L7_1, L8_1)
L7_1 = crypto
L7_1 = L7_1.bitand
L8_1 = crypto
L8_1 = L8_1.shr64
L9_1 = L5_1
L10_1 = 32
L8_1 = L8_1(L9_1, L10_1)
L9_1 = 65535
L7_1 = L7_1(L8_1, L9_1)
L8_1 = crypto
L8_1 = L8_1.bitand
L9_1 = crypto
L9_1 = L9_1.shr64
L10_1 = L5_1
L11_1 = 16
L9_1 = L9_1(L10_1, L11_1)
L10_1 = 65535
L8_1 = L8_1(L9_1, L10_1)
L9_1 = crypto
L9_1 = L9_1.bitand
L10_1 = L5_1
L11_1 = 65535
L9_1 = L9_1(L10_1, L11_1)
if 10 <= L6_1 and 0 <= L7_1 and 19044 < L8_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
if 10 <= L6_1 and 0 <= L7_1 and L8_1 == 19044 and 1826 <= L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = sysio
L10_1 = L10_1.GetPEVersionInfo
L11_1 = L0_1
L10_1 = L10_1(L11_1)
if not L10_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = L10_1.OriginalFilename
if not L11_1 or L11_1 ~= "ntdll.dll" then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = tostring
L13_1 = L6_1
L12_1 = L12_1(L13_1)
L13_1 = "."
L14_1 = tostring
L15_1 = L7_1
L14_1 = L14_1(L15_1)
L15_1 = "."
L16_1 = tostring
L17_1 = L8_1
L16_1 = L16_1(L17_1)
L17_1 = "."
L18_1 = tostring
L19_1 = L9_1
L18_1 = L18_1(L19_1)
L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1
L13_1 = bm
L13_1 = L13_1.add_related_string
L14_1 = "NTDLL version"
L15_1 = L12_1
L16_1 = bm
L16_1 = L16_1.RelatedStringBMReport
L13_1(L14_1, L15_1, L16_1)
L13_1 = mp
L13_1 = L13_1.INFECTED
return L13_1
