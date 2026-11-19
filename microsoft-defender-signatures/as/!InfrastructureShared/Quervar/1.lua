-- Threat: !InfrastructureShared
-- Name: Quervar
-- Type: 15

if (string.match(Remediation.Threat.Name, "Virus:Win32/Quervar%.B") or string.match(Remediation.Threat.Name, "Virus:Win32/Quervar%.C") or string.match(Remediation.Threat.Name, "Virus:Win32/Quervar%.gen!B")) and MpCommon.GetGlobalMpAttribute("RPF:Quervar_manual_clean") then
  Remediation.SetRemovalPolicy(crypto.bitor(Remediation.Threat.RemovalPolicy, 2))
end
