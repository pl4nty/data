local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A1_2 == nil or A0_2 == nil then
    return
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = string
  L3_2 = L3_2.lower
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = "^\\\\%?\\"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  A1_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A1_2
  L4_2 = "%a:\\program files\\.*\\.*%.exe"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = Infrastructure_DetectionReportFolder
    L3_2 = A0_2
    L4_2 = A1_2
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = Infrastructure_SplitThreatPath
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    if L3_2 ~= nil then
      return L3_2
    end
  end
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A1_2
  L4_2 = "\\appdata\\roaming\\.*\\.*%.exe"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = Infrastructure_DetectionReportFolder
    L3_2 = A0_2
    L4_2 = A1_2
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = nil
  return L2_2
end

L1_1 = {}
L1_1["Advancedpccare.com"] = 1
L2_1 = 805306515
L3_1 = MpDetection
L3_1 = L3_1.GetCurrentThreat
L3_1 = L3_1()
L4_1 = pairs
L5_1 = L3_1.Resources
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L8_1.Schema
  if L9_1 == "file" then
    L9_1 = crypto
    L9_1 = L9_1.bitand
    L10_1 = L8_1.Type
    L11_1 = MpCommon
    L11_1 = L11_1.MPRESOURCE_TYPE_CONCRETE
    L9_1 = L9_1(L10_1, L11_1)
    L10_1 = MpCommon
    L10_1 = L10_1.MPRESOURCE_TYPE_CONCRETE
    if L9_1 == L10_1 then
      L9_1 = L0_1
      L10_1 = L2_1
      L11_1 = L8_1.Path
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 then
        L1_1[L9_1] = 1
      end
    end
  end
end
L4_1 = pairs
L5_1 = L1_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = Infrastructure_ReportSoftwareRegistryByKey
  L10_1 = L2_1
  L11_1 = L7_1
  L9_1(L10_1, L11_1)
  L9_1 = MpCommon
  L9_1 = L9_1.ExpandEnvironmentVariables
  L10_1 = "%ALLUSERSPROFILE%"
  L9_1 = L9_1(L10_1)
  L10_1 = L9_1
  L11_1 = "\\"
  L12_1 = L7_1
  L13_1 = "\\"
  L10_1 = L10_1 .. L11_1 .. L12_1 .. L13_1
  L11_1 = sysio
  L11_1 = L11_1.IsFolderExists
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if L11_1 then
    L11_1 = Infrastructure_DetectionReportFolder
    L12_1 = L2_1
    L13_1 = L10_1
    L14_1 = false
    L11_1(L12_1, L13_1, L14_1)
  end
  L11_1 = L9_1
  L12_1 = "\\Microsoft\\Windows\\Start Menu\\Programs\\"
  L13_1 = L7_1
  L14_1 = "\\"
  L11_1 = L11_1 .. L12_1 .. L13_1 .. L14_1
  L12_1 = sysio
  L12_1 = L12_1.IsFolderExists
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  if L12_1 then
    L12_1 = Infrastructure_DetectionReportFolder
    L13_1 = L2_1
    L14_1 = L11_1
    L15_1 = false
    L12_1(L13_1, L14_1, L15_1)
  end
  L12_1 = L9_1
  L13_1 = "\\Start Menu\\Programs\\"
  L14_1 = L7_1
  L15_1 = "\\"
  L11_1 = L12_1 .. L13_1 .. L14_1 .. L15_1
  L12_1 = sysio
  L12_1 = L12_1.IsFolderExists
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  if L12_1 then
    L12_1 = Infrastructure_DetectionReportFolder
    L13_1 = L2_1
    L14_1 = L11_1
    L15_1 = false
    L12_1(L13_1, L14_1, L15_1)
  end
  L12_1 = sysio
  L12_1 = L12_1.ExpandFilePath
  L13_1 = "%APPDATA%"
  L14_1 = true
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 ~= nil then
    L13_1 = pairs
    L14_1 = L12_1
    L13_1, L14_1, L15_1 = L13_1(L14_1)
    for L16_1, L17_1 in L13_1, L14_1, L15_1 do
      L18_1 = L17_1
      L19_1 = "\\"
      L20_1 = L7_1
      L21_1 = "\\"
      L18_1 = L18_1 .. L19_1 .. L20_1 .. L21_1
      L19_1 = sysio
      L19_1 = L19_1.IsFolderExists
      L20_1 = L18_1
      L19_1 = L19_1(L20_1)
      if L19_1 then
        L19_1 = Infrastructure_DetectionReportFolder
        L20_1 = L2_1
        L21_1 = L18_1
        L22_1 = true
        L19_1(L20_1, L21_1, L22_1)
      end
    end
  end
end
L4_1 = Infrastructure_ReportSoftwareRegistryByKey
L5_1 = L2_1
L6_1 = "asc-pr"
L4_1(L5_1, L6_1)
L4_1 = Infrastructure_ReportSoftwareRegistryByKey
L5_1 = L2_1
L6_1 = "ssc-pr"
L4_1(L5_1, L6_1)
L4_1 = Infrastructure_ReportSoftwareRegistryByKey
L5_1 = L2_1
L6_1 = "pcsp-pr"
L4_1(L5_1, L6_1)
L4_1 = Infrastructure_ReportSoftwareRegistryByKey
L5_1 = L2_1
L6_1 = "pcv-vars"
L4_1(L5_1, L6_1)
