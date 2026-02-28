local L0_1, L1_1, L2_1, L3_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = sysio
  L1_2 = L1_2.GetProcessFromFileName
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = "pid:%d"
    L9_2 = L6_2.pid
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = MpDetection
    L8_2 = L8_2.ScanResource
    L9_2 = "ems://"
    L10_2 = L7_2
    L9_2 = L9_2 .. L10_2
    L8_2(L9_2)
  end
end

TriggerEMSScan = L0_1
L0_1 = MpCommon
L0_1 = L0_1.ExpandEnvironmentVariables
L1_1 = "%windir%"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = TriggerEMSScan
  L2_1 = L0_1
  L3_1 = "\\regsvr32.exe"
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
  L1_1 = TriggerEMSScan
  L2_1 = L0_1
  L3_1 = "\\explorer.exe"
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
end
