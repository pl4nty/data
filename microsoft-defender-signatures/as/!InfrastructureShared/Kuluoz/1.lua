-- Threat: !InfrastructureShared
-- Name: Kuluoz
-- Type: 15

if Remediation.Threat.Active and string.match(Remediation.Threat.Name, "Behavior:Win32/Kuluoz.gen!A") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    local l_0_3 = sysio.RegOpenKey(l_0_2)
    if l_0_3 then
      local l_0_4 = sysio.RegEnumValues(l_0_3)
      for l_0_5, l_0_6 in pairs(l_0_4) do
        if l_0_6 and string.match(l_0_6, "^%l%l%l%l%l%l%l%l$") then
          local l_0_7 = sysio.GetRegValueAsString(l_0_3, l_0_6)
          if l_0_7 and (string.match(string.lower(l_0_7), "\\appdata\\local\\%a%a%a%a%a%a%a%a%.exe\"$") or string.match(string.lower(l_0_7), "\\local settings\\application data\\%a%a%a%a%a%a%a%a%.exe\"$")) then
            l_0_7 = string.gsub(l_0_7, "\"", "")
            sysio.DeleteRegValue(l_0_3, l_0_6)
            Remediation.BtrDeleteFile(l_0_7)
          end
        end
      end
    end
  end
end
