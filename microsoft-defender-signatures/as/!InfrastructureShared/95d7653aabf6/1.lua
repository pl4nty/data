local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L0_1["T1098.007"] = "persist_user_local"
L0_1["T1136.001"] = "persist_user_local"
L1_1 = TrackPidAndMultipleTechniques
L2_1 = "CMDHSTR"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 then
  L2_1 = L1_1.ppid
  if L2_1 then
    L2_1 = TrackPidAndMultipleTechniques
    L3_1 = L1_1.ppid
    L4_1 = L0_1
    L2_1(L3_1, L4_1)
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
