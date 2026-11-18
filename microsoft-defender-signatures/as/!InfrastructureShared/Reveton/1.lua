-- Threat: !InfrastructureShared
-- Name: Reveton
-- Type: 15

if string.match(Remediation.Threat.Name, "Ransom:Win32/Reveton") then
  local l_0_0 = sysio.RegOpenKey("HKLM\\SYSTEM\\ControlSet001\\services\\Winmgmt\\Parameters")
  if l_0_0 then
    local l_0_1 = sysio.GetRegValueAsString(l_0_0, "ServiceDll")
    if l_0_1 ~= "%SystemRoot%\\system32\\wbem\\WMIsvc.dll" then
      sysio.SetRegValueAsStringExpand(l_0_0, "ServiceDll", "%SystemRoot%\\system32\\wbem\\WMIsvc.dll")
    end
  end
  if string.match(Remediation.Threat.Name, "!lnk") then
    local l_0_2 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
    if l_0_2 then
      for l_0_3, l_0_4 in pairs(l_0_2) do
        local l_0_5 = sysio.RegOpenKey(l_0_4)
        if l_0_5 then
          local l_0_6 = sysio.GetRegValueAsString(l_0_5, "ctfmon32.exe")
          if l_0_6 ~= nil and string.match(l_0_6, ",XFG00") then
            sysio.DeleteRegValue(l_0_5, "ctfmon32.exe")
          end
        end
      end
    end
  end
end
