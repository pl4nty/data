local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = string
  L2_2 = L2_2.sub
  L3_2 = A1_2
  L4_2 = 1
  L5_2 = -5
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = "HKLM\\SYSTEM\\CurrentControlSet\\services\\"
  L4_2 = L2_2
  L3_2 = L3_2 .. L4_2
  L4_2 = sysio
  L4_2 = L4_2.RegOpenKey
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = sysio
    L5_2 = L5_2.GetRegValueAsString
    L6_2 = L4_2
    L7_2 = "Description"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = sysio
    L6_2 = L6_2.GetRegValueAsString
    L7_2 = L4_2
    L8_2 = "DisplayName"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 == L2_2 and L5_2 == L2_2 then
      L7_2 = sysio
      L7_2 = L7_2.GetRegValueAsString
      L8_2 = L4_2
      L9_2 = "ImagePath"
      L7_2 = L7_2(L8_2, L9_2)
      L8_2 = string
      L8_2 = L8_2.sub
      L9_2 = A0_2
      L10_2 = A1_2
      L9_2 = L9_2 .. L10_2
      L10_2 = -53
      L8_2 = L8_2(L9_2, L10_2)
      if L7_2 ~= nil then
        L9_2 = string
        L9_2 = L9_2.lower
        L10_2 = L7_2
        L9_2 = L9_2(L10_2)
        if L8_2 == L9_2 then
          L9_2 = MpDetection
          L9_2 = L9_2.ReportResource
          L10_2 = "regkey"
          L11_2 = L3_2
          L12_2 = 805306488
          L13_2 = false
          L9_2(L10_2, L11_2, L12_2, L13_2)
          L9_2 = true
          return L9_2
        end
      end
    end
  end
  L5_2 = false
  return L5_2
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = "HKLM\\SYSTEM\\CurrentControlSet\\services"
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = sysio
    L3_2 = L3_2.RegEnumKeys
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = pairs
      L5_2 = L3_2
      L4_2, L5_2, L6_2 = L4_2(L5_2)
      for L7_2, L8_2 in L4_2, L5_2, L6_2 do
        L9_2 = string
        L9_2 = L9_2.len
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        if L9_2 == 32 then
          L9_2 = string
          L9_2 = L9_2.match
          L10_2 = L8_2
          L11_2 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x"
          L9_2 = L9_2(L10_2, L11_2)
          if L9_2 then
            L9_2 = L1_2
            L10_2 = "\\"
            L11_2 = L8_2
            L9_2 = L9_2 .. L10_2 .. L11_2
            L10_2 = sysio
            L10_2 = L10_2.RegOpenKey
            L11_2 = L9_2
            L10_2 = L10_2(L11_2)
            if L10_2 then
              L11_2 = sysio
              L11_2 = L11_2.GetRegValueAsString
              L12_2 = L10_2
              L13_2 = "DisplayName"
              L11_2 = L11_2(L12_2, L13_2)
              if L11_2 == L8_2 then
                L12_2 = sysio
                L12_2 = L12_2.GetRegValueAsString
                L13_2 = L10_2
                L14_2 = "ImagePath"
                L12_2 = L12_2(L13_2, L14_2)
                if L12_2 ~= nil then
                  L13_2 = string
                  L13_2 = L13_2.len
                  L14_2 = L12_2
                  L13_2 = L13_2(L14_2)
                  if 80 < L13_2 then
                    L13_2 = string
                    L13_2 = L13_2.lower
                    L14_2 = L12_2
                    L13_2 = L13_2(L14_2)
                    L12_2 = L13_2
                    L13_2 = string
                    L13_2 = L13_2.sub
                    L14_2 = L12_2
                    L15_2 = 1
                    L16_2 = 1
                    L13_2 = L13_2(L14_2, L15_2, L16_2)
                    if L13_2 == "\"" then
                      L13_2 = string
                      L13_2 = L13_2.sub
                      L14_2 = L12_2
                      L15_2 = 2
                      L16_2 = -2
                      L13_2 = L13_2(L14_2, L15_2, L16_2)
                      L12_2 = L13_2
                    end
                    L13_2 = string
                    L13_2 = L13_2.sub
                    L14_2 = L12_2
                    L15_2 = 1
                    L16_2 = -37
                    L13_2 = L13_2(L14_2, L15_2, L16_2)
                    L14_2 = string
                    L14_2 = L14_2.sub
                    L15_2 = L12_2
                    L16_2 = -36
                    L14_2 = L14_2(L15_2, L16_2)
                    L15_2 = string
                    L15_2 = L15_2.lower
                    L16_2 = A0_2
                    L15_2 = L15_2(L16_2)
                    if L13_2 == L15_2 then
                      L15_2 = string
                      L15_2 = L15_2.match
                      L16_2 = L14_2
                      L17_2 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.exe"
                      L15_2 = L15_2(L16_2, L17_2)
                      if L15_2 then
                        L15_2 = MpDetection
                        L15_2 = L15_2.ReportResource
                        L16_2 = "regkey"
                        L17_2 = L9_2
                        L18_2 = 805306488
                        L19_2 = false
                        L15_2(L16_2, L17_2, L18_2, L19_2)
                        L15_2 = true
                        return L15_2
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L3_2 = false
  return L3_2
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = string
  L1_2 = L1_2.len
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = sysio
  L2_2 = L2_2.IsFolderExists
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = sysio
    L2_2 = L2_2.FindFiles
    L3_2 = A0_2
    L4_2 = "*"
    L5_2 = 1
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = pairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      L8_2 = sysio
      L8_2 = L8_2.IsFileExists
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L8_2 = MpDetection
        L8_2 = L8_2.ReportResource
        L9_2 = "file"
        L10_2 = L7_2
        L11_2 = 805306488
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L8_2 = Infrastructure_SplitThreatPath
        L9_2 = L7_2
        L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
        L12_2 = string
        L12_2 = L12_2.len
        L13_2 = L8_2
        L12_2 = L12_2(L13_2)
        if L1_2 < L12_2 then
          L12_2 = sysio
          L12_2 = L12_2.IsFolderExists
          L13_2 = L8_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            L12_2 = MpDetection
            L12_2 = L12_2.ReportResource
            L13_2 = "folder"
            L14_2 = L8_2
            L15_2 = 805306488
            L16_2 = false
            L12_2(L13_2, L14_2, L15_2, L16_2)
          end
        end
      end
    end
    L3_2 = MpDetection
    L3_2 = L3_2.ReportResource
    L4_2 = "folder"
    L5_2 = A0_2
    L6_2 = 805306488
    L7_2 = false
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = true
    return L3_2
  end
  L2_2 = false
  return L2_2
