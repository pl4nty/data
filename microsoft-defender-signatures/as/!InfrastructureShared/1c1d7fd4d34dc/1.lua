local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = MpCommon
  L1_1 = L1_1.RequestSmsOnProcess
  L2_1 = L0_1
  L3_1 = MpCommon
  L3_1 = L3_1.SMS_SCAN_MED
  L1_1(L2_1, L3_1)
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = MpCommon
  L2_1 = L2_1.RequestSmsOnProcess
  L3_1 = L1_1.ppid
  L4_1 = MpCommon
  L4_1 = L4_1.SMS_SCAN_MED
  L2_1(L3_1, L4_1)
  L2_1 = TrackPidAndTechnique
  L3_1 = L1_1.ppid
  L4_1 = "T1562.001"
  L5_1 = "mptamper_av"
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.LOWFI
return L2_1
