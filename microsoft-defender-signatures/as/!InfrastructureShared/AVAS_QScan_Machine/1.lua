-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\AVAS_QScan_Machine\1.luac 

-- params : ...
-- function num : 0
(MpDetection.ScanResource)("rootcert://")
local l_0_0 = {}
local l_0_1, l_0_2 = pcall(Infrastructure_ScanFileLessMalware)
if not l_0_1 then
  l_0_0.ScanFileLessMalware = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
l_0_1 = pcall(Infrastructure_ScanEvotobExclusion)
if not l_0_1 then
  l_0_0.ScanEvotobExclusion = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC38: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanDetrahere)
if not l_0_1 then
  l_0_0.ScanDetrahere = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC56: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(MpDetection.ScanResource, "regkeyvalue://hklm\\software\\policies\\microsoft\\windows\\windowsupdate\\\\WUServer")
if not l_0_1 then
  l_0_0.ScanResource_WUServer = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC74: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(MpDetection.ScanResource, "regkeyvalue://hklm\\system\\currentcontrolset\\services\\\\rpcsrv")
if not l_0_1 then
  l_0_0.ScanResource_rpcsrv = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC92: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(MpDetection.ScanResource, "file://%ProgramData%\\Deliver\\sclm.dll")
if not l_0_1 then
  l_0_0.ScanResource_sclm = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
local l_0_3 = (versioning.GetEngineRing)()
-- DECOMPILER ERROR at PC117: Overwrote pending register: R2 in 'AssignReg'

if l_0_3 ~= nil and l_0_3 <= versioning.ENGINE_RING_2_PREVIEW then
  l_0_1 = pcall(Infrastructure_ScanBITSJobs)
  if not l_0_1 then
    l_0_0.ScanBITSJobs = l_0_2
    if l_0_2 == "Scanning aborted by the user!" then
      error((MpCommon.JsonSerialize)(l_0_0))
    end
  end
end
-- DECOMPILER ERROR at PC134: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanSuweezy, "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.ScanSuweezy_Defender = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC151: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanSuweezy, "HKLM\\SOFTWARE\\Microsoft\\Microsoft Antimalware\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.ScanSuweezy_Antimalware = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC168: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_NeobarReportPathExclusions, "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.NeobarReportPathExclusions_Policies = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC185: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_NeobarReportPathExclusions, "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.NeobarReportPathExclusions = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC202: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_SoctuseerReportPathExclusions, "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.SoctuseerReportPathExclusions_Policies = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC219: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_SoctuseerReportPathExclusions, "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths")
if not l_0_1 then
  l_0_0.SoctuseerReportPathExclusions = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
local l_0_4 = function()
  -- function num : 0_0
  local l_1_0 = (MpCommon.QueryDynamicConfigString)("MpExtraAsepScanLocations")
  for l_1_4 in (string.gmatch)(l_1_0, "([^|]+)") do
    (MpDetection.ScanResource)(l_1_4)
  end
end

-- DECOMPILER ERROR at PC236: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(l_0_4)
if not l_0_1 then
  l_0_0.ScanExtraAseps = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC252: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanWDFirewallBlockRules)
if not l_0_1 then
  l_0_0.ScanWDFirewallBlockRules = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC268: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanKryptomixASEPKeyPath)
if not l_0_1 then
  l_0_0.ScanKryptomixASEPKeyPath = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC284: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_AntiTamperingCheckAndRepair)
if not l_0_1 then
  l_0_0.AntiTamperingCheckAndRepair = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC300: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_MSRTDASTelemetry)
if not l_0_1 then
  l_0_0.MSRTDASTelemetry = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC316: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanMpCfgDefaults)
if not l_0_1 then
  l_0_0.ScanMpCfgDefaults = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC332: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanEmotetV5)
if not l_0_1 then
  l_0_0.ScanEmotetV5 = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC348: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanADFSPath)
if not l_0_1 then
  l_0_0.ScanADFSPath = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC364: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_NewmanScan)
if not l_0_1 then
  l_0_0.NewmanScan = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC380: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_3CXScan)
if not l_0_1 then
  l_0_0["3CXScan"] = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC396: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanUefiEnvironmentVariables)
if not l_0_1 then
  l_0_0.ScanUefiEnvironmentVariables = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC412: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_DLAMTelemetry)
if not l_0_1 then
  l_0_0.DLAMTelemetry = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC429: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_AsrLinkScan, "qscanmachine")
if not l_0_1 then
  l_0_0.Infrastructure_AsrLinkScan = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC445: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ExclusionTelemetry)
if not l_0_1 then
  l_0_0.ExclusionTelemetry = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC461: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_FirstTimeAT)
if not l_0_1 then
  l_0_0.FirstTimeAT = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC477: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_ScanEFISystemPartitions)
if not l_0_1 then
  l_0_0.ScanEFISystemPartitions = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC493: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_MicrosoftIRScan)
if not l_0_1 then
  l_0_0.MicrosoftIRScan = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC509: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_AnomalyTableTelemetry)
if not l_0_1 then
  l_0_0.AnomalyTableTelemetry = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
-- DECOMPILER ERROR at PC534: Overwrote pending register: R2 in 'AssignReg'

if (MpCommon.IsSampled)(100, true, true, true) then
  l_0_1 = pcall(Infrastructure_ReportUEFIData)
  if not l_0_1 then
    l_0_0.ReportUEFIData = l_0_2
    if l_0_2 == "Scanning aborted by the user!" then
      error((MpCommon.JsonSerialize)(l_0_0))
    end
  end
end
-- DECOMPILER ERROR at PC550: Overwrote pending register: R2 in 'AssignReg'

l_0_1 = pcall(Infrastructure_SharePointScan)
if not l_0_1 then
  l_0_0.SharePointScan = l_0_2
  if l_0_2 == "Scanning aborted by the user!" then
    error((MpCommon.JsonSerialize)(l_0_0))
  end
end
if next(l_0_0) ~= nil then
  error((MpCommon.JsonSerialize)(l_0_0))
end

