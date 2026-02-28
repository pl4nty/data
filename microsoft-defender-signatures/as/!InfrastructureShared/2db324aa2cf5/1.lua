local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = L0_1.ppid
  L3_1 = "T1003.003"
  L4_1 = "NtdsFromDiskShadow"
  L5_1 = 60
  L1_1(L2_1, L3_1, L4_1, L5_1)
else
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1003.003"
  L4_1 = "NtdsFromDiskShadow"
  L5_1 = 60
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
