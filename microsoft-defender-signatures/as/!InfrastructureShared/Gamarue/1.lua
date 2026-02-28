local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = string
  L1_2 = L1_2.find
  L3_2 = A0_2
  L2_2 = A0_2.reverse
  L2_2 = L2_2(L3_2)
  L3_2 = "\\"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 == nil then
    L2_2 = false
    L3_2 = nil
    return L2_2, L3_2
  end
  L2_2 = #A0_2
  L2_2 = L2_2 - L1_2
  L4_2 = A0_2
  L3_2 = A0_2.sub
  L5_2 = L2_2 + 2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = {}
  L4_2[".exe"] = ""
  L4_2[".cmd"] = ""
  L4_2[".bat"] = ""
  L4_2[".com"] = ""
  L4_2[".pif"] = ""
  L4_2[".scr"] = ""
  L5_2 = {}
  L5_2.ms = ""
  L5_2.dx = ""
  L5_2.cc = ""
  L7_2 = L3_2
  L6_2 = L3_2.sub
  L8_2 = 1
  L9_2 = 2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L6_2 = L5_2[L6_2]
  if L6_2 then
    L7_2 = L3_2
    L6_2 = L3_2.sub
    L8_2 = -4
    L6_2 = L6_2(L7_2, L8_2)
    L6_2 = L4_2[L6_2]
    if L6_2 then
      L6_2 = true
      L7_2 = L3_2
      return L6_2, L7_2
    end
  end
  L6_2 = false
  L7_2 = nil
  return L6_2, L7_2
end

