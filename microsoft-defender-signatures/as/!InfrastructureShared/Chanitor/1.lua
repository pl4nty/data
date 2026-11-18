-- Threat: !InfrastructureShared
-- Name: Chanitor
-- Type: 15

if Remediation.Threat.Active and string.match(Remediation.Threat.Name, "Trojan:Win32/Chanitor") then
  local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
  if l_0_0 then
    local l_0_1 = sysio.RegEnumValues(l_0_0)
    for l_0_2, l_0_3 in pairs(l_0_1) do
      if l_0_3 and string.match(l_0_3, "^winlogin$") then
        local l_0_4 = sysio.GetRegValueAsString(l_0_0, l_0_3)
        if l_0_4 and string.match(string.lower(l_0_4), "\\windows\\winlogin.exe$") then
          l_0_4 = string.lower(l_0_4)
          sysio.DeleteRegValue(l_0_0, l_0_3)
          Remediation.BtrDeleteFile(l_0_4)
        end
      end
    end
  end
end
