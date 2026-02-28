local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= "" then
    L1_1 = TrackPidAndTechnique
    L2_1 = L0_1.ppid
    L3_1 = "T1078.004"
    L4_1 = "Persistence_AccountManipulation_SSHAuthorizedKeys"
    L1_1(L2_1, L3_1, L4_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