isgamformat = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 then
    L2_2 = sysio
    L2_2 = L2_2.RegEnumValues
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = pairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      if L7_2 ~= nil then
        if A1_2 == true then
          L9_2 = L7_2
          L8_2 = L7_2.find
          L10_2 = "^%d%d%d%d+$"
          L11_2 = 1
          L12_2 = false
          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
          if L8_2 then
            goto lbl_31
          end
        end
        if A1_2 == false then
          L9_2 = L7_2
          L8_2 = L7_2.find
          L10_2 = "Load"
          L11_2 = 1
          L12_2 = true
          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
          ::lbl_31::
          if L8_2 then
            L8_2 = sysio
            L8_2 = L8_2.GetRegValueAsString
            L9_2 = A0_2
            L10_2 = L7_2
            L8_2 = L8_2(L9_2, L10_2)
            if L8_2 ~= nil and L8_2 ~= "" then
              L9_2 = isgamformat
              L10_2 = L8_2
              L9_2, L10_2 = L9_2(L10_2)
              if L9_2 == true and L10_2 ~= nil then
                if A1_2 == true then
                  L11_2 = sysio
                  L11_2 = L11_2.DeleteRegValue
                  L12_2 = A0_2
                  L13_2 = L7_2
                  L11_2(L12_2, L13_2)
                else
                  L11_2 = sysio
                  L11_2 = L11_2.SetRegValueAsString
                  L12_2 = A0_2
                  L13_2 = "Load"
                  L14_2 = ""
                  L11_2(L12_2, L13_2, L14_2)
                end
                L11_2 = MpCommon
                L11_2 = L11_2.ExpandEnvironmentVariables
                L12_2 = "%allusersprofile%"
                L11_2 = L11_2(L12_2)
                L12_2 = "\\"
                L13_2 = L10_2
                L11_2 = L11_2 .. L12_2 .. L13_2
                L12_2 = sysio
                L12_2 = L12_2.IsFileExists
                L13_2 = L11_2
                L12_2 = L12_2(L13_2)
                if L12_2 then
                  L12_2 = MpCommon
                  L12_2 = L12_2.ReportLowfi
                  L13_2 = L11_2
                  L14_2 = 2852551133
                  L12_2(L13_2, L14_2)
                  L12_2 = Remediation
                  L12_2 = L12_2.BtrDeleteFile
                  L13_2 = L11_2
                  L12_2(L13_2)
                end
                L12_2 = MpCommon
                L12_2 = L12_2.ExpandEnvironmentVariables
                L13_2 = "%allusersprofile%"
                L12_2 = L12_2(L13_2)
                L13_2 = "\\Local Settings\\Temp\\"
                L14_2 = L10_2
                L11_2 = L12_2 .. L13_2 .. L14_2
                L12_2 = sysio
                L12_2 = L12_2.IsFileExists
                L13_2 = L11_2
                L12_2 = L12_2(L13_2)
                if L12_2 then
                  L12_2 = MpCommon
                  L12_2 = L12_2.ReportLowfi
                  L13_2 = L11_2
                  L14_2 = 2852551133
                  L12_2(L13_2, L14_2)
                  L12_2 = Remediation
                  L12_2 = L12_2.BtrDeleteFile
                  L13_2 = L11_2
                  L12_2(L13_2)
                end
                L12_2 = Infrastructure_GetEnvironmentPath
                L13_2 = "%appdata%"
                L12_2 = L12_2(L13_2)
                L13_2 = "\\"
                L14_2 = L10_2
                L11_2 = L12_2 .. L13_2 .. L14_2
                L12_2 = sysio
                L12_2 = L12_2.IsFileExists
                L13_2 = L11_2
                L12_2 = L12_2(L13_2)
                if L12_2 then
                  L12_2 = MpCommon
                  L12_2 = L12_2.ReportLowfi
                  L13_2 = L11_2
                  L14_2 = 2852551133
                  L12_2(L13_2, L14_2)
                  L12_2 = Remediation
                  L12_2 = L12_2.BtrDeleteFile
                  L13_2 = L11_2
                  L12_2(L13_2)
                end
                L12_2 = Infrastructure_GetEnvironmentPath
                L13_2 = "%userprofile%"
                L12_2 = L12_2(L13_2)
                L13_2 = "\\AppData\\Local\\Temp\\"
                L14_2 = L10_2
                L11_2 = L12_2 .. L13_2 .. L14_2
                L12_2 = sysio
                L12_2 = L12_2.IsFileExists
                L13_2 = L11_2
                L12_2 = L12_2(L13_2)
                if L12_2 then
                  L12_2 = MpCommon
                  L12_2 = L12_2.ReportLowfi
                  L13_2 = L11_2
                  L14_2 = 2852551133
                  L12_2(L13_2, L14_2)
                  L12_2 = Remediation
                  L12_2 = L12_2.BtrDeleteFile
                  L13_2 = L11_2
                  L12_2(L13_2)
                end
              end
            end
          end
        end
      end
    end
  end
end

remgam = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = sysio
  L0_2 = L0_2.RegExpandUserKey
  L1_2 = "HKCU\\Keyboard Layout"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = pairs
    L2_2 = L0_2
    L1_2, L2_2, L3_2 = L1_2(L2_2)
    for L4_2, L5_2 in L1_2, L2_2, L3_2 do
      L6_2 = sysio
      L6_2 = L6_2.RegOpenKey
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L7_2 = sysio
        L7_2 = L7_2.DeleteRegValue
        L8_2 = L6_2
        L9_2 = "1"
        L7_2(L8_2, L9_2)
        L7_2 = sysio
        L7_2 = L7_2.DeleteRegValue
        L8_2 = L6_2
        L9_2 = "2"
        L7_2(L8_2, L9_2)
      end
    end
  end
end

remplugin_added_registry = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 then
    L1_2 = sysio
    L1_2 = L1_2.RegEnumValues
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = pairs
    L3_2 = L1_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      if L6_2 ~= nil then
        L8_2 = L6_2
        L7_2 = L6_2.find
        L9_2 = "^%d%d%d%d+$"
        L10_2 = 1
        L11_2 = false
        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
        if L7_2 then
          L7_2 = sysio
          L7_2 = L7_2.GetRegValueAsString
          L8_2 = A0_2
          L9_2 = L6_2
          L7_2 = L7_2(L8_2, L9_2)
          if L7_2 ~= nil and L7_2 ~= "" then
            L8_2 = sysio
            L8_2 = L8_2.DeleteRegValue
            L9_2 = A0_2
            L10_2 = L6_2
            L8_2(L9_2, L10_2)
          end
        end
      end
    end
  end
