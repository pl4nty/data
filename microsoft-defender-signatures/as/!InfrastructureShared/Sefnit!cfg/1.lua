-- Threat: !InfrastructureShared
-- Name: Sefnit!cfg
-- Type: 15

if string.find(Remediation.Threat.Name, "Win32/Sefnit!cfg", 1, true) >= 0 then
  local l_0_0 = sysio.GetCommandLineFromService("tor")
  if l_0_0 == "\"C:\\Program Files\\Tor\\tor.exe\" --nt-service \"-ControlPort\" \"9051\"" then
    sysio.DeleteService("tor")
  end
end
