-- Threat: !InfrastructureShared
-- Name: Lightmoon
-- Type: 15

if string.match(Remediation.Threat.Name, "Lightmoon") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\\\Software\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Policies\\\\System")
  for l_0_1, l_0_2 in pairs(l_0_0) do
    local l_0_3 = sysio.RegOpenKey(l_0_2)
    if l_0_3 then
      sysio.DeleteRegValue(l_0_3, "DisableRegistryTools")
    end
  end
  local l_0_4 = sysio.RegOpenKey("HKLM\\\\SOFTWARE\\\\Microsoft\\\\Windows NT\\\\CurrentVersion\\\\Image File Execution Options\\\\regedit.exe")
  if l_0_4 then
    sysio.DeleteRegValue(l_0_4, "debugger")
  end
  local l_0_5 = sysio.RegOpenKey("HKLM\\\\SOFTWARE\\\\Microsoft\\\\Windows NT\\\\CurrentVersion\\\\Image File Execution Options\\\\msconfig.exe")
  if l_0_5 then
    sysio.DeleteRegValue(l_0_5, "debugger")
  end
end
