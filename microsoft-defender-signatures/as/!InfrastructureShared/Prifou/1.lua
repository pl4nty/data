local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1

function L0_1(A0_2)
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
    L5_2 = 805306487
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
    L6_2 = 805306487
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
          if L8_2 == A0_2 then
            L9_2 = MpDetection
            L9_2 = L9_2.ReportResource
            L10_2 = "regkey"
            L11_2 = L6_2
            L12_2 = 805306487
            L13_2 = false
            L9_2(L10_2, L11_2, L12_2, L13_2)
            L9_2 = MpDetection
            L9_2 = L9_2.ReportResource
            L10_2 = "regkey"
            L11_2 = L3_2
            L12_2 = 805306487
            L13_2 = false
            L9_2(L10_2, L11_2, L12_2, L13_2)
          end
        end
      end
    end
  end
end

function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = sysio
    L3_2 = L3_2.GetRegValueAsString
    L4_2 = L2_2
    L5_2 = "TaskName"
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = sysio
    L4_2 = L4_2.GetRegValueAsString
    L5_2 = L2_2
    L6_2 = "dll-file-name"
    L4_2 = L4_2(L5_2, L6_2)
    if L3_2 ~= nil and L4_2 ~= nil then
      L5_2 = sysio
      L5_2 = L5_2.GetRegValueAsString
      L6_2 = L2_2
      L7_2 = "InstallDir"
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = string
      L7_2 = L7_2.lower
      L8_2 = L5_2
      L7_2 = L7_2(L8_2)
      L8_2 = "\\appdata\\local\\"
      L9_2 = 1
      L10_2 = true
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 then
        L6_2 = sysio
        L6_2 = L6_2.GetRegValueAsString
        L7_2 = L2_2
        L8_2 = "Version"
        L6_2 = L6_2(L7_2, L8_2)
        L7_2 = sysio
        L7_2 = L7_2.GetRegValueAsString
        L8_2 = L2_2
        L9_2 = "Instgrp"
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = string
        L8_2 = L8_2.sub
        L9_2 = L7_2
        L10_2 = 1
        L11_2 = 2
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        if L8_2 == "PF" and L6_2 == L7_2 then
          L9_2 = string
          L9_2 = L9_2.sub
          L10_2 = A1_2
          L11_2 = 2
          L12_2 = -2
          L9_2 = L9_2(L10_2, L11_2, L12_2)
          A1_2 = L9_2
          L9_2 = sysio
          L9_2 = L9_2.GetRegValueAsString
          L10_2 = L2_2
          L11_2 = "InstallId"
          L9_2 = L9_2(L10_2, L11_2)
          if A1_2 == L9_2 then
            L10_2 = sysio
            L10_2 = L10_2.IsFolderExists
            L11_2 = L5_2
            L10_2 = L10_2(L11_2)
            if L10_2 then
              L10_2 = MpDetection
              L10_2 = L10_2.ReportResource
              L11_2 = "regkey"
              L12_2 = A0_2
              L13_2 = 805306487
              L14_2 = false
              L10_2(L11_2, L12_2, L13_2, L14_2)
              L10_2 = sysio
              L10_2 = L10_2.FindFiles
              L11_2 = L5_2
              L12_2 = "*.*"
              L13_2 = 0
              L10_2 = L10_2(L11_2, L12_2, L13_2)
              L11_2 = pairs
              L12_2 = L10_2
              L11_2, L12_2, L13_2 = L11_2(L12_2)
              for L14_2, L15_2 in L11_2, L12_2, L13_2 do
                L16_2 = MpDetection
                L16_2 = L16_2.ReportResource
                L17_2 = "file"
                L18_2 = L15_2
                L19_2 = 805306487
                L20_2 = false
                L16_2(L17_2, L18_2, L19_2, L20_2)
              end
              L11_2 = MpDetection
              L11_2 = L11_2.ReportResource
              L12_2 = "folder"
              L13_2 = L5_2
              L14_2 = 805306487
              L15_2 = false
              L11_2(L12_2, L13_2, L14_2, L15_2)
              L11_2 = L0_1
              L12_2 = L3_2
              L11_2(L12_2)
              L11_2 = true
              return L11_2
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = sysio
  L1_2 = L1_2.GetFileSize
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if 50 < L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = sysio
  L3_2 = L3_2.ReadFile
  L4_2 = A0_2
  L5_2 = 0
  L6_2 = 9
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  if L2_2 == "software\\" then
    L2_2 = sysio
    L2_2 = L2_2.ReadFile
    L3_2 = A0_2
    L4_2 = 0
    L5_2 = L1_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = string
    L3_2 = L3_2.sub
    L4_2 = L2_2
    L5_2 = 10
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = string
    L4_2 = L4_2.len
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 == 34 then
      L4_2 = string
      L4_2 = L4_2.match
      L5_2 = L3_2
      L6_2 = "{%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x}"
      L4_2 = L4_2(L5_2, L6_2)
      if L4_2 then
        L4_2 = sysio
        L4_2 = L4_2.RegExpandUserKey
        L5_2 = "HKCU"
        L6_2 = "\\"
        L7_2 = L2_2
        L5_2 = L5_2 .. L6_2 .. L7_2
        L4_2 = L4_2(L5_2)
        if L4_2 then
          L5_2 = pairs
          L6_2 = L4_2
          L5_2, L6_2, L7_2 = L5_2(L6_2)
          for L8_2, L9_2 in L5_2, L6_2, L7_2 do
            L10_2 = L1_1
            L11_2 = L9_2
            L12_2 = L3_2
            L10_2 = L10_2(L11_2, L12_2)
            if L10_2 then
              L10_2 = true
              return L10_2
            end
          end
        end
      end
    end
  end
  L2_2 = false
  return L2_2
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = pairs
  L2_2 = A0_2.Resources
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.Schema
    if L6_2 == "file" then
      L6_2 = Infrastructure_SplitThreatPath
      L7_2 = L5_2.Path
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      L10_2 = string
      L10_2 = L10_2.sub
      L11_2 = L6_2
      L12_2 = 1
      L13_2 = 4
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      if L10_2 == "\\\\?\\" then
        L10_2 = string
        L10_2 = L10_2.sub
        L11_2 = L6_2
        L12_2 = 5
        L10_2 = L10_2(L11_2, L12_2)
        L6_2 = L10_2
      end
      L10_2 = string
      L10_2 = L10_2.sub
      L11_2 = L6_2
      L12_2 = -1
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 == "\\" then
        L10_2 = string
        L10_2 = L10_2.sub
        L11_2 = L6_2
        L12_2 = 1
        L13_2 = -2
        L10_2 = L10_2(L11_2, L12_2, L13_2)
        L6_2 = L10_2
      end
      L10_2 = string
      L10_2 = L10_2.find
      L11_2 = string
      L11_2 = L11_2.lower
      L12_2 = L6_2
      L11_2 = L11_2(L12_2)
      L12_2 = "\\appdata\\local\\"
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 and (L9_2 == "exe" or L9_2 == "dll") then
        L10_2 = L6_2
        L11_2 = "\\rkey.dat"
        L10_2 = L10_2 .. L11_2
        L11_2 = sysio
        L11_2 = L11_2.IsFileExists
        L12_2 = L10_2
        L11_2 = L11_2(L12_2)
        if L11_2 then
          L11_2 = L2_1
          L12_2 = L10_2
          return L11_2(L12_2)
        end
        L11_2 = sysio
        L11_2 = L11_2.FindFiles
        L12_2 = L6_2
        L13_2 = "*.txt"
        L14_2 = 0
        L11_2 = L11_2(L12_2, L13_2, L14_2)
        L12_2 = pairs
        L13_2 = L11_2
        L12_2, L13_2, L14_2 = L12_2(L13_2)
        for L15_2, L16_2 in L12_2, L13_2, L14_2 do
          L17_2 = L2_1
          L18_2 = L16_2
          return L17_2(L18_2)
        end
      end
    end
  end
  L1_2 = false
  return L1_2
