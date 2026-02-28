local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = 805306511
L1_1 = ""
L2_1 = MpDetection
L2_1 = L2_1.GetCurrentThreat
L2_1 = L2_1()
L3_1 = pairs
L4_1 = L2_1.Resources
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = L7_1.Schema
  if L8_1 == "file" then
    L8_1 = crypto
    L8_1 = L8_1.bitand
    L9_1 = L7_1.Type
    L10_1 = MpCommon
    L10_1 = L10_1.MPRESOURCE_TYPE_CONCRETE
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = MpCommon
    L9_1 = L9_1.MPRESOURCE_TYPE_CONCRETE
    if L8_1 == L9_1 then
      L8_1 = Infrastructure_DetectionReportFolder
      L9_1 = L0_1
      L10_1 = L7_1.Path
      L11_1 = true
      L8_1(L9_1, L10_1, L11_1)
      L1_1 = L7_1.Path
    end
  end
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "%a:\\Program Files.*\\ReviverSoft\\"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= nil then
  L4_1 = sysio
  L4_1 = L4_1.IsFolderExists
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = MpDetection
    L4_1 = L4_1.ReportResource
    L5_1 = "folder"
    L6_1 = L3_1
    L7_1 = L0_1
    L8_1 = false
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
  L4_1 = "\\\\?\\"
  L5_1 = L3_1
  L6_1 = "Smart Monitor\\ReviverSoftSmartMonitorService.exe"
  L4_1 = L4_1 .. L5_1 .. L6_1
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = Infrastructure_DetectionReportFolder
    L6_1 = L0_1
    L7_1 = L4_1
    L8_1 = true
    L5_1(L6_1, L7_1, L8_1)
  end
end
L4_1 = sysio
L4_1 = L4_1.ExpandFilePath
L5_1 = "%Common_AppData%"
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = L4_1[2]
  L6_1 = "\\ReviverSoft\\"
  L5_1 = L5_1 .. L6_1
  L6_1 = L5_1
  L7_1 = "PC Reviver\\PCReviver.ini"
  L6_1 = L6_1 .. L7_1
  L7_1 = sysio
  L7_1 = L7_1.IsFileExists
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L7_1 = Infrastructure_DetectionReportFolder
    L8_1 = L0_1
    L9_1 = L6_1
    L10_1 = true
    L7_1(L8_1, L9_1, L10_1)
    L7_1 = MpDetection
    L7_1 = L7_1.ReportResource
    L8_1 = "folder"
    L9_1 = L5_1
    L10_1 = L0_1
    L11_1 = false
    L7_1(L8_1, L9_1, L10_1, L11_1)
  end
  L7_1 = L4_1[2]
  L8_1 = "\\Microsoft\\Windows\\Start Menu\\Programs\\ReviverSoft\\"
  L5_1 = L7_1 .. L8_1
  L7_1 = L5_1
  L8_1 = "PC Reviver\\PC Reviver.lnk"
  L6_1 = L7_1 .. L8_1
  L7_1 = sysio
  L7_1 = L7_1.IsFileExists
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L7_1 = Infrastructure_DetectionReportFolder
    L8_1 = L0_1
    L9_1 = L6_1
    L10_1 = true
    L7_1(L8_1, L9_1, L10_1)
    L7_1 = MpDetection
    L7_1 = L7_1.ReportResource
    L8_1 = "folder"
    L9_1 = L5_1
    L10_1 = L0_1
    L11_1 = false
    L7_1(L8_1, L9_1, L10_1, L11_1)
  end
end
L5_1 = Infrastructure_ReportRegistryAppId
L6_1 = L0_1
L7_1 = "ReviverSoftSmartMonitorService.exe"
L5_1(L6_1, L7_1)
L5_1 = Infrastructure_ReportRegistryAppId
L6_1 = L0_1
L7_1 = "SmartAlertsService.exe"
L5_1(L6_1, L7_1)
