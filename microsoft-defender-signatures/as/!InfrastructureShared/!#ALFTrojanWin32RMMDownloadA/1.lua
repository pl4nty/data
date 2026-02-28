local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.GetScanSource
L0_1 = L0_1()
L1_1 = nil
L2_1 = mp
L2_1 = L2_1.SCANSOURCE_RTP
if L0_1 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_SCANREASON
  L2_1 = L2_1(L3_1)
  L3_1 = mp
  L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L2_1 ~= L3_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
else
  L2_1 = mp
  L2_1 = L2_1.SCANSOURCE_IOAV_WEB
  if L0_1 ~= L2_1 then
    L2_1 = mp
    L2_1 = L2_1.SCANSOURCE_IOAV_FILE
    if L0_1 ~= L2_1 then
      goto lbl_41
    end
  end
  L2_1 = mp
  L2_1 = L2_1.IOAVGetProcessPath
  L2_1 = L2_1()
  L1_1 = L2_1
  goto lbl_44
  ::lbl_41::
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
::lbl_44::
L2_1 = {}
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "ms-teams.exe"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "DirectlyDownloadFromTeams"
  L3_1(L4_1)
  L2_1.DirectlyDownloadFromTeams = true
end
L3_1 = GetRollingQueueKeyValues
L4_1 = "TEAMS_Download"
L5_1 = "ClickedLink"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = GetRollingQueueKeyValues
L5_1 = "TEAMS_CALL_PLACED"
L6_1 = "Meeting"
L4_1 = L4_1(L5_1, L6_1)
if L3_1 then
  L5_1 = next
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    goto lbl_85
  end
end
L5_1 = L2_1.DirectlyDownloadFromTeams
if not L5_1 then
  if L4_1 then
    L5_1 = next
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      goto lbl_85
    end
  end
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
::lbl_85::
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "DownloadedAfterATeamsLink"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.getfilename
L5_1 = L5_1()
L6_1 = mp
L6_1 = L6_1.ContextualExpandEnvironmentVariables
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
if L5_1 == nil or L5_1 == "" then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.PathToWin32Path
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 == nil or L6_1 == "" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L7_1 = IsRmmToolFilePath
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = IsRmmToolVersionInfo
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = IsRmmToolOFN
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      goto lbl_304
    end
  end
end
L7_1 = mp
L7_1 = L7_1.IOAVGetProcessPath
L7_1 = L7_1()
L2_1.IOAV_procPath = L7_1
L7_1 = mp
L7_1 = L7_1.IOAVGetDownloadUrl
L7_1 = L7_1()
L2_1.IOAV_url = L7_1
L7_1 = 1800
L8_1 = 100
L9_1 = AppendToRollingQueue
L10_1 = "TEAMS_Download"
L11_1 = "RMMTool"
L12_1 = L6_1
L13_1 = L7_1
L14_1 = L8_1
L15_1 = 0
L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L9_1 = L2_1.IOAV_url
L10_1 = L9_1
L9_1 = L9_1.match
L11_1 = "https?://([^:/]+)"
L9_1 = L9_1(L10_1, L11_1)
L10_1 = string
L10_1 = L10_1.match
L11_1 = L9_1
L12_1 = "(.*)%.(.-)%."
L10_1, L11_1 = L10_1(L11_1, L12_1)
L12_1 = ipairs
L13_1 = L3_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = string
  L17_1 = L17_1.match
  L18_1 = L16_1
  L19_1 = "(.-)%->(.-)%->(.*)"
  L17_1, L18_1, L19_1 = L17_1(L18_1, L19_1)
  if L17_1 and L18_1 then
    L20_1 = string
    L20_1 = L20_1.match
    L21_1 = L17_1
    L22_1 = "(.*)%.exe"
    L20_1 = L20_1(L21_1, L22_1)
    L17_1 = L20_1 or L17_1
    if not L20_1 then
    end
    L20_1 = L2_1.IOAV_procPath
    if L20_1 then
      L20_1 = string
      L20_1 = L20_1.find
      L21_1 = L1_1
      L22_1 = L17_1
      L23_1 = 1
      L24_1 = true
      L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
      if L20_1 then
        if L19_1 then
          L20_1 = string
          L20_1 = L20_1.find
          L21_1 = L9_1
          L22_1 = ".sharepoint."
          L23_1 = 1
          L24_1 = true
          L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
          if L20_1 then
            L20_1 = string
            L20_1 = L20_1.find
            L21_1 = L2_1.IOAV_url
            L22_1 = L19_1
            L23_1 = 1
            L24_1 = true
            L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
            if L20_1 then
              L2_1.RMMDownloadedFromTeams = true
          end
        end
        else
          L20_1 = string
          L20_1 = L20_1.find
          L21_1 = L16_1
          L22_1 = L9_1
          L23_1 = 1
          L24_1 = true
          L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
          if L20_1 then
            L20_1 = MpCommon
            L20_1 = L20_1.SetPersistContextNoPath
            L21_1 = "RMMDownloadedFromTeams"
            L22_1 = {}
            L23_1 = "on"
            L22_1[1] = L23_1
            L23_1 = L7_1
            L20_1(L21_1, L22_1, L23_1)
            L2_1.RMMDownloadedFromTeams = true
            L2_1.Url_Match = 100
          else
            L20_1 = string
            L20_1 = L20_1.find
            L21_1 = L16_1
            L22_1 = L10_1
            L23_1 = 1
            L24_1 = true
            L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
            if not L20_1 then
              L20_1 = string
              L20_1 = L20_1.find
              L21_1 = L16_1
              L22_1 = L11_1
              L23_1 = 1
              L24_1 = true
              L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
              if not L20_1 then
                goto lbl_264
              end
            end
            L20_1 = MpCommon
            L20_1 = L20_1.SetPersistContextNoPath
            L21_1 = "RMMDownloadedFromTeams"
            L22_1 = {}
            L23_1 = "on"
            L22_1[1] = L23_1
            L23_1 = L7_1
            L20_1(L21_1, L22_1, L23_1)
            L2_1.RMMDownloadedFromTeams = true
            L2_1.Url_Match = 50
          end
        end
      end
    end
  end
  ::lbl_264::
end
L12_1 = {}
L12_1.SourcSig = "RMMDownload"
L12_1.RMMs = L2_1
L12_1.TEAMS_Downloads = L3_1
L12_1.TEAMS_Meetings = L4_1
L12_1.FileName = L5_1
L13_1 = safeJsonSerialize
L14_1 = L12_1
L15_1 = nil
L16_1 = nil
L17_1 = true
L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
L15_1 = set_research_data
L16_1 = "Evidence"
L17_1 = MpCommon
L17_1 = L17_1.Base64Encode
L18_1 = L13_1 or L18_1
if not L13_1 then
  L18_1 = L14_1
end
L17_1 = L17_1(L18_1)
L18_1 = false
L15_1(L16_1, L17_1, L18_1)
L15_1 = GetCurrentPPID
L15_1, L16_1 = L15_1()
if L15_1 then
  L13_1.ppid = L15_1
  L13_1.context = L16_1
  L17_1 = MpCommon
  L17_1 = L17_1.BmTriggerSig
  L18_1 = L15_1
  L19_1 = "LUA:TEAMS_RelatedDetection"
  L20_1 = L13_1 or L20_1
  if not L13_1 then
    L20_1 = L14_1
  end
  L17_1(L18_1, L19_1, L20_1)
end
L17_1 = mp
L17_1 = L17_1.INFECTED
do return L17_1 end
::lbl_304::
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
