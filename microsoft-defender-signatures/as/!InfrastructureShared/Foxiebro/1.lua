local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 == nil then
    return
  end
  L1_2 = Infrastructure_SplitThreatPath
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  if L1_2 ~= nil and L2_2 ~= nil and L3_2 ~= nil then
    L5_2 = string
    L5_2 = L5_2.gsub
    L6_2 = L1_2
    L7_2 = "^\\\\%?\\"
    L8_2 = ""
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L1_2 = L5_2
    L5_2 = string
    L5_2 = L5_2.lower
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L1_2 = L5_2
    L5_2 = string
    L5_2 = L5_2.lower
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L3_2 = L5_2
    L5_2 = string
    L5_2 = L5_2.sub
    L6_2 = L1_2
    L7_2 = 2
    L8_2 = 16
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    if L5_2 == ":\\program files" then
      L5_2 = string
      L5_2 = L5_2.sub
      L6_2 = L3_2
      L7_2 = 1
      L8_2 = 6
      L5_2 = L5_2(L6_2, L7_2, L8_2)
      if L5_2 == "update" then
        L5_2 = string
        L5_2 = L5_2.sub
        L6_2 = L3_2
        L7_2 = -4
        L5_2 = L5_2(L6_2, L7_2)
        if L5_2 == ".exe" then
          L5_2 = string
          L5_2 = L5_2.len
          L6_2 = L3_2
          L5_2 = L5_2(L6_2)
          if 10 < L5_2 then
            L5_2 = string
            L5_2 = L5_2.sub
            L6_2 = L3_2
            L7_2 = 7
            L8_2 = -5
            L5_2 = L5_2(L6_2, L7_2, L8_2)
            L6_2 = string
            L6_2 = L6_2.lower
            L7_2 = string
            L7_2 = L7_2.gsub
            L8_2 = L2_2
            L9_2 = " "
            L10_2 = ""
            L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2, L9_2, L10_2)
            L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            if L6_2 == L5_2 then
              L7_2 = string
              L7_2 = L7_2.len
              L8_2 = L6_2
              L7_2 = L7_2(L8_2)
              if 0 < L7_2 and L2_2 ~= nil then
                L7_2 = string
                L7_2 = L7_2.len
                L8_2 = L2_2
                L7_2 = L7_2(L8_2)
                if 0 < L7_2 then
                  L7_2 = sysio
                  L7_2 = L7_2.FindFiles
                  L8_2 = L1_2
                  L9_2 = "*.dll"
                  L10_2 = -1
                  L7_2 = L7_2(L8_2, L9_2, L10_2)
                  L8_2 = pairs
                  L9_2 = L7_2
                  L8_2, L9_2, L10_2 = L8_2(L9_2)
                  for L11_2, L12_2 in L8_2, L9_2, L10_2 do
                    L13_2 = MpDetection
                    L13_2 = L13_2.ScanResource
                    L14_2 = "file://"
                    L15_2 = L12_2
                    L14_2 = L14_2 .. L15_2
                    L13_2(L14_2)
                  end
                  L8_2 = sysio
                  L8_2 = L8_2.FindFiles
                  L9_2 = L1_2
                  L10_2 = "*.exe"
                  L11_2 = -1
                  L8_2 = L8_2(L9_2, L10_2, L11_2)
                  L9_2 = pairs
                  L10_2 = L8_2
                  L9_2, L10_2, L11_2 = L9_2(L10_2)
                  for L12_2, L13_2 in L9_2, L10_2, L11_2 do
                    L14_2 = MpDetection
                    L14_2 = L14_2.ScanResource
                    L15_2 = "file://"
                    L16_2 = L13_2
                    L15_2 = L15_2 .. L16_2
                    L14_2(L15_2)
                  end
                  L9_2 = 805306497
                  L10_2 = Infrastructure_DetectionReportFolder
                  L11_2 = L9_2
                  L12_2 = A0_2
                  L13_2 = true
                  L10_2(L11_2, L12_2, L13_2)
                  L10_2 = Infrastructure_ReportBHOByName
                  L11_2 = L9_2
                  L12_2 = L2_2
                  L10_2(L11_2, L12_2)
                  L10_2 = Infrastructure_ReportSoftwareRegistryByKey
                  L11_2 = L9_2
                  L12_2 = L2_2
                  L10_2(L11_2, L12_2)
                  L10_2 = Infrastructure_ReportUninstallRegistryByKey
                  L11_2 = L9_2
                  L12_2 = L2_2
                  L10_2(L11_2, L12_2)
                end
              end
            end
          end
        end
      end
    end
  end
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil then
    return
  end
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = "^\\\\%?\\"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "%a:\\program files\\[%a%s]+\\uninstaller.exe"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = string
    L1_2 = L1_2.match
    L2_2 = A0_2
    L3_2 = "%a:\\programdata\\%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x\\"
    L1_2 = L1_2(L2_2, L3_2)
    if not L1_2 then
      L1_2 = string
      L1_2 = L1_2.match
      L2_2 = A0_2
      L3_2 = "%a:\\program files.*\\common files\\%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x\\"
      L1_2 = L1_2(L2_2, L3_2)
      if not L1_2 then
        goto lbl_41
      end
    end
  end
  L1_2 = 805306497
  L2_2 = Infrastructure_DetectionReportFolder
  L3_2 = L1_2
  L4_2 = A0_2
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
  ::lbl_41::
end

L2_1 = MpDetection
L2_1 = L2_1.GetCurrentThreat
L2_1 = L2_1()
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1.Name
L5_1 = "BrowserModifier:Win32/Foxiebro"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
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
        L8_1 = L0_1
        L9_1 = L7_1.Path
        L8_1(L9_1)
        L8_1 = L1_1
        L9_1 = L7_1.Path
        L8_1(L9_1)
      end
    end
  end
end
