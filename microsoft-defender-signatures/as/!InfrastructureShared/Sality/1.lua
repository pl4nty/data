-- Threat: !InfrastructureShared
-- Name: Sality
-- Type: 15

if string.match(Remediation.Threat.Name, "Sality%.A[TU]") and Remediation.Threat.Active then
  Remediation.SetRebootRequired()
end
