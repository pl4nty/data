-- Threat: !InfrastructureShared
-- Name: Lovgate
-- Type: 15

if string.match(Remediation.Threat.Name, "Lovgate") then
  local l_0_0 = sysio.RegOpenKey("HKLM\\software\\classes\\txtfile\\shell\\open\\command")
  if l_0_0 then
    sysio.SetRegValueAsStringExpand(l_0_0, nil, "%SystemRoot%\\system32\\NOTEPAD.EXE %1")
  end
  if string.match(Remediation.Threat.Name, "Lovgate%.[F-Z]") or string.match(Remediation.Threat.Name, "Lovgate%.[A-Z][A-Z]+@mm") then
    Remediation.SetRemovalPolicy(crypto.bitor(Remediation.Threat.RemovalPolicy, 4))
  end
end
