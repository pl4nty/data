local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = Infrastructure_GetEnvironmentPath
L1_1 = "%common_desktop%"
L0_1 = L0_1(L1_1)
L1_1 = Infrastructure_GetEnvironmentPath
L2_1 = "%appdata%"
L1_1 = L1_1(L2_1)
L2_1 = Infrastructure_GetEnvironmentPath
L3_1 = "%programs%"
L2_1 = L2_1(L3_1)
L3_1 = Infrastructure_GetEnvironmentPath
L4_1 = "%common_programs%"
L3_1 = L3_1(L4_1)
if L0_1 then
  L4_1 = MpDetection
  L4_1 = L4_1.ScanResource
  L5_1 = "folder://"
  L6_1 = L0_1
  L5_1 = L5_1 .. L6_1
  L4_1(L5_1)
end
if L1_1 then
  L4_1 = MpDetection
  L4_1 = L4_1.ScanResource
  L5_1 = "folder://"
  L6_1 = L1_1
  L7_1 = "\\Microsoft\\Internet Explorer\\Quick Launch\\User Pinned\\TaskBar"
  L5_1 = L5_1 .. L6_1 .. L7_1
  L4_1(L5_1)
end
if L2_1 then
  L4_1 = MpDetection
  L4_1 = L4_1.ScanResource
  L5_1 = "folder://"
  L6_1 = L2_1
  L5_1 = L5_1 .. L6_1
  L4_1(L5_1)
end
if L3_1 then
  L4_1 = MpDetection
  L4_1 = L4_1.ScanResource
  L5_1 = "folder://"
  L6_1 = L3_1
  L5_1 = L5_1 .. L6_1
  L4_1(L5_1)
end
