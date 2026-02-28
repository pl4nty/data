local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L1_1 = L0_1.Name
L2_1 = L1_1
L1_1 = L1_1.find
L3_1 = "^Worm:JS/Bondat%.?%L?$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = L0_1.Name
  L2_1 = L1_1
  L1_1 = L1_1.find
  L3_1 = "^Worm:JS/Bondat!plock$"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_119
  end
end
L1_1 = "\\appdata\\roaming"
L2_1 = pairs
L3_1 = L0_1.Resources
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.Schema
  if L7_1 == "file" then
    L7_1 = L6_1.Path
    L8_1 = L7_1
    L7_1 = L7_1.lower
    L7_1 = L7_1(L8_1)
    L8_1 = L7_1
    L7_1 = L7_1.match
    L9_1 = "(.+)\\(%w+)\\(%w+%.js)"
    L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
    if L7_1 ~= nil then
      L11_1 = L7_1
      L10_1 = L7_1.sub
      L12_1 = #L1_1
      L12_1 = -1 * L12_1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 == L1_1 then
        L10_1 = L7_1
        L11_1 = "\\"
        L12_1 = L8_1
        L10_1 = L10_1 .. L11_1 .. L12_1
        L11_1 = sysio
        L11_1 = L11_1.FindFiles
        L12_1 = L10_1
        L13_1 = "*.exe"
        L14_1 = 0
        L11_1 = L11_1(L12_1, L13_1, L14_1)
        L12_1 = MpCommon
        L12_1 = L12_1.ExpandEnvironmentVariables
        L13_1 = "%windir%"
        L12_1 = L12_1(L13_1)
        L13_1 = sysio
        L13_1 = L13_1.GetFileSize
        L14_1 = L12_1
        L15_1 = "\\system32\\wscript.exe"
        L14_1 = L14_1 .. L15_1
        L13_1 = L13_1(L14_1)
        L14_1 = sysio
        L14_1 = L14_1.ReadFile
        L15_1 = L12_1
        L16_1 = "\\system32\\wscript.exe"
        L15_1 = L15_1 .. L16_1
        L16_1 = 1
        L17_1 = 1024
        L14_1 = L14_1(L15_1, L16_1, L17_1)
        L15_1 = crypto
        L15_1 = L15_1.MD5Buffer
        L16_1 = L14_1
        L17_1 = 0
        L18_1 = 1024
        L15_1 = L15_1(L16_1, L17_1, L18_1)
        L16_1 = pairs
        L17_1 = L11_1
        L16_1, L17_1, L18_1 = L16_1(L17_1)
        for L19_1, L20_1 in L16_1, L17_1, L18_1 do
          L21_1 = sysio
          L21_1 = L21_1.GetFileSize
          L22_1 = L20_1
          L21_1 = L21_1(L22_1)
          if L21_1 == L13_1 then
            L21_1 = sysio
            L21_1 = L21_1.ReadFile
            L22_1 = L20_1
            L23_1 = 1
            L24_1 = 1024
            L21_1 = L21_1(L22_1, L23_1, L24_1)
            L22_1 = crypto
            L22_1 = L22_1.MD5Buffer
            L23_1 = L21_1
            L24_1 = 0
            L25_1 = 1024
            L22_1 = L22_1(L23_1, L24_1, L25_1)
            if L22_1 == L15_1 then
              L23_1 = sysio
              L23_1 = L23_1.GetProcessFromFileName
              L24_1 = L20_1
              L23_1 = L23_1(L24_1)
              L24_1 = pairs
              L25_1 = L23_1
              L24_1, L25_1, L26_1 = L24_1(L25_1)
              for L27_1, L28_1 in L24_1, L25_1, L26_1 do
                L29_1 = string
                L29_1 = L29_1.format
                L30_1 = "pid:%d,ProcessStart:%u"
                L31_1 = L28_1.pid
                L32_1 = L28_1.starttime
                L29_1 = L29_1(L30_1, L31_1, L32_1)
                L30_1 = sysio
                L30_1 = L30_1.TerminateProcess
                L31_1 = L29_1
                L30_1(L31_1)
              end
            end
          end
        end
      end
    end
  end
end
::lbl_119::
L1_1 = L0_1.Name
if L1_1 == "Worm:JS/Bondat!lnk" then
  L1_1 = pairs
  L2_1 = L0_1.Resources
  L1_1, L2_1, L3_1 = L1_1(L2_1)
  for L4_1, L5_1 in L1_1, L2_1, L3_1 do
    L6_1 = L5_1.Schema
    if L6_1 == "file" then
      L6_1 = L5_1.Path
      L7_1 = L6_1
      L6_1 = L6_1.match
      L8_1 = "([^\\]+)%.lnk%->%[CMDEmbedded%]$"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L7_1 = L5_1.Path
        L8_1 = L7_1
        L7_1 = L7_1.match
        L9_1 = "^\\\\%?\\(%w:\\)"
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 ~= nil then
          L8_1 = L7_1
          L9_1 = ".Trashes\\"
          L10_1 = L6_1
          L8_1 = L8_1 .. L9_1 .. L10_1
          L9_1 = L7_1
          L10_1 = "\\"
          L11_1 = L6_1
          L9_1 = L9_1 .. L10_1 .. L11_1
          L10_1 = sysio
          L10_1 = L10_1.IsFileExists
          L11_1 = L8_1
          L10_1 = L10_1(L11_1)
          if not L10_1 then
            L10_1 = sysio
            L10_1 = L10_1.IsFolderExists
            L11_1 = L8_1
            L10_1 = L10_1(L11_1)
            if not L10_1 then
              goto lbl_183
            end
          end
          L10_1 = sysio
          L10_1 = L10_1.IsFileExists
          L11_1 = L9_1
          L10_1 = L10_1(L11_1)
          if L10_1 then
            L10_1 = sysio
            L10_1 = L10_1.IsFolderExists
            L11_1 = L9_1
            L10_1 = L10_1(L11_1)
            if L10_1 then
              goto lbl_183
            end
          end
          L10_1 = sysio
          L10_1 = L10_1.MoveFile
          L11_1 = L8_1
          L12_1 = L9_1
          L10_1(L11_1, L12_1)
          L10_1 = sysio
          L10_1 = L10_1.SetFileAttributes
          L11_1 = L9_1
          L12_1 = 32
          L10_1(L11_1, L12_1)
        end
      end
    end
    ::lbl_183::
  end
end
