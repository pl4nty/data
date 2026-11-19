-- Threat: !InfrastructureShared
-- Name: MagicThreat_7ffe388b
-- Type: 14

if not Remediation.Threat.Offline then
  local rempol = Remediation.Threat.RemovalPolicy
  rempol = rempol + 8448
  Remediation.SetRemovalPolicy(rempol)
end
