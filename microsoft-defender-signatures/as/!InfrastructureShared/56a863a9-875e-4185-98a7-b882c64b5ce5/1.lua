-- Threat: !InfrastructureShared
-- Name: 56a863a9-875e-4185-98a7-b882c64b5ce5
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block abuse of in-the-wild exploited vulnerable signed drivers",
    
    Description = "Windows Defender Exploit Guard detected an application writing an exploited vulnerable signed driver to the disk",
    NotificationDedupingInterval = 3600,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end
