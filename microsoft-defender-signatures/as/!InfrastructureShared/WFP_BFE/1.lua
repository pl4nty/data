-- Threat: !InfrastructureShared
-- Name: WFP_BFE
-- Type: 15

if Remediation.Threat.Active and string.find(Remediation.Threat.Name, "Behavior:Win32/WFP_BFE.B", 1, true) then
  Remediation.SetRebootRequired()
end