end

function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = sysio
  L0_2 = L0_2.RegExpandUserKey
  L1_2 = "HKCU\\Software"
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
        L7_2 = L7_2.RegEnumKeys
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L8_2 = pairs
          L9_2 = L7_2
          L8_2, L9_2, L10_2 = L8_2(L9_2)
          for L11_2, L12_2 in L8_2, L9_2, L10_2 do
            L13_2 = string
            L13_2 = L13_2.len
            L14_2 = L12_2
            L13_2 = L13_2(L14_2)
            if L13_2 == 34 then
              L13_2 = string
              L13_2 = L13_2.match
              L14_2 = L12_2
              L15_2 = "{%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x}"
              L13_2 = L13_2(L14_2, L15_2)
              if L13_2 then
                L13_2 = L1_1
                L14_2 = L5_2
                L15_2 = "\\"
                L16_2 = L12_2
                L14_2 = L14_2 .. L15_2 .. L16_2
                L15_2 = L12_2
                L13_2 = L13_2(L14_2, L15_2)
                if L13_2 then
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
  L1_2 = false
  return L1_2
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L1_2 = pairs
  L2_2 = A0_2.Resources
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.Schema
    if L6_2 == "file" then
      L6_2 = crypto
      L6_2 = L6_2.bitand
      L7_2 = L5_2.Type
      L8_2 = MpCommon
      L8_2 = L8_2.MPRESOURCE_TYPE_CONCRETE
      L6_2 = L6_2(L7_2, L8_2)
      L7_2 = MpCommon
      L7_2 = L7_2.MPRESOURCE_TYPE_CONCRETE
      if L6_2 == L7_2 then
        L6_2 = Infrastructure_SplitThreatPath
        L7_2 = L5_2.Path
        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
        L10_2 = string
        L10_2 = L10_2.len
        L11_2 = L7_2
        L10_2 = L10_2(L11_2)
        if L10_2 == 38 then
          L10_2 = string
          L10_2 = L10_2.match
          L11_2 = L7_2
          L12_2 = "{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}"
          L10_2 = L10_2(L11_2, L12_2)
          if L10_2 then
            L10_2 = string
            L10_2 = L10_2.lower
            L11_2 = L6_2
            L10_2 = L10_2(L11_2)
            L6_2 = L10_2
            L10_2 = string
            L10_2 = L10_2.sub
            L11_2 = L6_2
            L12_2 = 1
            L13_2 = 4
            L10_2 = L10_2(L11_2, L12_2, L13_2)
            if L10_2 == "\\\\?\\" then
              L10_2 = string
              L10_2 = L10_2.sub
              L11_2 = L6_2
              L12_2 = 5
              L10_2 = L10_2(L11_2, L12_2)
              L6_2 = L10_2
            end
            L10_2 = string
            L10_2 = L10_2.sub
            L11_2 = L6_2
            L12_2 = -1
            L10_2 = L10_2(L11_2, L12_2)
            if L10_2 == "\\" then
              L10_2 = string
              L10_2 = L10_2.sub
              L11_2 = L6_2
              L12_2 = 1
              L13_2 = -2
              L10_2 = L10_2(L11_2, L12_2, L13_2)
              L6_2 = L10_2
            end
            L10_2 = string
            L10_2 = L10_2.find
            L11_2 = L6_2
            L12_2 = "\\appdata\\local\\"
            L13_2 = 1
            L14_2 = true
            L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
            if not L10_2 then
              L10_2 = string
              L10_2 = L10_2.find
              L11_2 = L6_2
              L12_2 = "\\appdata\\roaming\\"
              L13_2 = 1
              L14_2 = true
              L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
            end
            if L10_2 and L9_2 == "exe" then
              L10_2 = 0
              L11_2 = {}
              L12_2 = "TTL.DAT"
              L13_2 = "STTL.DAT"
              L14_2 = "info.dat"
              L15_2 = "config.dat"
              L11_2[1] = L12_2
              L11_2[2] = L13_2
              L11_2[3] = L14_2
              L11_2[4] = L15_2
              L12_2 = pairs
              L13_2 = L11_2
              L12_2, L13_2, L14_2 = L12_2(L13_2)
              for L15_2, L16_2 in L12_2, L13_2, L14_2 do
                L17_2 = sysio
                L17_2 = L17_2.IsFileExists
                L18_2 = L6_2
                L19_2 = "\\"
                L20_2 = L16_2
                L18_2 = L18_2 .. L19_2 .. L20_2
                L17_2 = L17_2(L18_2)
                if L17_2 then
                  L10_2 = L10_2 + 1
                  if L10_2 == 2 then
                    L17_2 = sysio
                    L17_2 = L17_2.FindFiles
                    L18_2 = L6_2
                    L19_2 = "*.*"
                    L20_2 = 0
                    L17_2 = L17_2(L18_2, L19_2, L20_2)
                    L18_2 = pairs
                    L19_2 = L17_2
                    L18_2, L19_2, L20_2 = L18_2(L19_2)
                    for L21_2, L22_2 in L18_2, L19_2, L20_2 do
                      L23_2 = MpDetection
                      L23_2 = L23_2.ReportResource
                      L24_2 = "file"
                      L25_2 = L22_2
                      L26_2 = 805306487
                      L27_2 = false
                      L23_2(L24_2, L25_2, L26_2, L27_2)
                    end
                    L18_2 = MpDetection
                    L18_2 = L18_2.ReportResource
                    L19_2 = "folder"
                    L20_2 = L6_2
                    L21_2 = 805306487
                    L22_2 = false
                    L18_2(L19_2, L20_2, L21_2, L22_2)
                    L18_2 = L0_1
                    L19_2 = L7_2
                    L18_2(L19_2)
                    L18_2 = true
                    return L18_2
                  end
                end
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

L6_1 = MpDetection
L6_1 = L6_1.GetCurrentThreat
L6_1 = L6_1()
L7_1 = string
L7_1 = L7_1.find
L8_1 = L6_1.Name
L9_1 = "BrowserModifier:Win32/Prifou"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = L3_1
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = L4_1
    L7_1()
  end
  L7_1 = L5_1
  L8_1 = L6_1
  L7_1(L8_1)
end
