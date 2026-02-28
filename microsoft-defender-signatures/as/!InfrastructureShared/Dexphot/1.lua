local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks"
L1_1 = sysio
L1_1 = L1_1.RegOpenKey
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = false
if L1_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegEnumKeys
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = ipairs
    L5_1 = L3_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = sysio
      L9_1 = L9_1.RegOpenKey
      L10_1 = L0_1
      L11_1 = "\\"
      L12_1 = L8_1
      L10_1 = L10_1 .. L11_1 .. L12_1
      L9_1 = L9_1(L10_1)
      if L9_1 then
        L10_1 = sysio
        L10_1 = L10_1.GetRegValueAsString
        L11_1 = L9_1
        L12_1 = "Path"
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 ~= nil then
          L11_1 = sysio
          L11_1 = L11_1.GetRegValueAsBinary
          L12_1 = L9_1
          L13_1 = "Actions"
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 ~= nil then
            L12_1 = string
            L12_1 = L12_1.lower
            L13_1 = L11_1
            L12_1 = L12_1(L13_1)
            L11_1 = L12_1
            L13_1 = L11_1
            L12_1 = L11_1.find
            L14_1 = "h\000t\000t\000p\000"
            L15_1 = 1
            L16_1 = true
            L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
            if L12_1 then
              L13_1 = L11_1
              L12_1 = L11_1.find
              L14_1 = "[-/]\000p\000a\000c\000k\000a\000g\000e\000 \000"
              L12_1 = L12_1(L13_1, L14_1)
              if not L12_1 then
                L13_1 = L11_1
                L12_1 = L11_1.find
                L14_1 = "[-/]\000i\000 \000"
                L12_1 = L12_1(L13_1, L14_1)
                if not L12_1 then
                  goto lbl_74
                end
                L13_1 = L11_1
                L12_1 = L11_1.find
                L14_1 = "[-/]\000q\000 \000"
                L12_1 = L12_1(L13_1, L14_1)
                if not L12_1 then
                  goto lbl_74
                end
              end
              L12_1 = Infrastructure_ReportScheduleTaskByTaskId
              L13_1 = L8_1
              L14_1 = 805306677
              L12_1(L13_1, L14_1)
              L2_1 = true
            end
          end
        end
      end
      ::lbl_74::
    end
  end
end
L3_1 = MpCommon
L3_1 = L3_1.ExpandEnvironmentVariables
L4_1 = "%windir%"
L3_1 = L3_1(L4_1)
L4_1 = L3_1
L5_1 = "\\system32\\"
L4_1 = L4_1 .. L5_1
L5_1 = L3_1
L6_1 = "\\syswow64\\"
L5_1 = L5_1 .. L6_1
if L2_1 == true then
  L6_1 = sysio
  L6_1 = L6_1.GetProcessFromFileName
  L7_1 = L4_1
  L8_1 = "svchost.exe"
  L7_1 = L7_1 .. L8_1
  L6_1 = L6_1(L7_1)
  L7_1 = pairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = string
    L12_1 = L12_1.format
    L13_1 = "pid:%d"
    L14_1 = L11_1.pid
    L12_1 = L12_1(L13_1, L14_1)
    L13_1 = MpDetection
    L13_1 = L13_1.ScanResource
    L14_1 = "ems://"
    L15_1 = L12_1
    L14_1 = L14_1 .. L15_1
    L13_1(L14_1)
  end
  L7_1 = sysio
  L7_1 = L7_1.GetProcessFromFileName
  L8_1 = L5_1
  L9_1 = "svchost.exe"
  L8_1 = L8_1 .. L9_1
  L7_1 = L7_1(L8_1)
  L8_1 = pairs
  L9_1 = L7_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "pid:%d"
    L15_1 = L12_1.pid
    L13_1 = L13_1(L14_1, L15_1)
    L14_1 = MpDetection
    L14_1 = L14_1.ScanResource
    L15_1 = "ems://"
    L16_1 = L13_1
    L15_1 = L15_1 .. L16_1
    L14_1(L15_1)
  end
end
L6_1 = sysio
L6_1 = L6_1.GetProcessFromFileName
L7_1 = L4_1
L8_1 = "tracert.exe"
L7_1 = L7_1 .. L8_1
L6_1 = L6_1(L7_1)
L7_1 = pairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = string
  L12_1 = L12_1.format
  L13_1 = "pid:%d"
  L14_1 = L11_1.pid
  L12_1 = L12_1(L13_1, L14_1)
  L13_1 = MpDetection
  L13_1 = L13_1.ScanResource
  L14_1 = "ems://"
  L15_1 = L12_1
  L14_1 = L14_1 .. L15_1
  L13_1(L14_1)
