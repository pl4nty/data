-- Threat: !InfrastructureShared
-- Name: Parite
-- Type: 15

if string.match(Remediation.Threat.Name, "Parite") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer")
  if l_0_0 then
    for l_0_1, l_0_2 in pairs(l_0_0) do
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        sysio.DeleteRegValue(l_0_3, "PINF")
      end
    end
  end
end