end

remplug = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = sysio
  L0_2 = L0_2.RegOpenKey
  L1_2 = "HKLM\\Software\\Microsoft\\Windows"
  L0_2 = L0_2(L1_2)
  L1_2 = remplug
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = sysio
  L1_2 = L1_2.RegExpandUserKey
  L2_2 = "HKCU\\Software\\Microsoft\\Windows"
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = pairs
    L3_2 = L1_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = sysio
      L7_2 = L7_2.RegOpenKey
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L8_2 = remplug
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
end

remplugin_registry = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2
  L1_2 = A0_2.find
  L3_2 = "\\%w%.lnk$"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    return
  end
  L1_2 = sysio
  L1_2 = L1_2.GetFileSize
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if 1024 < L1_2 or L1_2 < 500 then
    return
  end
  L2_2 = sysio
  L2_2 = L2_2.ReadFileRaw
  L3_2 = A0_2
  L4_2 = 0
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = string
  L3_2 = L3_2.gsub
  L4_2 = L2_2
  L5_2 = "%z"
  L6_2 = ""
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 == nil then
    return
  end
  L5_2 = L3_2
  L4_2 = L3_2.match
  L6_2 = "\\AppData\\Roaming\\(ii%w+%.exe)"
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 == nil then
    L6_2 = L3_2
    L5_2 = L3_2.match
    L7_2 = "\\AppData\\Roaming\\(ob%w+%.exe)"
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2
  end
  if L4_2 ~= nil then
    L6_2 = A0_2
    L5_2 = A0_2.match
    L7_2 = "^(%w:\\Users\\[^\\]+)\\"
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 ~= nil then
      L6_2 = L5_2
      L7_2 = "\\AppData\\Roaming\\"
      L8_2 = L4_2
      L6_2 = L6_2 .. L7_2 .. L8_2
      L7_2 = sysio
      L7_2 = L7_2.IsFileExists
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = MpCommon
        L7_2 = L7_2.ReportLowfi
        L8_2 = L6_2
        L9_2 = 2852551133
        L7_2(L8_2, L9_2)
        L7_2 = Remediation
        L7_2 = L7_2.BtrDeleteFile
        L8_2 = L6_2
        L7_2(L8_2)
      end
      L7_2 = sysio
      L7_2 = L7_2.IsFileExists
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = MpCommon
        L7_2 = L7_2.ReportLowfi
        L8_2 = A0_2
        L9_2 = 2852551133
        L7_2(L8_2, L9_2)
        L7_2 = Remediation
        L7_2 = L7_2.BtrDeleteFile
        L8_2 = A0_2
        L7_2(L8_2)
      end
    end
  end
end

RemoveGamarueLnk = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = sysio
  L1_2 = L1_2.RegExpandUserKey
  L2_2 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders"
  L1_2 = L1_2(L2_2)
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = sysio
    L7_2 = L7_2.RegOpenKey
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L8_2 = sysio
      L8_2 = L8_2.GetRegValueAsString
      L9_2 = L7_2
      L10_2 = "Startup"
      L8_2 = L8_2(L9_2, L10_2)
      L0_2 = L8_2
      if L0_2 ~= nil then
        L8_2 = sysio
        L8_2 = L8_2.IsFolderExists
        L9_2 = L0_2
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = sysio
          L8_2 = L8_2.FindFiles
          L9_2 = L0_2
          L10_2 = "*.lnk"
          L11_2 = 0
          L8_2 = L8_2(L9_2, L10_2, L11_2)
          L9_2 = pairs
          L10_2 = L8_2
          L9_2, L10_2, L11_2 = L9_2(L10_2)
          for L12_2, L13_2 in L9_2, L10_2, L11_2 do
            L14_2 = RemoveGamarueLnk
            L15_2 = L13_2
            L14_2(L15_2)
          end
        end
      end
    end
  end
