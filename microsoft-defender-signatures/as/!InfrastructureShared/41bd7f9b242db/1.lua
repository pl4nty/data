local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = TrackCustomPersistContextNameByPPID
  L2_1 = "set"
  L3_1 = L0_1
  L4_1 = "MimikatzTrigger"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = MpCommon
  L1_1 = L1_1.RequestSmsOnProcess
  L2_1 = L0_1
  L3_1 = MpCommon
  L3_1 = L3_1.SMS_SCAN_MED
  L1_1(L2_1, L3_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
