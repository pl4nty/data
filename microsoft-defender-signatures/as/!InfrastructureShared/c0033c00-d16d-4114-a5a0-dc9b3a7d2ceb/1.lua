-- Threat: !InfrastructureShared
-- Name: c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block use of copied or impersonated system tools",
    
    Description = "Windows Defender Exploit Guard detected use of copied or impersonated system tool",
    NotificationDedupingInterval = 28800,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI,
    Type = HIPS.bitor(HIPS.RULE_DISABLE_AUDIT_INHERITANCE, HIPS.RULETYPE_ENTERPRISE)
  }
end