end

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = "HKLM\\SOFTWARE"
  L3_2 = "HKLM\\SOFTWARE\\Wow6432Node"
  L4_2 = sysio
  L4_2 = L4_2.RegOpenKey
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = sysio
    L5_2 = L5_2.RegEnumKeys
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L6_2 = pairs
      L7_2 = L5_2
      L6_2, L7_2, L8_2 = L6_2(L7_2)
      for L9_2, L10_2 in L6_2, L7_2, L8_2 do
        L11_2 = string
        L11_2 = L11_2.lower
        L12_2 = string
        L12_2 = L12_2.sub
        L13_2 = L10_2
        L14_2 = 1
        L15_2 = 1
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2(L13_2, L14_2, L15_2)
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        if L11_2 == "s" or L11_2 == "w" then
          L12_2 = L2_2
          L13_2 = "\\"
          L14_2 = L10_2
          L12_2 = L12_2 .. L13_2 .. L14_2
          L13_2 = sysio
          L13_2 = L13_2.RegOpenKey
          L14_2 = L12_2
          L13_2 = L13_2(L14_2)
          if L13_2 then
            L14_2 = sysio
            L14_2 = L14_2.GetRegValueAsString
            L15_2 = L13_2
            L16_2 = "uid"
            L14_2 = L14_2(L15_2, L16_2)
            L15_2 = sysio
            L15_2 = L15_2.GetRegValueAsString
            L16_2 = L13_2
            L17_2 = "aid"
            L15_2 = L15_2(L16_2, L17_2)
            if A0_2 == L14_2 and A1_2 == L15_2 then
              L16_2 = MpDetection
              L16_2 = L16_2.ReportResource
              L17_2 = "regkey"
              L18_2 = L12_2
              L19_2 = 805306488
              L20_2 = false
              L16_2(L17_2, L18_2, L19_2, L20_2)
              L16_2 = L3_2
              L17_2 = "\\"
              L18_2 = L10_2
              L16_2 = L16_2 .. L17_2 .. L18_2
              L17_2 = sysio
              L17_2 = L17_2.RegOpenKey
              L18_2 = L16_2
              L17_2 = L17_2(L18_2)
              if L17_2 then
                L17_2 = MpDetection
                L17_2 = L17_2.ReportResource
                L18_2 = "regkey"
                L19_2 = L16_2
                L20_2 = 805306488
                L21_2 = false
                L17_2(L18_2, L19_2, L20_2, L21_2)
              end
              L17_2 = MpCommon
              L17_2 = L17_2.ExpandEnvironmentVariables
              L18_2 = "%ALLUSERSPROFILE%"
              L17_2 = L17_2(L18_2)
              L18_2 = L17_2
              L19_2 = "\\Microsoft\\Windows\\Start Menu\\Programs\\"
              L20_2 = L10_2
              L21_2 = "\\"
              L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2
              L19_2 = L2_1
              L20_2 = L18_2
              L19_2(L20_2)
              L19_2 = L17_2
              L20_2 = "\\Start Menu\\Programs\\"
              L21_2 = L10_2
              L22_2 = "\\"
              L18_2 = L19_2 .. L20_2 .. L21_2 .. L22_2
              L19_2 = L2_1
              L20_2 = L18_2
              L19_2(L20_2)
              L19_2 = true
              return L19_2
            end
          end
        end
      end
    end
  end
  L5_2 = false
  return L5_2
