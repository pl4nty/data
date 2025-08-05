-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32SuspTeamsDownloadA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
if (mp.get_mpattribute)("DirectlyDownloadFromTeams") then
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
l_0_3.FileName = (mp.getfilename)()
local l_0_4, l_0_5 = safeJsonSerialize(l_0_3, nil, nil, true)
local l_0_6 = set_research_data
local l_0_7 = "Evidence"
local l_0_8 = MpCommon.Base64Encode
l_0_8 = l_0_8(l_0_4 or l_0_5)
l_0_6(l_0_7, l_0_8, false)
l_0_6 = GetCurrentPPID
l_0_6 = l_0_6()
if l_0_6 then
  l_0_4.ppid = l_0_6
  l_0_4.context = l_0_7
  l_0_8 = MpCommon
  l_0_8 = l_0_8.BmTriggerSig
  local l_0_10 = l_0_6
  l_0_8(l_0_10, "LUA:TEAMS_RelatedDetection", l_0_4 or l_0_5)
end
do
  do
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC61: freeLocal<0 in 'ReleaseLocals'

  end
end

