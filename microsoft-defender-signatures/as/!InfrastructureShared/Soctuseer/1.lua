local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
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
    L7_2 = "DisplayName"
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 == L2_2 then
      L6_2 = string
      L6_2 = L6_2.lower
      L7_2 = A0_2
      L6_2 = L6_2(L7_2)
      A0_2 = L6_2
      L6_2 = string
      L6_2 = L6_2.sub
      L7_2 = A0_2
      L8_2 = 1
      L9_2 = 4
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      if L6_2 == "\\\\?\\" then
        L6_2 = string
        L6_2 = L6_2.sub
        L7_2 = A0_2
        L8_2 = 5
        L6_2 = L6_2(L7_2, L8_2)
        A0_2 = L6_2
      end
      L6_2 = string
      L6_2 = L6_2.sub
      L7_2 = A0_2
      L8_2 = -1
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 ~= "\\" then
        L6_2 = A0_2
        L7_2 = "\\"
        A0_2 = L6_2 .. L7_2
      end
      L6_2 = string
      L6_2 = L6_2.sub
      L7_2 = A0_2
      L8_2 = A1_2
      L7_2 = L7_2 .. L8_2
      L8_2 = -53
      L6_2 = L6_2(L7_2, L8_2)
      L7_2 = sysio
      L7_2 = L7_2.GetRegValueAsString
      L8_2 = L4_2
      L9_2 = "ImagePath"
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 ~= nil then
        L8_2 = string
        L8_2 = L8_2.lower
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L6_2 == L8_2 then
          L8_2 = sysio
          L8_2 = L8_2.StopService
          L9_2 = L2_2
          L8_2(L9_2)
          L8_2 = sysio
          L8_2 = L8_2.DeleteService
          L9_2 = L2_2
          L8_2(L9_2)
          L8_2 = sysio
          L8_2 = L8_2.DeleteRegKey
          L9_2 = L4_2
          L10_2 = nil
          L8_2(L9_2, L10_2)
        end
      end
    end
  end
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = sysio
  L1_2 = L1_2.IsFolderExists
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = sysio
    L1_2 = L1_2.FindFiles
    L2_2 = A0_2
    L3_2 = "*"
    L4_2 = 1
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L2_2 = pairs
    L3_2 = L1_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = sysio
      L7_2 = L7_2.DeleteFile
      L8_2 = L6_2
      L7_2(L8_2)
      L7_2 = sysio
      L7_2 = L7_2.GetLastResult
      L7_2 = L7_2()
      L7_2 = L7_2.Success
      if not L7_2 then
        L7_2 = Remediation
        L7_2 = L7_2.BtrDeleteFile
        L8_2 = L6_2
        L7_2(L8_2)
      end
    end
    L2_2 = true
    return L2_2
  end
  L1_2 = false
  return L1_2
