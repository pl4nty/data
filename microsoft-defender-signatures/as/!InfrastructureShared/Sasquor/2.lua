local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = 805306494
L1_1 = SuweezyReportExclusionLatents
L2_1 = L0_1
L1_1(L2_1)
L1_1 = nil
L2_1 = nil
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
      L9_1 = Infrastructure_SplitThreatPath
      L10_1 = L8_1.Path
      L9_1, L10_1, L11_1, L12_1 = L9_1(L10_1)
      if L12_1 == "dll" or L12_1 == "exe" then
        L13_1 = Infrastructure_DetectionReportFolder
        L14_1 = L0_1
        L15_1 = L8_1.Path
        L16_1 = true
        L13_1(L14_1, L15_1, L16_1)
        L13_1 = string
        L13_1 = L13_1.sub
        L14_1 = string
        L14_1 = L14_1.lower
        L15_1 = L8_1.Path
        L14_1 = L14_1(L15_1)
        L15_1 = -18
        L13_1 = L13_1(L14_1, L15_1)
        if L13_1 == "qqbrowserframe.dll" then
          L1_1 = L8_1.Path
        end
        L13_1 = string
        L13_1 = L13_1.sub
        L14_1 = string
        L14_1 = L14_1.lower
        L15_1 = L8_1.Path
        L14_1 = L14_1(L15_1)
        L15_1 = -10
        L13_1 = L13_1(L14_1, L15_1)
        if L13_1 == "update.dll" then
          L2_1 = L8_1.Path
        end
      end
    end
  end
end
if L1_1 ~= nil then
  L4_1 = Infrastructure_SplitThreatPath
  L5_1 = L1_1
  L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L4_1
  L10_1 = "\\QQBrowser.exe"
  L9_1 = L9_1 .. L10_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = MpDetection
    L8_1 = L8_1.ReportResource
    L9_1 = "file"
    L10_1 = L4_1
    L11_1 = "\\QQBrowser.exe"
    L10_1 = L10_1 .. L11_1
    L11_1 = L0_1
    L12_1 = false
    L8_1(L9_1, L10_1, L11_1, L12_1)
  end
end
if L2_1 ~= nil then
  L4_1 = Infrastructure_SplitThreatPath
  L5_1 = L2_1
  L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L4_1
  L10_1 = "\\BaofengUpdate_U.exe"
  L9_1 = L9_1 .. L10_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = MpDetection
    L8_1 = L8_1.ReportResource
    L9_1 = "file"
    L10_1 = L4_1
    L11_1 = "\\BaofengUpdate_U.exe"
    L10_1 = L10_1 .. L11_1
    L11_1 = L0_1
    L12_1 = false
    L8_1(L9_1, L10_1, L11_1, L12_1)
  end
end
L4_1 = sysio
L4_1 = L4_1.ExpandFilePath
L5_1 = "%LOCALAPPDATA%"
L6_1 = true
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= nil then
  L5_1 = pairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1
    L11_1 = "\\SNARER\\Snarer.dll"
    L10_1 = L10_1 .. L11_1
    L11_1 = sysio
    L11_1 = L11_1.IsFileExists
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = Infrastructure_DetectionReportFolder
      L12_1 = L0_1
      L13_1 = L10_1
      L14_1 = true
      L11_1(L12_1, L13_1, L14_1)
    end
    L11_1 = L9_1
    L12_1 = "\\NPASRE\\Snare.dll"
    L10_1 = L11_1 .. L12_1
    L11_1 = sysio
    L11_1 = L11_1.IsFileExists
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = Infrastructure_DetectionReportFolder
      L12_1 = L0_1
      L13_1 = L10_1
      L14_1 = true
      L11_1(L12_1, L13_1, L14_1)
    end
  end
end
L5_1 = Infrastructure_ReportRegistryKey
L6_1 = L0_1
L7_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\SNARER"
L5_1(L6_1, L7_1)
L5_1 = Infrastructure_ReportRegistryValue
L6_1 = L0_1
L7_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SvcHost"
L8_1 = "SNARER"
L5_1(L6_1, L7_1, L8_1)
L5_1 = Infrastructure_ReportRegistryKey
L6_1 = L0_1
L7_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\NPASRE"
L5_1(L6_1, L7_1)
L5_1 = Infrastructure_ReportRegistryValue
L6_1 = L0_1
L7_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SvcHost"
L8_1 = "NPASRE"
L5_1(L6_1, L7_1, L8_1)
L5_1 = MpCommon
L5_1 = L5_1.ExpandEnvironmentVariables
L6_1 = "%ProgramFiles%"
L5_1 = L5_1(L6_1)
L6_1 = sysio
L6_1 = L6_1.IsFileExists
L7_1 = L5_1
L8_1 = "\\MIO\\MIO.exe"
L7_1 = L7_1 .. L8_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = Infrastructure_DetectionReportFolder
  L7_1 = L0_1
  L8_1 = L5_1
  L9_1 = "\\MIO\\MIO.exe"
  L8_1 = L8_1 .. L9_1
  L9_1 = true
  L6_1(L7_1, L8_1, L9_1)
end
L6_1 = MpCommon
L6_1 = L6_1.ExpandEnvironmentVariables
L7_1 = "%ProgramFiles(x86)%"
L6_1 = L6_1(L7_1)
L7_1 = sysio
L7_1 = L7_1.IsFileExists
L8_1 = L6_1
L9_1 = "\\MIO\\MIO.exe"
L8_1 = L8_1 .. L9_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = Infrastructure_DetectionReportFolder
  L8_1 = L0_1
  L9_1 = L6_1
  L10_1 = "\\MIO\\MIO.exe"
  L9_1 = L9_1 .. L10_1
  L10_1 = true
  L7_1(L8_1, L9_1, L10_1)
end
L7_1 = Infrastructure_ReportImageFileDebugger
L8_1 = L0_1
L9_1 = "GoogleUpdate.exe"
L7_1(L8_1, L9_1)
L7_1 = Infrastructure_ReportImageFileDebugger
L8_1 = L0_1
L9_1 = "GoogleUpdaterService.exe"
L7_1(L8_1, L9_1)
L7_1 = Infrastructure_ReportSoftwareRegistryByKey
L8_1 = L0_1
L9_1 = "WinArcher"
L7_1(L8_1, L9_1)
L7_1 = Infrastructure_ReportSoftwareRegistryByKey
L8_1 = L0_1
L9_1 = "ourluckysitesSoftware"
L7_1(L8_1, L9_1)
