local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = MpDetection
L0_1 = L0_1.ScanResource
L1_1 = "rootcert://"
L0_1(L1_1)
L0_1 = {}
L1_1 = pcall
L2_1 = Infrastructure_ScanFileLessMalware
L1_1, L2_1 = L1_1(L2_1)
if not L1_1 then
  L0_1.ScanFileLessMalware = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanEvotobExclusion
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanEvotobExclusion = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanDetrahere
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanDetrahere = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = MpDetection
L4_1 = L4_1.ScanResource
L5_1 = "regkeyvalue://hklm\\software\\policies\\microsoft\\windows\\windowsupdate\\\\WUServer"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanResource_WUServer = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = MpDetection
L4_1 = L4_1.ScanResource
L5_1 = "regkeyvalue://hklm\\system\\currentcontrolset\\services\\\\rpcsrv"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanResource_rpcsrv = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = MpDetection
L4_1 = L4_1.ScanResource
L5_1 = "file://%ProgramData%\\Deliver\\sclm.dll"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanResource_sclm = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = MpDetection
L4_1 = L4_1.ScanResource
L5_1 = "regkeyvalue://hklm\\system\\currentcontrolset\\control\\secureboot\\state\\\\policypublisher"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanResource_policypublisher = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanBITSJobs
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanBITSJobs = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanSuweezy
L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanSuweezy_Defender = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanSuweezy
L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Microsoft Antimalware\\Exclusions\\Paths"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanSuweezy_Antimalware = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_NeobarReportPathExclusions
L5_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.NeobarReportPathExclusions_Policies = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_NeobarReportPathExclusions
L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.NeobarReportPathExclusions = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_SoctuseerReportPathExclusions
L5_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.SoctuseerReportPathExclusions_Policies = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_SoctuseerReportPathExclusions
L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.SoctuseerReportPathExclusions = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  end
end

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = MpCommon
  L0_2 = L0_2.QueryDynamicConfigString
  L1_2 = "MpExtraAsepScanLocations"
  L0_2 = L0_2(L1_2)
  L1_2 = string
  L1_2 = L1_2.gmatch
  L2_2 = L0_2
  L3_2 = "([^|]+)"
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2)
  for L4_2 in L1_2, L2_2, L3_2 do
    L5_2 = MpDetection
    L5_2 = L5_2.ScanResource
    L6_2 = L4_2
    L5_2(L6_2)
  end
end

L4_1 = pcall
L5_1 = L3_1
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanExtraAseps = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ScanWDFirewallBlockRules
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanWDFirewallBlockRules = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ScanKryptomixASEPKeyPath
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanKryptomixASEPKeyPath = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_AntiTamperingCheckAndRepair
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.AntiTamperingCheckAndRepair = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_MSRTDASTelemetry
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.MSRTDASTelemetry = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ScanMpCfgDefaults
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanMpCfgDefaults = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ScanEmotetV5
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanEmotetV5 = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ScanADFSPath
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanADFSPath = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_NewmanScan
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.NewmanScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_3CXScan
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1["3CXScan"] = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ScanUefiEnvironmentVariables
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanUefiEnvironmentVariables = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_DLAMTelemetry
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.DLAMTelemetry = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_AsrLinkScan
L6_1 = "qscanmachine"
L4_1, L5_1 = L4_1(L5_1, L6_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.Infrastructure_AsrLinkScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ExclusionTelemetry
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ExclusionTelemetry = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_FirstTimeAT
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.FirstTimeAT = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_ScanEFISystemPartitions
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.ScanEFISystemPartitions = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_MicrosoftIRScan
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.MicrosoftIRScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = pcall
L5_1 = Infrastructure_AnomalyTableTelemetry
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.AnomalyTableTelemetry = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = MpCommon
L4_1 = L4_1.IsSampled
L5_1 = 100
L6_1 = true
L7_1 = true
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = pcall
  L5_1 = Infrastructure_ReportUEFIData
  L4_1, L5_1 = L4_1(L5_1)
  L2_1 = L5_1
  L1_1 = L4_1
  if not L1_1 then
    L0_1.ReportUEFIData = L2_1
    if L2_1 == "Scanning aborted by the user!" then
      L4_1 = error
      L5_1 = MpCommon
      L5_1 = L5_1.JsonSerialize
      L6_1 = L0_1
      L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
      L4_1(L5_1, L6_1, L7_1, L8_1)
    end
  end
end
L4_1 = pcall
L5_1 = Infrastructure_SharePointScan
L4_1, L5_1 = L4_1(L5_1)
L2_1 = L5_1
L1_1 = L4_1
if not L1_1 then
  L0_1.SharePointScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L4_1 = error
    L5_1 = MpCommon
    L5_1 = L5_1.JsonSerialize
    L6_1 = L0_1
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
end
L4_1 = next
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L4_1 = error
  L5_1 = MpCommon
  L5_1 = L5_1.JsonSerialize
  L6_1 = L0_1
  L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
  L4_1(L5_1, L6_1, L7_1, L8_1)
end
