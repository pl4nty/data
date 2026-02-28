local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = pcall
L2_1 = Infrastructure_NeobarReportPathExclusions
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\Paths"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L0_1.NeobarReportPathExclusions_Policies = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
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
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
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
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
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
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanWDFirewallBlockRules
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanWDFirewallBlockRules = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_AntiTamperingCheckAndRepair
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.AntiTamperingCheckAndRepair = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanEFISystemPartitions
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanEFISystemPartitions = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_FirstTimeAT
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.FirstTimeAT = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanLeviathon
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanLeviathon = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanCFABootProtState
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanCFABootProtState = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ScanMpEtwPublisher
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ScanMpEtwPublisher = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_DLAMTelemetry
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.DLAMTelemetry = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_ExclusionTelemetry
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.ExclusionTelemetry = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_AsrLinkScan
L5_1 = "postsig"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.AsrLinkScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = pcall
L4_1 = Infrastructure_AnomalyTableTelemetry
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.AnomalyTableTelemetry = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = MpCommon
L3_1 = L3_1.IsSampled
L4_1 = 100
L5_1 = true
L6_1 = true
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = pcall
  L4_1 = Infrastructure_ReportUEFIData
  L3_1, L4_1 = L3_1(L4_1)
  L2_1 = L4_1
  L1_1 = L3_1
  if not L1_1 then
    L0_1.ReportUEFIData = L2_1
    if L2_1 == "Scanning aborted by the user!" then
      L3_1 = error
      L4_1 = MpCommon
      L4_1 = L4_1.JsonSerialize
      L5_1 = L0_1
      L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
      L3_1(L4_1, L5_1, L6_1, L7_1)
    end
  end
end
L3_1 = pcall
L4_1 = Infrastructure_SharePointScan
L3_1, L4_1 = L3_1(L4_1)
L2_1 = L4_1
L1_1 = L3_1
if not L1_1 then
  L0_1.SharePointScan = L2_1
  if L2_1 == "Scanning aborted by the user!" then
    L3_1 = error
    L4_1 = MpCommon
    L4_1 = L4_1.JsonSerialize
    L5_1 = L0_1
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
    L3_1(L4_1, L5_1, L6_1, L7_1)
  end
end
L3_1 = next
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L3_1 = error
  L4_1 = MpCommon
  L4_1 = L4_1.JsonSerialize
  L5_1 = L0_1
  L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
  L3_1(L4_1, L5_1, L6_1, L7_1)
end
