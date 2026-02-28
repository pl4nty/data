local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.QuerySessionInformation
L2_1 = L0_1.ppid
L3_1 = MpCommon
L3_1 = L3_1.WTSIsRemoteSession
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.QuerySessionInformation
  L3_1 = L0_1.ppid
  L4_1 = MpCommon
  L4_1 = L4_1.WTSUserName
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContextNoPath
  L4_1 = "MpNewRemoteUsers"
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = isTamperProtectionOn
    L4_1 = false
    L3_1 = L3_1(L4_1)
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "TpState"
    L6_1 = tostring
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
