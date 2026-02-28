local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = 805306512
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
  L3_1 = ""
  L4_1 = pairs
  L5_1 = L2_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = L8_1
    L10_1 = "\\Microsoft\\Windows\\Start Menu\\Programs\\Boost My PC\\Boost My PC.lnk"
    L3_1 = L9_1 .. L10_1
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L3_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = Infrastructure_DetectionReportFolder
      L10_1 = L0_1
      L11_1 = L3_1
      L12_1 = true
      L9_1(L10_1, L11_1, L12_1)
    end
  end
end
L3_1 = Infrastructure_ReportSoftwareRegistryByKey
L4_1 = L0_1
L5_1 = "Boost My PC"
L3_1(L4_1, L5_1)
L3_1 = MpDetection
L3_1 = L3_1.ReportResource
L4_1 = "regkey"
L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\Boost My PC.exe"
L6_1 = L0_1
L7_1 = false
L3_1(L4_1, L5_1, L6_1, L7_1)
