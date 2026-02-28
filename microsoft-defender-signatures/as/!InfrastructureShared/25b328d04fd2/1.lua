local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = L0_1.ppid
  L3_1 = "T1110.001"
  L4_1 = "CredentialAccess_FtpBruteForceOutgoing"
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = L1_1.ppid
  L4_1 = "T1110.001"
  L5_1 = "CredentialAccess_FtpBruteForceOutgoing"
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
