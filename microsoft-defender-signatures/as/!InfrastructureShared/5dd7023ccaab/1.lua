local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = TrackPidAndTechnique
L2_1 = L0_1.ppid
L3_1 = "T1053.005"
L4_1 = "wmic_jobcreate"
L1_1(L2_1, L3_1, L4_1)
L1_1 = IsDetectionThresholdMet
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