end
L7_1 = sysio
L7_1 = L7_1.GetProcessFromFileName
L8_1 = L5_1
L9_1 = "tracert.exe"
L8_1 = L8_1 .. L9_1
L7_1 = L7_1(L8_1)
L8_1 = pairs
L9_1 = L7_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = string
  L13_1 = L13_1.format
  L14_1 = "pid:%d"
  L15_1 = L12_1.pid
  L13_1 = L13_1(L14_1, L15_1)
  L14_1 = MpDetection
  L14_1 = L14_1.ScanResource
  L15_1 = "ems://"
  L16_1 = L13_1
  L15_1 = L15_1 .. L16_1
  L14_1(L15_1)
end
L8_1 = sysio
L8_1 = L8_1.GetProcessFromFileName
L9_1 = L4_1
L10_1 = "nslookup.exe"
L9_1 = L9_1 .. L10_1
L8_1 = L8_1(L9_1)
L9_1 = pairs
L10_1 = L8_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = string
  L14_1 = L14_1.format
  L15_1 = "pid:%d"
  L16_1 = L13_1.pid
  L14_1 = L14_1(L15_1, L16_1)
  L15_1 = MpDetection
  L15_1 = L15_1.ScanResource
  L16_1 = "ems://"
  L17_1 = L14_1
  L16_1 = L16_1 .. L17_1
  L15_1(L16_1)
end
L9_1 = sysio
L9_1 = L9_1.GetProcessFromFileName
L10_1 = L5_1
L11_1 = "nslookup.exe"
L10_1 = L10_1 .. L11_1
L9_1 = L9_1(L10_1)
L10_1 = pairs
L11_1 = L9_1
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  L15_1 = string
  L15_1 = L15_1.format
  L16_1 = "pid:%d"
  L17_1 = L14_1.pid
  L15_1 = L15_1(L16_1, L17_1)
  L16_1 = MpDetection
  L16_1 = L16_1.ScanResource
  L17_1 = "ems://"
  L18_1 = L15_1
  L17_1 = L17_1 .. L18_1
  L16_1(L17_1)
end
L10_1 = sysio
L10_1 = L10_1.GetProcessFromFileName
L11_1 = L4_1
L12_1 = "installshield\\x32\\setup.exe"
L11_1 = L11_1 .. L12_1
L10_1 = L10_1(L11_1)
L11_1 = pairs
L12_1 = L10_1
L11_1, L12_1, L13_1 = L11_1(L12_1)
for L14_1, L15_1 in L11_1, L12_1, L13_1 do
  L16_1 = string
  L16_1 = L16_1.format
  L17_1 = "pid:%d"
  L18_1 = L15_1.pid
  L16_1 = L16_1(L17_1, L18_1)
  L17_1 = MpDetection
  L17_1 = L17_1.ScanResource
  L18_1 = "ems://"
  L19_1 = L16_1
  L18_1 = L18_1 .. L19_1
  L17_1(L18_1)
end
L11_1 = sysio
L11_1 = L11_1.GetProcessFromFileName
L12_1 = L5_1
L13_1 = "installshield\\x32\\setup.exe"
L12_1 = L12_1 .. L13_1
L11_1 = L11_1(L12_1)
L12_1 = pairs
L13_1 = L11_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = string
  L17_1 = L17_1.format
  L18_1 = "pid:%d"
  L19_1 = L16_1.pid
  L17_1 = L17_1(L18_1, L19_1)
  L18_1 = MpDetection
  L18_1 = L18_1.ScanResource
  L19_1 = "ems://"
  L20_1 = L17_1
  L19_1 = L19_1 .. L20_1
  L18_1(L19_1)
end
L12_1 = sysio
L12_1 = L12_1.GetProcessFromFileName
L13_1 = L5_1
L14_1 = "installshield\\setup.exe"
L13_1 = L13_1 .. L14_1
L12_1 = L12_1(L13_1)
L13_1 = pairs
L14_1 = L12_1
L13_1, L14_1, L15_1 = L13_1(L14_1)
for L16_1, L17_1 in L13_1, L14_1, L15_1 do
  L18_1 = string
  L18_1 = L18_1.format
  L19_1 = "pid:%d"
  L20_1 = L17_1.pid
  L18_1 = L18_1(L19_1, L20_1)
  L19_1 = MpDetection
  L19_1 = L19_1.ScanResource
  L20_1 = "ems://"
  L21_1 = L18_1
  L20_1 = L20_1 .. L21_1
  L19_1(L20_1)
end
