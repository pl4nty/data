-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32RMMDownloadA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((mp.GetScanSource)())
local l_0_1 = nil
if l_0_0 == mp.SCANSOURCE_RTP then
  l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    return mp.CLEAN
  end
else
  if l_0_0 == mp.SCANSOURCE_IOAV_WEB or l_0_0 == mp.SCANSOURCE_IOAV_FILE then
    l_0_1 = (mp.IOAVGetProcessPath)()
  else
    return mp.CLEAN
  end
end
local l_0_2 = {}
if (string.find)(l_0_1, "ms-teams.exe") then
  (mp.set_mpattribute)("DirectlyDownloadFromTeams")
  l_0_2.DirectlyDownloadFromTeams = true
end
local l_0_3 = GetRollingQueueKeyValues("TEAMS_Download", "ClickedLink")
local l_0_4 = GetRollingQueueKeyValues("TEAMS_CALL_PLACED", "Meeting")
if (not l_0_3 or not next(l_0_3)) and not l_0_2.DirectlyDownloadFromTeams and (not l_0_4 or not next(l_0_4)) then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("DownloadedAfterATeamsLink")
local l_0_5 = (mp.getfilename)()
l_0_5 = (mp.ContextualExpandEnvironmentVariables)(l_0_5)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = (MpCommon.PathToWin32Path)(l_0_5)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
l_0_6 = (string.lower)(l_0_6)
if IsRmmToolFilePath(l_0_6) or IsRmmToolVersionInfo(l_0_6) or IsRmmToolOFN(l_0_6) then
  l_0_2.IOAV_procPath = (mp.IOAVGetProcessPath)()
  l_0_2.IOAV_url = (mp.IOAVGetDownloadUrl)()
  local l_0_7 = 1800
  local l_0_8 = 100
  AppendToRollingQueue("TEAMS_Download", "RMMTool", l_0_6, l_0_7, l_0_8, 0)
  local l_0_9 = (l_0_2.IOAV_url):match("https?://([^:/]+)")
  local l_0_10, l_0_11 = (string.match)(l_0_9, "(.*)%.(.-)%.")
  for l_0_15,l_0_16 in ipairs(l_0_3) do
    local l_0_17, l_0_18, l_0_19 = (string.match)(l_0_16, "(.-)%->(.-)%->(.*)")
    if (not l_0_17 or not l_0_18 or ((string.match)(l_0_17, "(.*)%.exe")) or l_0_2.IOAV_procPath) and (string.find)(l_0_1, l_0_17, 1, true) then
      if l_0_19 and (string.find)(l_0_9, ".sharepoint.", 1, true) and (string.find)(l_0_2.IOAV_url, l_0_19, 1, true) then
        l_0_2.RMMDownloadedFromTeams = true
      else
        if (string.find)(l_0_16, l_0_9, 1, true) then
          local l_0_20 = MpCommon.SetPersistContextNoPath
          local l_0_21 = "RMMDownloadedFromTeams"
          local l_0_22 = {}
          -- DECOMPILER ERROR at PC229: No list found for R22 , SetList fails

          -- DECOMPILER ERROR at PC230: Overwrote pending register: R23 in 'AssignReg'

          l_0_20(l_0_21, l_0_22, "on")
          l_0_2.RMMDownloadedFromTeams = true
          l_0_2.Url_Match = 100
        else
          do
            if (string.find)(l_0_16, l_0_10, 1, true) or (string.find)(l_0_16, l_0_11, 1, true) then
              local l_0_23 = MpCommon.SetPersistContextNoPath
              local l_0_24 = "RMMDownloadedFromTeams"
              local l_0_25 = {}
              -- DECOMPILER ERROR at PC258: No list found for R22 , SetList fails

              -- DECOMPILER ERROR at PC259: Overwrote pending register: R23 in 'AssignReg'

              l_0_23(l_0_24, l_0_25, "on")
              l_0_2.RMMDownloadedFromTeams = true
              l_0_2.Url_Match = 50
            end
            do
              -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  local l_0_26 = {}
  l_0_26.SourcSig = "RMMDownload"
  l_0_26.RMMs = l_0_2
  l_0_26.TEAMS_Downloads = l_0_3
  l_0_26.TEAMS_Meetings = l_0_4
  l_0_26.FileName = l_0_5
  local l_0_27, l_0_28 = safeJsonSerialize(l_0_26, nil, nil, true)
  local l_0_29 = set_research_data
  local l_0_30 = "Evidence"
  local l_0_31 = MpCommon.Base64Encode
  l_0_31 = l_0_31(l_0_27 or l_0_28)
  l_0_29(l_0_30, l_0_31, false)
  l_0_29 = GetCurrentPPID
  l_0_29 = l_0_29()
  if l_0_29 then
    l_0_30 = MpCommon
    l_0_30 = l_0_30.BmTriggerSig
    l_0_31 = l_0_29
    l_0_30(l_0_31, "LUA:TEAMS_RelatedDetection", l_0_27 or l_0_28)
  end
  do
    do
      do
        l_0_30 = mp
        l_0_30 = l_0_30.INFECTED
        do return l_0_30 end
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC304: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end

