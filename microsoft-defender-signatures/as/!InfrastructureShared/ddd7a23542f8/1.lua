local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = false
L3_1 = "(set-service[\\w\\s-]+(windefend|microsoft defender antivirus service)[\\w\\s-]+(disabled|manual))"
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = L3_1
L6_1 = L1_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
_ = L5_1
L2_1 = L4_1
if L2_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetParentProcInfo
L4_1 = L4_1()
if L4_1 ~= nil then
  L5_1 = MpCommon
  L5_1 = L5_1.RequestSmsOnProcess
  L6_1 = L4_1.ppid
  L7_1 = MpCommon
  L7_1 = L7_1.SMS_SCAN_MED
  L5_1(L6_1, L7_1)
  L5_1 = TrackPidAndTechnique
  L6_1 = L4_1.ppid
  L7_1 = "T1562.001"
  L8_1 = "mptamper_av"
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = isTamperProtectionOn
L5_1 = L5_1()
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.LOWFI
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
