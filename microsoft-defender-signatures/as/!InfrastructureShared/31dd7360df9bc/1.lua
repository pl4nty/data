local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = MpCommon
  L1_1 = L1_1.RequestSmsOnProcess
  L2_1 = L0_1.ppid
  L3_1 = MpCommon
  L3_1 = L3_1.SMS_SCAN_MED
  L1_1(L2_1, L3_1)
  L1_1 = TrackPidAndTechnique
  L2_1 = L0_1.ppid
  L3_1 = "T1562.001"
  L4_1 = "mptamper_av"
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = isTamperProtectionOn
L1_1 = L1_1()
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.LOWFI
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
