local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.integrity_level
L2_1 = MpCommon
L2_1 = L2_1.SECURITY_MANDATORY_MEDIUM_RID
if L1_1 > L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetProcessElevationAndIntegrityLevel
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = L1_1.IntegrityLevel
L3_1 = MpCommon
L3_1 = L3_1.SECURITY_MANDATORY_MEDIUM_RID
if L2_1 > L3_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1562.001"
L5_1 = "mptamper_amsi_ofc"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
