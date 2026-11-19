-- Threat: !InfrastructureShared
-- Name: Dyzap
-- Type: 15

if Remediation.Threat.Active then
  local l_0_0 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Control\\Lsa")
  if l_0_0 then
    sysio.SetRegValueAsDword(l_0_0, "Limitblankpassworduse", 1)
  end
  local l_0_1, l_0_2, l_0_3
  local l_0_4 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_5, l_0_6 in pairs(l_0_4) do
    l_0_2 = sysio.RegOpenKey(l_0_6)
    if l_0_2 then
      l_0_1 = sysio.RegEnumValues(l_0_2)
      for l_0_7, l_0_8 in pairs(l_0_1) do
        if l_0_8 then
          l_0_3 = sysio.GetRegValueAsString(l_0_2, l_0_8)
          if l_0_3 then
            local l_0_9
            l_0_9 = string.match(string.lower(l_0_3), "appdata\\local\\%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%.exe$")
            if l_0_9 ~= nil then
              sysio.DeleteRegValue(l_0_2, l_0_8)
              if sysio.IsFileExists(l_0_9) then
                MpCommon.ReportLowfi(l_0_9, 1512152387)
                sysio.DeleteFile(l_0_9)
              end
            end
          end
        end
      end
    end
  end
  local l_0_10, l_0_11
  l_0_10 = sysio.GetCommandLineFromService("googleupdate")
  l_0_11 = l_0_10:lower():match("\\(%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%.exe)$")
  if l_0_11 ~= nil and MpCommon.ExpandEnvironmentVariables("%windir%"):lower():gsub("\\\\%?\\", "") .. "\\" .. l_0_11 == l_0_10:lower() then
    sysio.DeleteService("googleupdate")
    if sysio.IsFileExists(l_0_10) then
      MpCommon.ReportLowfi(l_0_10, 889980315)
      sysio.DeleteFile(l_0_10)
    end
  end
end
