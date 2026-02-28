local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = MpCommon
L0_1 = L0_1.ExpandEnvironmentVariables
L1_1 = "%SystemRoot%"
L0_1 = L0_1(L1_1)
L1_1 = MpCommon
L1_1 = L1_1.ExpandEnvironmentVariables
L2_1 = "%temp%"
L1_1 = L1_1(L2_1)
if L0_1 then
  L2_1 = MpDetection
  L2_1 = L2_1.ScanResource
  L3_1 = "folder://"
  L4_1 = L0_1
  L5_1 = "\\intel"
  L3_1 = L3_1 .. L4_1 .. L5_1
  L2_1(L3_1)
end
if L1_1 then
  L2_1 = MpDetection
  L2_1 = L2_1.ScanResource
  L3_1 = "folder://"
  L4_1 = L1_1
  L3_1 = L3_1 .. L4_1
  L2_1(L3_1)
end
