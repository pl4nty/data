-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/RMMDownload.A
-- Type: 13
-- Includes: HIPSRmmToolInfra, ResearchData, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & (pea_isexe | CommonBatExt | Lua:FileInZip | Lua:FileIn7z | Lua:FileInRar)

local l_0_0 = mp.GetScanSource()
local l_0_1
if l_0_0 == mp.SCANSOURCE_RTP then
  l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    return mp.CLEAN
  end
elseif l_0_0 == mp.SCANSOURCE_IOAV_WEB or l_0_0 == mp.SCANSOURCE_IOAV_FILE then
  l_0_1 = mp.IOAVGetProcessPath()
else
  return mp.CLEAN
end
local l_0_2 = {}
if string.find(l_0_1, "ms-teams.exe") then
  mp.set_mpattribute("DirectlyDownloadFromTeams")
  l_0_2.DirectlyDownloadFromTeams = true
end
local l_0_3 = GetRollingQueueKeyValues("TEAMS_Download", "ClickedLink")
local l_0_4 = GetRollingQueueKeyValues("TEAMS_CALL_PLACED", "Meeting")
if (not l_0_3 or not next(l_0_3)) and not l_0_2.DirectlyDownloadFromTeams and (not l_0_4 or not next(l_0_4)) then
  return mp.CLEAN
end
mp.set_mpattribute("DownloadedAfterATeamsLink")
local l_0_5 = mp.getfilename()
l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = MpCommon.PathToWin32Path(l_0_5)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
l_0_6 = string.lower(l_0_6)
if IsRmmToolFilePath(l_0_6) or IsRmmToolVersionInfo(l_0_6) or IsRmmToolOFN(l_0_6) then
  l_0_2.IOAV_procPath = mp.IOAVGetProcessPath()
  l_0_2.IOAV_url = mp.IOAVGetDownloadUrl()
  local l_0_7 = 1800
  local l_0_8 = 100
  AppendToRollingQueue("TEAMS_Download", "RMMTool", l_0_6, l_0_7, l_0_8, 0)
  local l_0_9 = l_0_2.IOAV_url:match("https?://([^:/]+)")
  local l_0_10, l_0_11 = string.match(l_0_9, "(.*)%.(.-)%.")
  for l_0_12, l_0_13 in ipairs(l_0_3) do
    local l_0_14, l_0_15, l_0_16 = string.match(l_0_13, "(.-)%->(.-)%->(.*)")
    if l_0_14 and l_0_15 then
      l_0_14 = string.match(l_0_14, "(.*)%.exe") or l_0_14
      if l_0_2.IOAV_procPath and string.find(l_0_1, l_0_14, 1, true) then
        if l_0_16 and string.find(l_0_9, ".sharepoint.", 1, true) and string.find(l_0_2.IOAV_url, l_0_16, 1, true) then
          l_0_2.RMMDownloadedFromTeams = true
        elseif string.find(l_0_13, l_0_9, 1, true) then
          MpCommon.SetPersistContextNoPath("RMMDownloadedFromTeams", {"on"}, l_0_7)
          l_0_2.RMMDownloadedFromTeams = true
          l_0_2.Url_Match = 100
        elseif string.find(l_0_13, l_0_10, 1, true) or string.find(l_0_13, l_0_11, 1, true) then
          MpCommon.SetPersistContextNoPath("RMMDownloadedFromTeams", {"on"}, l_0_7)
          l_0_2.RMMDownloadedFromTeams = true
          l_0_2.Url_Match = 50
        end
      end
    end
  end
  local l_0_17 = {}
  l_0_17.SourcSig = "RMMDownload"
  l_0_17.RMMs = l_0_2
  l_0_17.TEAMS_Downloads = l_0_3
  l_0_17.TEAMS_Meetings = l_0_4
  l_0_17.FileName = l_0_5
  local l_0_18, l_0_19 = safeJsonSerialize(l_0_17, nil, nil, true)
  set_research_data("Evidence", MpCommon.Base64Encode(l_0_18 or l_0_19), false)
  local l_0_20, l_0_21 = GetCurrentPPID()
  if l_0_20 then
    l_0_18.ppid = l_0_20
    l_0_18.context = l_0_21
    MpCommon.BmTriggerSig(l_0_20, "LUA:TEAMS_RelatedDetection", l_0_18 or l_0_19)
  end
  return mp.INFECTED
end
return mp.CLEAN