end

RemoveStartupLnk = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = sysio
  L1_2 = L1_2.FindFiles
  L2_2 = A0_2
  L3_2 = "*.lnk"
  L4_2 = 0
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = false
  L3_2 = pairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.lower
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2
    L8_2 = L8_2.find
    L10_2 = "%(%d+gb%)%.lnk"
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 ~= nil then
      L8_2 = sysio
      L8_2 = L8_2.IsFileExists
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L2_2 = true
        L8_2 = MpCommon
        L8_2 = L8_2.ReportLowfi
        L9_2 = L7_2
        L10_2 = 2852551133
        L8_2(L9_2, L10_2)
        L8_2 = Remediation
        L8_2 = L8_2.BtrDeleteFile
        L9_2 = L7_2
        L8_2(L9_2)
      end
    end
  end
  L3_2 = A0_2
  L4_2 = "\194\160"
  L3_2 = L3_2 .. L4_2
  if L2_2 then
    L4_2 = sysio
    L4_2 = L4_2.IsFolderExists
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = sysio
      L4_2 = L4_2.FindFiles
      L5_2 = L3_2
      L6_2 = "*"
      L7_2 = 0
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = pairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = sysio
        L10_2 = L10_2.IsFileExists
        L11_2 = L9_2
        L10_2 = L10_2(L11_2)
        if L10_2 then
          L10_2 = MpCommon
          L10_2 = L10_2.ReportLowfi
          L11_2 = L9_2
          L12_2 = 2852551133
          L10_2(L11_2, L12_2)
          L10_2 = Remediation
          L10_2 = L10_2.BtrDeleteFile
          L11_2 = L9_2
          L10_2(L11_2)
        end
      end
      L5_2 = Remediation
      L5_2 = L5_2.BtrDeleteFile
      L6_2 = L3_2
      L5_2(L6_2)
    end
  end
end

RemoveFilesInRemDrives = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = Infrastructure_GetAvailableDrives
  L0_2, L1_2, L2_2, L3_2 = L0_2()
  L4_2 = #L1_2
  if 0 < L4_2 then
    L5_2 = pairs
    L6_2 = L1_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2, L9_2 in L5_2, L6_2, L7_2 do
      L10_2 = RemoveFilesInRemDrives
      L11_2 = L9_2
      L10_2(L11_2)
    end
  end
end

CleanRemovableDrives = L0_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Active
if L0_1 then
  L0_1 = sysio
  L0_1 = L0_1.RegOpenKey
  L1_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\Run"
  L0_1 = L0_1(L1_1)
  L1_1 = remgam
  L2_1 = L0_1
  L3_1 = true
  L1_1(L2_1, L3_1)
  L1_1 = sysio
  L1_1 = L1_1.RegExpandUserKey
  L2_1 = "HKCU\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Windows"
  L1_1 = L1_1(L2_1)
  L2_1 = pairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = sysio
    L7_1 = L7_1.RegOpenKey
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L8_1 = remgam
    L9_1 = L7_1
    L10_1 = false
    L8_1(L9_1, L10_1)
  end
  L2_1 = sysio
  L2_1 = L2_1.RegExpandUserKey
  L3_1 = "HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
  L2_1 = L2_1(L3_1)
  L3_1 = pairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = sysio
    L8_1 = L8_1.RegOpenKey
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    L9_1 = remgam
    L10_1 = L8_1
    L11_1 = true
    L9_1(L10_1, L11_1)
  end
  L3_1 = Infrastructure_EnableUAC
  L3_1()
  L3_1 = Infrastructure_EnableTaskbarNotification
  L3_1()
  L3_1 = Infrastructure_EnableActionCenterMessages
  L3_1()
  L3_1 = Infrastructure_EnableTaskManager
  L3_1()
  L3_1 = remplugin_registry
  L3_1()
  L3_1 = remplugin_added_registry
  L3_1()
  L3_1 = RemoveStartupLnk
  L3_1()
  L3_1 = CleanRemovableDrives
  L3_1()
end
