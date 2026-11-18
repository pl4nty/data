-- Threat: !InfrastructureShared
-- Name: Cycbot
-- Type: 15

if string.match(Remediation.Threat.Name, "Backdoor:Win32/Cycbot.*") then
  local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings")
  if l_0_0 then
    for l_0_1, l_0_2 in pairs(l_0_0) do
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        local l_0_4 = sysio.GetRegValueAsString(l_0_3, "ProxyServer")
        if l_0_4 == "http=127.0.0.1:50370" then
          sysio.DeleteRegValue(l_0_3, "ProxyServer")
          sysio.SetRegValueAsDword(l_0_3, "ProxyEnable", 0)
        end
      end
    end
  end
end
