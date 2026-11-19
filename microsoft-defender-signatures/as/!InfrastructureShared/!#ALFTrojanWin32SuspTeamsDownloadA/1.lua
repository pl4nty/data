-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/SuspTeamsDownload.A
-- Type: 13
-- Includes: ResearchData, LuaFuncHelper
-- MpAttributes: DownloadedAfterATeamsLink & (RecentExecDropWithAttrib | RecentExecDropUnsigned)

local l_0_0 = {}
if mp.get_mpattribute("DirectlyDownloadFromTeams") then
  l_0_0.DirectlyDownloadFromTeams = true
end
local l_0_1 = GetRollingQueueKeyValues("TEAMS_Download", "ClickedLink")
if l_0_1 then
  l_0_0.TEAMS_Download = l_0_1
end
local l_0_2 = GetRollingQueueKeyValues("TEAMS_CALL_PLACED", "Meeting")
if l_0_2 then
  l_0_0.TEAMS_Meetings = l_0_2
end
local l_0_3 = {}
l_0_3.SourcSig = "SuspTeamsDownload"
l_0_3.Evidence = l_0_0
l_0_3.FileName = mp.getfilename()
local l_0_4, l_0_5 = safeJsonSerialize(l_0_3, nil, nil, true)
set_research_data("Evidence", MpCommon.Base64Encode(l_0_4 or l_0_5), false)
local l_0_6, l_0_7 = GetCurrentPPID()
if l_0_6 then
  l_0_4.ppid = l_0_6
  l_0_4.context = l_0_7
  MpCommon.BmTriggerSig(l_0_6, "LUA:TEAMS_RelatedDetection", l_0_4 or l_0_5)
end
return mp.INFECTED
