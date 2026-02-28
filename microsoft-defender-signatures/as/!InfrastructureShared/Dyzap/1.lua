local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Active
if L0_1 then
  L0_1 = sysio
  L0_1 = L0_1.RegOpenKey
  L1_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Lsa"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L1_1 = sysio
    L1_1 = L1_1.SetRegValueAsDword
    L2_1 = L0_1
    L3_1 = "Limitblankpassworduse"
    L4_1 = 1
    L1_1(L2_1, L3_1, L4_1)
  end
  L1_1 = nil
  L2_1 = nil
  L3_1 = nil
  L4_1 = sysio
  L4_1 = L4_1.RegExpandUserKey
  L5_1 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"
  L4_1 = L4_1(L5_1)
  L5_1 = pairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = sysio
    L10_1 = L10_1.RegOpenKey
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L2_1 = L10_1
    if L2_1 then
      L10_1 = sysio
      L10_1 = L10_1.RegEnumValues
      L11_1 = L2_1
      L10_1 = L10_1(L11_1)
      L1_1 = L10_1
      L10_1 = pairs
      L11_1 = L1_1
      L10_1, L11_1, L12_1 = L10_1(L11_1)
      for L13_1, L14_1 in L10_1, L11_1, L12_1 do
        if L14_1 then
          L15_1 = sysio
          L15_1 = L15_1.GetRegValueAsString
          L16_1 = L2_1
          L17_1 = L14_1
          L15_1 = L15_1(L16_1, L17_1)
          L3_1 = L15_1
          if L3_1 then
            L15_1 = nil
            L16_1 = string
            L16_1 = L16_1.match
            L17_1 = string
            L17_1 = L17_1.lower
            L18_1 = L3_1
            L17_1 = L17_1(L18_1)
            L18_1 = "appdata\\local\\%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%.exe$"
            L16_1 = L16_1(L17_1, L18_1)
            L15_1 = L16_1
            if L15_1 ~= nil then
              L16_1 = sysio
              L16_1 = L16_1.DeleteRegValue
              L17_1 = L2_1
              L18_1 = L14_1
              L16_1(L17_1, L18_1)
              L16_1 = sysio
              L16_1 = L16_1.IsFileExists
              L17_1 = L15_1
              L16_1 = L16_1(L17_1)
              if L16_1 then
                L16_1 = MpCommon
                L16_1 = L16_1.ReportLowfi
                L17_1 = L15_1
                L18_1 = 1512152387
                L16_1(L17_1, L18_1)
                L16_1 = sysio
                L16_1 = L16_1.DeleteFile
                L17_1 = L15_1
                L16_1(L17_1)
              end
            end
          end
        end
      end
    end
  end
  L5_1 = nil
  L6_1 = nil
  L7_1 = sysio
  L7_1 = L7_1.GetCommandLineFromService
  L8_1 = "googleupdate"
  L7_1 = L7_1(L8_1)
  L5_1 = L7_1
  L8_1 = L5_1
  L7_1 = L5_1.lower
  L7_1 = L7_1(L8_1)
  L8_1 = L7_1
  L7_1 = L7_1.match
  L9_1 = "\\(%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%.exe)$"
  L7_1 = L7_1(L8_1, L9_1)
  L6_1 = L7_1
  if L6_1 ~= nil then
    L7_1 = MpCommon
    L7_1 = L7_1.ExpandEnvironmentVariables
    L8_1 = "%windir%"
    L7_1 = L7_1(L8_1)
    L8_1 = L7_1
    L7_1 = L7_1.lower
    L7_1 = L7_1(L8_1)
    L8_1 = L7_1
    L7_1 = L7_1.gsub
    L9_1 = "\\\\%?\\"
    L10_1 = ""
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    L8_1 = "\\"
    L9_1 = L6_1
    L7_1 = L7_1 .. L8_1 .. L9_1
    L9_1 = L5_1
    L8_1 = L5_1.lower
    L8_1 = L8_1(L9_1)
    if L7_1 == L8_1 then
      L7_1 = sysio
      L7_1 = L7_1.DeleteService
      L8_1 = "googleupdate"
      L7_1(L8_1)
      L7_1 = sysio
      L7_1 = L7_1.IsFileExists
      L8_1 = L5_1
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L7_1 = MpCommon
        L7_1 = L7_1.ReportLowfi
        L8_1 = L5_1
        L9_1 = 889980315
        L7_1(L8_1, L9_1)
        L7_1 = sysio
        L7_1 = L7_1.DeleteFile
        L8_1 = L5_1
        L7_1(L8_1)
      end
    end
  end
end
