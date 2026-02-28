local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = 805306513
L1_1 = MpDetection
L1_1 = L1_1.GetCurrentThreat
L1_1 = L1_1()
L2_1 = pairs
L3_1 = L1_1.Resources
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.Schema
  if L7_1 == "file" then
    L7_1 = crypto
    L7_1 = L7_1.bitand
    L8_1 = L6_1.Type
    L9_1 = MpCommon
    L9_1 = L9_1.MPRESOURCE_TYPE_CONCRETE
    L7_1 = L7_1(L8_1, L9_1)
    L8_1 = MpCommon
    L8_1 = L8_1.MPRESOURCE_TYPE_CONCRETE
    if L7_1 == L8_1 then
      L7_1 = Infrastructure_DetectionReportFolder
      L8_1 = L0_1
      L9_1 = L6_1.Path
      L10_1 = true
      L7_1(L8_1, L9_1, L10_1)
    end
  end
end
L2_1 = sysio
L2_1 = L2_1.ExpandFilePath
L3_1 = "%appdata%"
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = pairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1
    L9_1 = "\\System Healer\\"
    L8_1 = L8_1 .. L9_1
    L9_1 = L8_1
    L10_1 = "Languages\\English.json"
    L9_1 = L9_1 .. L10_1
    L10_1 = sysio
    L10_1 = L10_1.IsFileExists
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L10_1 = Infrastructure_DetectionReportFolder
      L11_1 = L0_1
      L12_1 = L9_1
      L13_1 = true
      L10_1(L11_1, L12_1, L13_1)
      L10_1 = MpDetection
      L10_1 = L10_1.ReportResource
      L11_1 = "folder"
      L12_1 = L8_1
      L13_1 = L0_1
      L14_1 = false
      L10_1(L11_1, L12_1, L13_1, L14_1)
    end
  end
end
L3_1 = sysio
L3_1 = L3_1.ExpandFilePath
L4_1 = "%Common_AppData%"
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = L3_1[2]
  L5_1 = "\\Microsoft\\Windows\\Start Menu\\Programs\\System Healer\\Launch System Healer.lnk"
  L4_1 = L4_1 .. L5_1
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
L5_1 = "%public%"
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if L3_1 ~= nil then
  L4_1 = L3_1[2]
  L5_1 = "\\Desktop\\Launch System Healer.lnk"
  L4_1 = L4_1 .. L5_1
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = MpDetection
    L5_1 = L5_1.ReportResource
    L6_1 = "file"
    L7_1 = L4_1
    L8_1 = L0_1
    L9_1 = false
    L5_1(L6_1, L7_1, L8_1, L9_1)
  end
end
L4_1 = Infrastructure_ReportSoftwareRegistryByKey
L5_1 = L0_1
L6_1 = "System Healer"
L4_1(L5_1, L6_1)