end

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = "HKLM\\SYSTEM\\CurrentControlSet\\services"
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = L0_2
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
            L8_2 = L0_2
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
              L12_2 = "Description"
              L10_2 = L10_2(L11_2, L12_2)
              L11_2 = sysio
              L11_2 = L11_2.GetRegValueAsString
              L12_2 = L9_2
              L13_2 = "DisplayName"
              L11_2 = L11_2(L12_2, L13_2)
              if L11_2 ~= nil and L10_2 ~= nil and L11_2 == L7_2 then
                L12_2 = string
                L12_2 = L12_2.lower
                L13_2 = L10_2
                L12_2 = L12_2(L13_2)
                if L12_2 == "enhances experience when browsing the web." then
                  L12_2 = sysio
                  L12_2 = L12_2.GetRegValueAsString
                  L13_2 = L9_2
                  L14_2 = "ImagePath"
                  L12_2 = L12_2(L13_2, L14_2)
                  if L12_2 ~= nil then
                    L13_2 = string
                    L13_2 = L13_2.len
                    L14_2 = L12_2
                    L13_2 = L13_2(L14_2)
                    if 80 < L13_2 then
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
                      L13_2 = Infrastructure_SplitThreatPath
                      L14_2 = L12_2
                      L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
                      if L16_2 ~= nil and L16_2 == "exe" and L15_2 ~= nil then
                        L17_2 = string
                        L17_2 = L17_2.len
                        L18_2 = L15_2
                        L17_2 = L17_2(L18_2)
                        if L17_2 == 36 and L14_2 ~= nil then
                          L17_2 = string
                          L17_2 = L17_2.len
                          L18_2 = L14_2
                          L17_2 = L17_2(L18_2)
                          if L17_2 == 32 then
                            L17_2 = string
                            L17_2 = L17_2.match
                            L18_2 = L15_2
                            L19_2 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.exe"
                            L17_2 = L17_2(L18_2, L19_2)
                            if L17_2 then
                              L17_2 = string
                              L17_2 = L17_2.match
                              L18_2 = L14_2
                              L19_2 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x"
                              L17_2 = L17_2(L18_2, L19_2)
                              if L17_2 and L13_2 ~= nil then
                                L17_2 = string
                                L17_2 = L17_2.len
                                L18_2 = L13_2
                                L17_2 = L17_2(L18_2)
                                if 16 < L17_2 then
                                  L17_2 = string
                                  L17_2 = L17_2.sub
                                  L18_2 = string
                                  L18_2 = L18_2.lower
                                  L19_2 = L13_2
                                  L18_2 = L18_2(L19_2)
                                  L19_2 = 2
                                  L20_2 = 16
                                  L17_2 = L17_2(L18_2, L19_2, L20_2)
                                  if L17_2 == ":\\program files" then
                                    L17_2 = sysio
                                    L17_2 = L17_2.StopService
                                    L18_2 = L7_2
                                    L17_2(L18_2)
                                    L17_2 = sysio
                                    L17_2 = L17_2.DeleteService
                                    L18_2 = L7_2
                                    L17_2(L18_2)
                                    L17_2 = sysio
                                    L17_2 = L17_2.DeleteRegKey
                                    L18_2 = L9_2
                                    L19_2 = nil
                                    L17_2(L18_2, L19_2)
                                    L17_2 = L1_1
                                    L18_2 = L13_2
                                    L17_2(L18_2)
                                    L17_2 = true
                                    return L17_2
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
            end
          end
        end
      end
    end
  end
  L2_2 = nil
  return L2_2
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
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
              if L11_2 == "Social2Search" and L10_2 ~= nil then
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
                      L12_2 = sysio
                      L12_2 = L12_2.DeleteFile
                      L13_2 = L10_2
                      L12_2(L13_2)
                    end
                    L12_2 = sysio
                    L12_2 = L12_2.DeleteRegKey
                    L13_2 = L9_2
                    L14_2 = nil
                    L12_2(L13_2, L14_2)
                    L12_2 = true
                    return L12_2
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

L4_1 = Remediation
L4_1 = L4_1.Threat
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1.Name
L7_1 = "BrowserModifier:Win32/Soctuseer"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = ipairs
  L6_1 = L4_1.Resources
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.Schema
    if L10_1 == "file" then
      L10_1 = Infrastructure_SplitThreatPath
      L11_1 = L9_1.Path
      L10_1, L11_1, L12_1, L13_1 = L10_1(L11_1)
      L14_1 = string
      L14_1 = L14_1.find
      L15_1 = L10_1
      L16_1 = "system32\\drivers"
      L17_1 = 1
      L18_1 = true
      L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
      if L14_1 and L13_1 == "sys" then
        L14_1 = string
        L14_1 = L14_1.len
        L15_1 = L12_1
        L14_1 = L14_1(L15_1)
        if L14_1 == 36 then
          L14_1 = string
          L14_1 = L14_1.match
          L15_1 = L12_1
          L16_1 = "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.sys"
          L14_1 = L14_1(L15_1, L16_1)
          if L14_1 then
            L14_1 = L0_1
            L15_1 = L10_1
            L16_1 = L12_1
            L14_1(L15_1, L16_1)
            break
          end
        end
      end
    end
  end
  L5_1 = L2_1
  L5_1()
  L5_1 = L3_1
  L6_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  L5_1(L6_1)
  L5_1 = L3_1
  L6_1 = "HKLM\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  L5_1(L6_1)
end
