-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32SuspTeamsDownloadA\0x0000020f_luac 

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
local l_0_2 = {}
l_0_2.SourcSig = "SuspTeamsDownload"
l_0_2.Evidence = l_0_0
l_0_2.FileName = (mp.getfilename)()
local l_0_3, l_0_4 = safeJsonSerialize(l_0_2, nil, nil, true)
local l_0_5 = set_research_data
local l_0_6 = "Evidence"
local l_0_7 = MpCommon.Base64Encode
l_0_7 = l_0_7(l_0_3 or l_0_4)
l_0_5(l_0_6, l_0_7, false)
l_0_5 = GetCurrentPPID
l_0_5 = l_0_5()
if l_0_5 then
  l_0_6 = MpCommon
  l_0_6 = l_0_6.BmTriggerSig
  l_0_7 = l_0_5
  l_0_6(l_0_7, "LUA:TEAMS_RelatedDetection", l_0_3 or l_0_4)
end
do
  do
    l_0_6 = mp
    l_0_6 = l_0_6.INFECTED
    do return l_0_6 end
    -- DECOMPILER ERROR at PC52: freeLocal<0 in 'ReleaseLocals'

  end
end

