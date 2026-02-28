local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = bm
L1_1 = L1_1.trigger_sig
L2_1 = "RMMprocess_Started"
L3_1 = ""
L1_1(L2_1, L3_1)
L1_1 = MpCommon
L1_1 = L1_1.QuerySessionInformation
L2_1 = L0_1.ppid
L3_1 = MpCommon
L3_1 = L3_1.WTSIsRemoteSession
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = GetRollingQueueKeyValues
L3_1 = "TEAMS_Download"
L4_1 = "RMMTool"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = next
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    goto lbl_42
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_42::
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContextNoPath
L4_1 = "RMMDownloadedFromTeams"
L5_1 = "on"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "RMMDownloadedFromTeams"
  L5_1 = "true"
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = GetRollingQueueKeyValues
L4_1 = "TEAMS_Download"
L5_1 = "ClickedLink"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "RMMTools"
L6_1 = safeJsonSerialize
L7_1 = L2_1
L6_1 = L6_1(L7_1)
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "TeamsUrls"
L6_1 = safeJsonSerialize
L7_1 = L3_1
L6_1 = L6_1(L7_1)
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = reportSessionInformationInclusive
L4_1()
L4_1 = add_parents
L4_1()
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
