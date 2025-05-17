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
if (not l_0_3 or not next(l_0_3)) and not l_0_2.DirectlyDownloadFromTeams then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("DownloadedAfterATeamsLink")
local l_0_4 = (mp.getfilename)()
l_0_4 = (mp.ContextualExpandEnvironmentVariables)(l_0_4)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = (MpCommon.PathToWin32Path)(l_0_4)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
l_0_5 = (string.lower)(l_0_5)
if IsRmmToolFilePath(l_0_5) or IsRmmToolVersionInfo(l_0_5) or IsRmmToolOFN(l_0_5) then
  l_0_2.IOAV_procPath = (mp.IOAVGetProcessPath)()
  l_0_2.IOAV_url = (mp.IOAVGetDownloadUrl)()
  local l_0_6 = 1800
  local l_0_7 = 100
  AppendToRollingQueue("TEAMS_Download", "RMMTool", l_0_5, l_0_6, l_0_7, 0)
  local l_0_8 = (l_0_2.IOAV_url):match("https?://([^:/]+)")
  local l_0_9, l_0_10 = (string.match)(l_0_8, "(.*)%.(.-)%.")
  for l_0_14,l_0_15 in ipairs(l_0_3) do
    local l_0_16, l_0_17, l_0_18 = (string.match)(l_0_15, "(.-)%->(.-)%->(.*)")
    if (not l_0_16 or not l_0_17 or ((string.match)(l_0_16, "(.*)%.exe")) or l_0_2.IOAV_procPath) and (string.find)(l_0_1, l_0_16, 1, true) then
      if l_0_18 and (string.find)(l_0_8, ".sharepoint.", 1, true) and (string.find)(l_0_2.IOAV_url, l_0_18, 1, true) then
        l_0_2.RMMDownloadedFromTeams = true
      else
        if (string.find)(l_0_15, l_0_8, 1, true) then
          local l_0_19 = MpCommon.SetPersistContextNoPath
          local l_0_20 = "RMMDownloadedFromTeams"
          local l_0_21 = {}
          -- DECOMPILER ERROR at PC218: No list found for R21 , SetList fails

          -- DECOMPILER ERROR at PC219: Overwrote pending register: R22 in 'AssignReg'

          l_0_19(l_0_20, l_0_21, "on")
          l_0_2.RMMDownloadedFromTeams = true
          l_0_2.Url_Match = 100
        else
          do
            if (string.find)(l_0_15, l_0_9, 1, true) or (string.find)(l_0_15, l_0_10, 1, true) then
              local l_0_22 = MpCommon.SetPersistContextNoPath
              local l_0_23 = "RMMDownloadedFromTeams"
              local l_0_24 = {}
              -- DECOMPILER ERROR at PC247: No list found for R21 , SetList fails

              -- DECOMPILER ERROR at PC248: Overwrote pending register: R22 in 'AssignReg'

              l_0_22(l_0_23, l_0_24, "on")
              l_0_2.RMMDownloadedFromTeams = true
              l_0_2.Url_Match = 50
            end
            do
              -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  local l_0_25 = {}
  l_0_25.SourcSig = "RMMDownload"
  l_0_25.RMMs = l_0_2
  l_0_25.TEAMS_Downloads = l_0_3
  l_0_25.FileName = l_0_4
  local l_0_26, l_0_27 = safeJsonSerialize(l_0_25, nil, nil, true)
  local l_0_28 = set_research_data
  local l_0_29 = "Evidence"
  local l_0_30 = MpCommon.Base64Encode
  l_0_30 = l_0_30(l_0_26 or l_0_27)
  l_0_28(l_0_29, l_0_30, false)
  l_0_28 = GetCurrentPPID
  l_0_28 = l_0_28()
  if l_0_28 then
    l_0_29 = MpCommon
    l_0_29 = l_0_29.BmTriggerSig
    l_0_30 = l_0_28
    l_0_29(l_0_30, "LUA:TEAMS_RelatedDetection", l_0_26 or l_0_27)
  end
  do
    do
      do
        l_0_29 = mp
        l_0_29 = l_0_29.INFECTED
        do return l_0_29 end
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC292: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end