end

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = sysio
    L2_2 = L2_2.RegEnumKeys
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L3_2 = pairs
      L4_2 = L2_2
      L3_2, L4_2, L5_2 = L3_2(L4_2)
      for L6_2, L7_2 in L3_2, L4_2, L5_2 do
        L8_2 = string
        L8_2 = L8_2.len
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L8_2 == 32 then
          L8_2 = string
          L8_2 = L8_2.match
          L9_2 = L7_2
          L10_2 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x"
          L8_2 = L8_2(L9_2, L10_2)
          if L8_2 then
            L8_2 = A0_2
            L9_2 = "\\"
            L10_2 = L7_2
            L8_2 = L8_2 .. L9_2 .. L10_2
            L9_2 = sysio
            L9_2 = L9_2.RegOpenKey
            L10_2 = L8_2
            L9_2 = L9_2(L10_2)
            if L9_2 then
              L10_2 = sysio
              L10_2 = L10_2.GetRegValueAsString
              L11_2 = L9_2
              L12_2 = "UninstallString"
              L10_2 = L10_2(L11_2, L12_2)
              L11_2 = sysio
              L11_2 = L11_2.GetRegValueAsString
              L12_2 = L9_2
              L13_2 = "DisplayName"
              L11_2 = L11_2(L12_2, L13_2)
              if (L11_2 == "Social2Search" or L11_2 == "Wajam") and L10_2 ~= nil then
                L12_2 = string
                L12_2 = L12_2.len
                L13_2 = L10_2
                L12_2 = L12_2(L13_2)
                if L12_2 == 47 then
                  L12_2 = string
                  L12_2 = L12_2.match
                  L13_2 = string
                  L13_2 = L13_2.lower
                  L14_2 = L10_2
                  L13_2 = L13_2(L14_2)
                  L14_2 = ":\\windows\\%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.exe"
                  L12_2 = L12_2(L13_2, L14_2)
                  if L12_2 then
                    L12_2 = sysio
                    L12_2 = L12_2.IsFileExists
                    L13_2 = L10_2
                    L12_2 = L12_2(L13_2)
                    if L12_2 then
                      L12_2 = MpDetection
                      L12_2 = L12_2.ReportResource
                      L13_2 = "file"
                      L14_2 = L10_2
                      L15_2 = 805306488
                      L16_2 = false
                      L12_2(L13_2, L14_2, L15_2, L16_2)
                    end
                    L12_2 = sysio
                    L12_2 = L12_2.GetRegValueAsString
                    L13_2 = L9_2
                    L14_2 = "InstallLocation"
                    L12_2 = L12_2(L13_2, L14_2)
                    if L12_2 ~= nil then
                      L13_2 = string
                      L13_2 = L13_2.len
                      L14_2 = L12_2
                      L13_2 = L13_2(L14_2)
                      if 48 < L13_2 then
                        L13_2 = string
                        L13_2 = L13_2.lower
                        L14_2 = L12_2
                        L13_2 = L13_2(L14_2)
                        L14_2 = string
                        L14_2 = L14_2.sub
                        L15_2 = L13_2
                        L16_2 = 2
                        L17_2 = 16
                        L14_2 = L14_2(L15_2, L16_2, L17_2)
                        if L14_2 == ":\\program files" then
                          L14_2 = string
                          L14_2 = L14_2.match
                          L15_2 = string
                          L15_2 = L15_2.sub
                          L16_2 = L13_2
                          L17_2 = -32
                          L18_2 = -1
                          L15_2 = L15_2(L16_2, L17_2, L18_2)
                          L16_2 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x"
                          L14_2 = L14_2(L15_2, L16_2)
                          if L14_2 then
                            L14_2 = L2_1
                            L15_2 = L12_2
                            L14_2(L15_2)
                          end
                        end
                      end
                    end
                    L13_2 = MpDetection
                    L13_2 = L13_2.ReportResource
                    L14_2 = "regkey"
                    L15_2 = L8_2
                    L16_2 = 805306488
                    L17_2 = false
                    L13_2(L14_2, L15_2, L16_2, L17_2)
                    L13_2 = true
                    return L13_2
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L2_2 = false
  return L2_2
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = MpCommon
  L1_2 = L1_2.ExpandEnvironmentVariables
  L2_2 = "%windir%"
  L1_2 = L1_2(L2_2)
  L2_2 = sysio
  L2_2 = L2_2.IsFileExists
  L3_2 = L1_2
  L4_2 = "\\Tasks\\"
  L5_2 = A0_2
  L6_2 = ".job"
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = MpDetection
    L2_2 = L2_2.ReportResource
    L3_2 = "file"
    L4_2 = L1_2
    L5_2 = "\\Tasks\\"
    L6_2 = A0_2
    L7_2 = ".job"
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
    L5_2 = 805306488
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = L1_2
  L3_2 = "\\System32"
  L2_2 = L2_2 .. L3_2
  L3_2 = sysio
  L3_2 = L3_2.IsFileExists
  L4_2 = L2_2
  L5_2 = "\\Tasks\\"
  L6_2 = A0_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = MpDetection
    L3_2 = L3_2.ReportResource
    L4_2 = "file"
    L5_2 = L2_2
    L6_2 = "\\Tasks\\"
    L7_2 = A0_2
    L5_2 = L5_2 .. L6_2 .. L7_2
    L6_2 = 805306488
    L7_2 = false
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  L3_2 = "HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\Taskcache\\Tree\\"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L4_2 = sysio
  L4_2 = L4_2.RegOpenKey
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = sysio
    L5_2 = L5_2.GetRegValueAsString
    L6_2 = L4_2
    L7_2 = "Id"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = string
    L6_2 = L6_2.len
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 == 38 then
      L6_2 = string
      L6_2 = L6_2.match
      L7_2 = L5_2
      L8_2 = "{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}"
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        L6_2 = "HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\Taskcache\\Tasks\\"
        L7_2 = L5_2
        L6_2 = L6_2 .. L7_2
        L7_2 = sysio
        L7_2 = L7_2.RegOpenKey
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L8_2 = sysio
          L8_2 = L8_2.GetRegValueAsString
          L9_2 = L7_2
          L10_2 = "Path"
          L8_2 = L8_2(L9_2, L10_2)
          if L8_2 ~= nil then
            L9_2 = string
            L9_2 = L9_2.sub
            L10_2 = L8_2
            L11_2 = 1
            L12_2 = 1
            L9_2 = L9_2(L10_2, L11_2, L12_2)
            if L9_2 == "\\" then
              L9_2 = string
              L9_2 = L9_2.sub
              L10_2 = L8_2
              L11_2 = 2
              L9_2 = L9_2(L10_2, L11_2)
              L8_2 = L9_2
            end
          end
          if L8_2 == A0_2 then
            L9_2 = MpDetection
            L9_2 = L9_2.ReportResource
            L10_2 = "regkey"
            L11_2 = L6_2
            L12_2 = 805306488
            L13_2 = false
            L9_2(L10_2, L11_2, L12_2, L13_2)
            L9_2 = MpDetection
            L9_2 = L9_2.ReportResource
            L10_2 = "regkey"
            L11_2 = L3_2
            L12_2 = 805306488
            L13_2 = false
            L9_2(L10_2, L11_2, L12_2, L13_2)
          end
        end
      end
    end
  end
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = sysio
  L1_2 = L1_2.IsFolderExists
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = sysio
    L1_2 = L1_2.FindFiles
    L2_2 = A0_2
    L3_2 = "*.ps1"
    L4_2 = 0
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L2_2 = pairs
    L3_2 = L1_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = sysio
      L7_2 = L7_2.IsFileExists
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = Infrastructure_SplitThreatPath
        L8_2 = L6_2
        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
        L11_2 = string
        L11_2 = L11_2.match
        L12_2 = L9_2
        L13_2 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.ps1"
        L11_2 = L11_2(L12_2, L13_2)
        if L11_2 then
          L11_2 = string
          L11_2 = L11_2.sub
          L12_2 = L6_2
          L13_2 = 1
          L14_2 = 4
          L11_2 = L11_2(L12_2, L13_2, L14_2)
          if L11_2 == "\\\\?\\" then
            L11_2 = string
            L11_2 = L11_2.sub
            L12_2 = L6_2
            L13_2 = 5
            L11_2 = L11_2(L12_2, L13_2)
            L6_2 = L11_2
          end
          L11_2 = sysio
          L11_2 = L11_2.GetFileSize
          L12_2 = L6_2
          L11_2 = L11_2(L12_2)
          if 20000 < L11_2 and L11_2 < 80000 then
            L12_2 = sysio
            L12_2 = L12_2.ReadFile
            L13_2 = L6_2
            L14_2 = 0
            L15_2 = 25
            L12_2 = L12_2(L13_2, L14_2, L15_2)
            if L12_2 ~= nil then
              L13_2 = string
              L13_2 = L13_2.lower
              L14_2 = L12_2
              L13_2 = L13_2(L14_2)
              if L13_2 == "$lnlfd = \"01000000d08c9dd" then
                L13_2 = MpDetection
                L13_2 = L13_2.ReportResource
                L14_2 = "file"
                L15_2 = L6_2
                L16_2 = 805306488
                L17_2 = false
                L13_2(L14_2, L15_2, L16_2, L17_2)
                L13_2 = string
                L13_2 = L13_2.sub
                L14_2 = L9_2
                L15_2 = 1
                L16_2 = -5
                L13_2 = L13_2(L14_2, L15_2, L16_2)
                L14_2 = L5_1
                L15_2 = L13_2
                L14_2(L15_2)
                L14_2 = true
                return L14_2
              end
            end
          end
        end
      end
    end
  end
  L1_2 = false
  return L1_2
