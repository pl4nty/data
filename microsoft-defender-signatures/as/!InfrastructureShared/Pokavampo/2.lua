local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = MpDetection
L0_1 = L0_1.GetCurrentThreat
L0_1 = L0_1()
L1_1 = L0_1.Name
if L1_1 == "SoftwareBundler:Win32/Pokavampo" then
  L1_1 = pairs
  L2_1 = L0_1.Resources
  L1_1, L2_1, L3_1 = L1_1(L2_1)
  for L4_1, L5_1 in L1_1, L2_1, L3_1 do
    L6_1 = L5_1.Schema
    if L6_1 == "file" then
      L6_1 = crypto
      L6_1 = L6_1.bitand
      L7_1 = L5_1.Type
      L8_1 = MpCommon
      L8_1 = L8_1.MPRESOURCE_TYPE_CONCRETE
      L6_1 = L6_1(L7_1, L8_1)
      L7_1 = MpCommon
      L7_1 = L7_1.MPRESOURCE_TYPE_CONCRETE
      if L6_1 == L7_1 then
        L6_1 = Infrastructure_DetectionReportUninstallEntriesFromFolder
        L7_1 = 805306499
        L8_1 = L5_1.Path
        L6_1(L7_1, L8_1)
        L6_1 = Infrastructure_DetectionReportFolder
        L7_1 = 805306499
        L8_1 = L5_1.Path
        L9_1 = true
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = Infrastructure_GetEnvironmentPath
        L7_1 = "%common_appdata%"
        L6_1 = L6_1(L7_1)
        if L6_1 then
          L7_1 = MpDetection
          L7_1 = L7_1.ScanResource
          L8_1 = "folder://"
          L9_1 = L6_1
          L10_1 = "\\Microsoft\\Network\\Dsq\\network"
          L8_1 = L8_1 .. L9_1 .. L10_1
          L7_1(L8_1)
        end
        L7_1 = MpCommon
        L7_1 = L7_1.ExpandEnvironmentVariables
        L8_1 = "%program_files%"
        L7_1 = L7_1(L8_1)
        if L7_1 then
          L8_1 = sysio
          L8_1 = L8_1.FindFolders
          L9_1 = L7_1
          L10_1 = "*-*-*"
          L11_1 = 0
          L8_1 = L8_1(L9_1, L10_1, L11_1)
          L9_1 = pairs
          L10_1 = L8_1
          L9_1, L10_1, L11_1 = L9_1(L10_1)
          for L12_1, L13_1 in L9_1, L10_1, L11_1 do
            L14_1 = MpDetection
            L14_1 = L14_1.ScanResource
            L15_1 = "folder://"
            L16_1 = L13_1
            L15_1 = L15_1 .. L16_1
            L14_1(L15_1)
          end
        end
        L8_1 = MpCommon
        L8_1 = L8_1.ExpandEnvironmentVariables
        L9_1 = "%program_filesx86%"
        L8_1 = L8_1(L9_1)
        if L8_1 then
          L9_1 = sysio
          L9_1 = L9_1.FindFolders
          L10_1 = L8_1
          L11_1 = "*-*-*"
          L12_1 = 0
          L9_1 = L9_1(L10_1, L11_1, L12_1)
          L10_1 = pairs
          L11_1 = L9_1
          L10_1, L11_1, L12_1 = L10_1(L11_1)
          for L13_1, L14_1 in L10_1, L11_1, L12_1 do
            L15_1 = MpDetection
            L15_1 = L15_1.ScanResource
            L16_1 = "folder://"
            L17_1 = L14_1
            L16_1 = L16_1 .. L17_1
            L15_1(L16_1)
          end
        end
      end
    end
  end
end
