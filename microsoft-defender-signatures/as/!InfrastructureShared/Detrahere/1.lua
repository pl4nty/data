local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = MpDetection
L0_1 = L0_1.GetCurrentThreat
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1.Name
L3_1 = "Detrahere"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.ExpandEnvironmentVariables
  L2_1 = "%windir%"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L2_1 = L1_1
    L3_1 = "\\system32"
    L2_1 = L2_1 .. L3_1
    L3_1 = sysio
    L3_1 = L3_1.IsFolderExists
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = MpDetection
      L3_1 = L3_1.ScanResource
      L4_1 = "folder://"
      L5_1 = L2_1
      L4_1 = L4_1 .. L5_1
      L3_1(L4_1)
    end
  end
end