end

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = sysio
    L2_2 = L2_2.RegEnumValues
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = pairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      L8_2 = string
      L8_2 = L8_2.match
      L9_2 = L7_2
      L10_2 = "%a:\\Windows\\System32\\drivers\\%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.sys"
      L8_2 = L8_2(L9_2, L10_2)
      if not L8_2 then
        L8_2 = string
        L8_2 = L8_2.match
        L9_2 = L7_2
        L10_2 = "%a:\\program files\\%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x\\"
        L8_2 = L8_2(L9_2, L10_2)
        if not L8_2 then
          L8_2 = string
          L8_2 = L8_2.match
          L9_2 = L7_2
          L10_2 = "%a:\\Windows\\%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.exe"
          L8_2 = L8_2(L9_2, L10_2)
          if not L8_2 then
            goto lbl_46
          end
        end
      end
      L8_2 = MpDetection
      L8_2 = L8_2.ReportResource
      L9_2 = "regkeyvalue"
      L10_2 = A0_2
      L11_2 = "\\\\"
      L12_2 = L7_2
      L10_2 = L10_2 .. L11_2 .. L12_2
      L11_2 = 805306488
      L12_2 = false
      L8_2(L9_2, L10_2, L11_2, L12_2)
      ::lbl_46::
    end
  end
