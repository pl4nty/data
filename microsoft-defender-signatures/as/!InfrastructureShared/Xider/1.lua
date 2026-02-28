local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 ~= nil and A1_2 ~= nil then
    L3_2 = Infrastructure_GetFilePathFromGUID
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= nil then
      L4_2 = Infrastructure_SplitThreatPath
      L5_2 = L3_2
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      if L5_2 == A1_2 and L7_2 == "dll" then
        L8_2 = Infrastructure_DetectionReportBHOByCLSID
        L9_2 = A2_2
        L10_2 = A0_2
        L8_2(L9_2, L10_2)
        L8_2 = Infrastructure_ReportCLSID
        L9_2 = A2_2
        L10_2 = A0_2
        L8_2(L9_2, L10_2)
        L8_2 = Infrastructure_ReportIEExtensionsByClsid
        L9_2 = A2_2
        L10_2 = A0_2
        L8_2(L9_2, L10_2)
      end
    end
  end
end

ReportCLSIDbyAppDir = L0_1
L0_1 = MpDetection
L0_1 = L0_1.GetCurrentThreat
L0_1 = L0_1()
L1_1 = L0_1.Name
if L1_1 == "BrowserModifier:Win32/Xider" then
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
        L6_1 = Infrastructure_SplitThreatPath
        L7_1 = L5_1.Path
        L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1)
        L11_1 = L6_1
        L10_1 = L6_1.find
        L12_1 = ":\\program files"
        L13_1 = 1
        L14_1 = true
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        if not L10_1 then
          L11_1 = L6_1
          L10_1 = L6_1.find
          L12_1 = "\\appdata\\local\\"
          L13_1 = 1
          L14_1 = true
          L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        end
        if L10_1 and L9_1 == "exe" then
          L10_1 = string
          L10_1 = L10_1.len
          L11_1 = L7_1
          L10_1 = L10_1(L11_1)
          if 3 < L10_1 then
            L10_1 = string
            L10_1 = L10_1.sub
            L11_1 = L8_1
            L12_1 = -12
            L10_1 = L10_1(L11_1, L12_1)
            if L10_1 ~= "-enabler.exe" then
              L10_1 = string
              L10_1 = L10_1.sub
              L11_1 = L8_1
              L12_1 = -6
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 ~= "-2.exe" then
                L10_1 = string
                L10_1 = L10_1.sub
                L11_1 = L8_1
                L12_1 = -9
                L10_1 = L10_1(L11_1, L12_1)
                if L10_1 ~= "utils.exe" then
                  goto lbl_168
                end
              end
            end
            L10_1 = 536871282
            L11_1 = Infrastructure_DetectionReportFolder
            L12_1 = L10_1
            L13_1 = L6_1
            L14_1 = true
            L11_1(L12_1, L13_1, L14_1)
            L11_1 = Infrastructure_ScanTaskschedulerResources
            L11_1()
            L12_1 = L7_1
            L11_1 = L7_1.gsub
            L13_1 = "-BrowserExtensionUninstall"
            L14_1 = ""
            L11_1 = L11_1(L12_1, L13_1, L14_1)
            L12_1 = Infrastructure_HKCUExpandSpecialPath
            L13_1 = "Local AppData"
            L12_1 = L12_1(L13_1)
            L13_1 = pairs
            L14_1 = L12_1
            L13_1, L14_1, L15_1 = L13_1(L14_1)
            for L16_1, L17_1 in L13_1, L14_1, L15_1 do
              L18_1 = L17_1
              L19_1 = "\\"
              L20_1 = L11_1
              L21_1 = "\\"
              L18_1 = L18_1 .. L19_1 .. L20_1 .. L21_1
              L19_1 = sysio
              L19_1 = L19_1.IsFileExists
              L20_1 = L18_1
              L21_1 = "Chrome\\"
              L22_1 = L11_1
              L23_1 = ".crx"
              L20_1 = L20_1 .. L21_1 .. L22_1 .. L23_1
              L19_1 = L19_1(L20_1)
              if L19_1 then
                L19_1 = Infrastructure_DetectionReportFolder
                L20_1 = L10_1
                L21_1 = L18_1
                L22_1 = true
                L19_1(L20_1, L21_1, L22_1)
              end
            end
            L13_1 = Infrastructure_GetUninstallStrFromKey
            L14_1 = L11_1
            L15_1 = "Publisher"
            L13_1 = L13_1(L14_1, L15_1)
            if L13_1 == "215 Apps" then
              L13_1 = Infrastructure_DetectionReportUninstallRegKey
              L14_1 = L10_1
              L15_1 = L11_1
              L13_1(L14_1, L15_1)
            else
              L13_1 = Infrastructure_GetUninstallStrFromKey
              L14_1 = L11_1
              L15_1 = "CrPublisherId"
              L13_1 = L13_1(L14_1, L15_1)
              if L13_1 ~= nil then
                L14_1 = string
                L14_1 = L14_1.len
                L15_1 = L13_1
                L14_1 = L14_1(L15_1)
                if 1 <= L14_1 then
                  L14_1 = Infrastructure_DetectionReportUninstallRegKey
                  L15_1 = L10_1
                  L16_1 = L11_1
                  L14_1(L15_1, L16_1)
                end
              end
            end
            L13_1 = ReportCLSIDbyAppDir
            L14_1 = Infrastructure_IE_GetExtPolicyGUIDfromMatch
            L15_1 = "{11111111%-1111%-1111%-1111%-110%d%d%d%d%d%d%d%d%d}"
            L14_1 = L14_1(L15_1)
            L15_1 = L7_1
            L16_1 = L10_1
            L13_1(L14_1, L15_1, L16_1)
            L13_1 = ReportCLSIDbyAppDir
            L14_1 = Infrastructure_IE_GetExtPolicyGUIDfromMatch
            L15_1 = "{22222222%-2222%-2222%-2222%-220%d%d%d%d%d%d%d%d%d}"
            L14_1 = L14_1(L15_1)
            L15_1 = L7_1
            L16_1 = L10_1
            L13_1(L14_1, L15_1, L16_1)
            L13_1 = ReportCLSIDbyAppDir
            L14_1 = Infrastructure_IE_GetExtPolicyGUIDfromMatch
            L15_1 = "{33333333%-3333%-3333%-3333%-330%d%d%d%d%d%d%d%d%d}"
            L14_1 = L14_1(L15_1)
            L15_1 = L7_1
            L16_1 = L10_1
            L13_1(L14_1, L15_1, L16_1)
            L13_1 = ReportCLSIDbyAppDir
            L14_1 = Infrastructure_IE_GetExtPolicyGUIDfromMatch
            L15_1 = "{44444444%-4444%-4444%-4444%-440%d%d%d%d%d%d%d%d%d}"
            L14_1 = L14_1(L15_1)
            L15_1 = L7_1
            L16_1 = L10_1
            L13_1(L14_1, L15_1, L16_1)
          end
        end
      end
    end
    ::lbl_168::
  end
end
