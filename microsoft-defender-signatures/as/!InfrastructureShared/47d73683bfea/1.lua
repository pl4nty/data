local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= "" and L1_1 ~= nil then
    L2_1 = TrackPidAndTechnique
    L3_1 = L1_1
    L4_1 = "T1505.003"
    L5_1 = "webshell_parent"
    L6_1 = 604800
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
