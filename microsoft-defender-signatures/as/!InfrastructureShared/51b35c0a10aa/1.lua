local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.ppid
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = L1_1
L4_1 = "T1083"
L5_1 = "Discovery_File_Redirection_mt2023"
L6_1 = 300
L2_1(L3_1, L4_1, L5_1, L6_1)
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