end

L8_1 = MpDetection
L8_1 = L8_1.GetCurrentThreat
L8_1 = L8_1()
L9_1 = string
L9_1 = L9_1.find
L10_1 = L8_1.Name
L11_1 = "BrowserModifier:Win32/Soctuseer"
L12_1 = 1
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if L9_1 then
  L9_1 = pairs
  L10_1 = L8_1.Resources
  L9_1, L10_1, L11_1 = L9_1(L10_1)
  for L12_1, L13_1 in L9_1, L10_1, L11_1 do
    L14_1 = L13_1.Schema
    if L14_1 == "file" then
      L14_1 = crypto
      L14_1 = L14_1.bitand
      L15_1 = L13_1.Type
      L16_1 = MpCommon
      L16_1 = L16_1.MPRESOURCE_TYPE_CONCRETE
      L14_1 = L14_1(L15_1, L16_1)
      L15_1 = MpCommon
      L15_1 = L15_1.MPRESOURCE_TYPE_CONCRETE
      if L14_1 == L15_1 then
        L14_1 = Infrastructure_SplitThreatPath
        L15_1 = L13_1.Path
        L14_1, L15_1, L16_1, L17_1 = L14_1(L15_1)
        L18_1 = string
        L18_1 = L18_1.lower
        L19_1 = L14_1
        L18_1 = L18_1(L19_1)
        L14_1 = L18_1
        L18_1 = string
        L18_1 = L18_1.sub
        L19_1 = L14_1
        L20_1 = 1
        L21_1 = 4
        L18_1 = L18_1(L19_1, L20_1, L21_1)
        if L18_1 == "\\\\?\\" then
          L18_1 = string
          L18_1 = L18_1.sub
          L19_1 = L14_1
          L20_1 = 5
          L18_1 = L18_1(L19_1, L20_1)
          L14_1 = L18_1
        end
        L18_1 = string
        L18_1 = L18_1.sub
        L19_1 = L14_1
        L20_1 = -1
        L18_1 = L18_1(L19_1, L20_1)
        if L18_1 ~= "\\" then
          L18_1 = L14_1
          L19_1 = "\\"
          L14_1 = L18_1 .. L19_1
        end
        L18_1 = string
        L18_1 = L18_1.find
        L19_1 = L14_1
        L20_1 = "system32\\drivers"
        L21_1 = 1
        L22_1 = true
        L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
        if L18_1 then
          if L17_1 == "sys" then
            L18_1 = string
            L18_1 = L18_1.len
            L19_1 = L16_1
            L18_1 = L18_1(L19_1)
            if L18_1 == 36 then
              L18_1 = string
              L18_1 = L18_1.match
              L19_1 = L16_1
              L20_1 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.sys"
              L18_1 = L18_1(L19_1, L20_1)
              if L18_1 then
                L18_1 = L0_1
                L19_1 = L14_1
                L20_1 = L16_1
                L18_1(L19_1, L20_1)
              end
            end
          end
        else
          L18_1 = string
          L18_1 = L18_1.sub
          L19_1 = L14_1
          L20_1 = 2
          L21_1 = 16
          L18_1 = L18_1(L19_1, L20_1, L21_1)
          if L18_1 == ":\\program files" then
            L18_1 = string
            L18_1 = L18_1.len
            L19_1 = L15_1
            L18_1 = L18_1(L19_1)
            if L18_1 == 32 then
              L18_1 = string
              L18_1 = L18_1.match
              L19_1 = L15_1
              L20_1 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x"
              L18_1 = L18_1(L19_1, L20_1)
              if L18_1 then
                L18_1 = string
                L18_1 = L18_1.sub
                L19_1 = L16_1
                L20_1 = 1
                L21_1 = -5
                L18_1 = L18_1(L19_1, L20_1, L21_1)
                if L17_1 == "exe" or L17_1 == "sys" then
                  L19_1 = string
                  L19_1 = L19_1.len
                  L20_1 = L16_1
                  L19_1 = L19_1(L20_1)
                  if L19_1 == 36 then
                    L19_1 = string
                    L19_1 = L19_1.match
                    L20_1 = L18_1
                    L21_1 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x"
                    L19_1 = L19_1(L20_1, L21_1)
                    if L19_1 then
                      L19_1 = L2_1
                      L20_1 = L14_1
                      L19_1 = L19_1(L20_1)
                      if L19_1 then
                        L19_1 = L1_1
                        L20_1 = L14_1
                        L19_1(L20_1)
                      end
                  end
                end
                elseif L17_1 == "dll" then
                  L19_1 = string
                  L19_1 = L19_1.sub
                  L20_1 = L14_1
                  L21_1 = 1
                  L22_1 = -34
                  L19_1 = L19_1(L20_1, L21_1, L22_1)
                  L14_1 = L19_1
                  L19_1 = string
                  L19_1 = L19_1.len
                  L20_1 = L14_1
                  L19_1 = L19_1(L20_1)
                  if 32 < L19_1 then
                    L19_1 = string
                    L19_1 = L19_1.sub
                    L20_1 = L14_1
                    L21_1 = -33
                    L22_1 = -2
                    L19_1 = L19_1(L20_1, L21_1, L22_1)
                    L20_1 = string
                    L20_1 = L20_1.match
                    L21_1 = L19_1
                    L22_1 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x"
                    L20_1 = L20_1(L21_1, L22_1)
                    if L20_1 then
                      L20_1 = L2_1
                      L21_1 = L14_1
                      L20_1 = L20_1(L21_1)
                      if L20_1 then
                        L20_1 = L1_1
                        L21_1 = L14_1
                        L20_1(L21_1)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L9_1 = sysio
  L9_1 = L9_1.RegExpandUserKey
  L10_1 = "HKCU\\Software\\WajIEnhance"
  L9_1 = L9_1(L10_1)
  if L9_1 then
    L10_1 = pairs
    L11_1 = L9_1
    L10_1, L11_1, L12_1 = L10_1(L11_1)
    for L13_1, L14_1 in L10_1, L11_1, L12_1 do
      L15_1 = sysio
      L15_1 = L15_1.RegOpenKey
      L16_1 = L14_1
      L15_1 = L15_1(L16_1)
      if L15_1 then
        L16_1 = sysio
        L16_1 = L16_1.GetRegValueAsString
        L17_1 = L15_1
        L18_1 = "unique_id"
        L16_1 = L16_1(L17_1, L18_1)
        L17_1 = sysio
        L17_1 = L17_1.GetRegValueAsString
        L18_1 = L15_1
        L19_1 = "affiliate_id"
        L17_1 = L17_1(L18_1, L19_1)
        if L16_1 ~= nil and L17_1 ~= nil then
          L18_1 = L3_1
          L19_1 = L16_1
          L20_1 = L17_1
          L18_1 = L18_1(L19_1, L20_1)
          if L18_1 then
            L18_1 = MpDetection
            L18_1 = L18_1.ReportResource
            L19_1 = "regkey"
            L20_1 = L14_1
            L21_1 = 805306488
            L22_1 = false
            L18_1(L19_1, L20_1, L21_1, L22_1)
          end
        end
      end
    end
  end
  L10_1 = L4_1
  L11_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  L10_1(L11_1)
  L10_1 = L4_1
  L11_1 = "HKLM\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  L10_1(L11_1)
  L10_1 = MpCommon
  L10_1 = L10_1.ExpandEnvironmentVariables
  L11_1 = "%windir%"
  L10_1 = L10_1(L11_1)
  L11_1 = L6_1
  L12_1 = L10_1
  L11_1(L12_1)
  L11_1 = L7_1
  L12_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\Paths"
  L11_1(L12_1)
end
