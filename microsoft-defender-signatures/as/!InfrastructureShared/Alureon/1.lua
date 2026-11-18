-- Threat: !InfrastructureShared
-- Name: Alureon
-- Type: 15

if string.match(Remediation.Threat.Name, "Alureon") and Remediation.Threat.Active then
  local l_0_0 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\Interfaces"
  local l_0_1 = sysio.RegOpenKey(l_0_0)
  if l_0_1 then
    local l_0_2 = sysio.RegEnumKeys(l_0_1)
    if l_0_2 then
      for l_0_3, l_0_4 in pairs(l_0_2) do
        local l_0_5 = sysio.RegOpenKey(l_0_0 .. "\\" .. l_0_4)
        if l_0_5 then
          if sysio.GetRegValueAsString(l_0_5, "DhcpNameServer") ~= nil then
            sysio.SetRegValueAsString(l_0_5, "DhcpNameServer", "")
          end
          if sysio.GetRegValueAsString(l_0_5, "NameServer") ~= nil then
            sysio.SetRegValueAsString(l_0_5, "NameServer", "")
          end
        end
      end
    end
  end
  local l_0_6 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters")
  if l_0_6 then
    sysio.SetRegValueAsString(l_0_6, "DhcpNameServer", "")
  end
  local l_0_7 = MpCommon.ExpandEnvironmentVariables("%allusersprofile%\\Application Data\\Microsoft\\Network\\Connections\\Pbk\\rasphone.pbk")
  if l_0_7 then
    sysio.DeleteFile(l_0_7)
  end
end
