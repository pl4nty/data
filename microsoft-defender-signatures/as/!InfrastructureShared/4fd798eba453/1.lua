local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = {}
  L3_1 = "msmpeng.exe"
  L4_1 = "ntrtscan.exe"
  L5_1 = "avp.exe"
  L6_1 = "wrsa.exe"
  L7_1 = "egui.exe"
  L8_1 = "avastui.exe"
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L2_1[3] = L5_1
  L2_1[4] = L6_1
  L2_1[5] = L7_1
  L2_1[6] = L8_1
  L3_1 = contains
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
