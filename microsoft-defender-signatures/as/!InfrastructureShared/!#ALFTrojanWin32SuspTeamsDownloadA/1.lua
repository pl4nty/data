local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "DirectlyDownloadFromTeams"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1.DirectlyDownloadFromTeams = true
end
L1_1 = GetRollingQueueKeyValues
L2_1 = "TEAMS_Download"
L3_1 = "ClickedLink"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L0_1.TEAMS_Download = L1_1
end
L2_1 = GetRollingQueueKeyValues
L3_1 = "TEAMS_CALL_PLACED"
L4_1 = "Meeting"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L0_1.TEAMS_Meetings = L2_1
end
L3_1 = {}
L3_1.SourcSig = "SuspTeamsDownload"
L3_1.Evidence = L0_1
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1 = L4_1()
L3_1.FileName = L4_1
L4_1 = safeJsonSerialize
L5_1 = L3_1
L6_1 = nil
L7_1 = nil
L8_1 = true
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L6_1 = set_research_data
L7_1 = "Evidence"
L8_1 = MpCommon
L8_1 = L8_1.Base64Encode
L9_1 = L4_1 or L9_1
if not L4_1 then
  L9_1 = L5_1
end
L8_1 = L8_1(L9_1)
L9_1 = false
L6_1(L7_1, L8_1, L9_1)
L6_1 = GetCurrentPPID
L6_1, L7_1 = L6_1()
if L6_1 then
  L4_1.ppid = L6_1
  L4_1.context = L7_1
  L8_1 = MpCommon
  L8_1 = L8_1.BmTriggerSig
  L9_1 = L6_1
  L10_1 = "LUA:TEAMS_RelatedDetection"
  L11_1 = L4_1 or L11_1
  if not L4_1 then
    L11_1 = L5_1
  end
  L8_1(L9_1, L10_1, L11_1)
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
