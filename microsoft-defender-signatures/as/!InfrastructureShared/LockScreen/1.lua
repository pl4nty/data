-- Threat: !InfrastructureShared
-- Name: LockScreen
-- Type: 15

if Remediation.Threat.Name == "Trojan:Win32/LockScreen.BO" then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System")
  if l_0_0 then
    for l_0_1, l_0_2 in pairs(l_0_0) do
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        sysio.DeleteRegValue(l_0_3, "NoDesktop")
      end
    end
  end
  local l_0_4 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced")
  if l_0_4 then
    for l_0_5, l_0_6 in pairs(l_0_4) do
      local l_0_7 = sysio.RegOpenKey(l_0_6)
      if l_0_7 then
        sysio.SetRegValueAsDword(l_0_7, "HideIcons", 0)
      end
    end
  end
end
