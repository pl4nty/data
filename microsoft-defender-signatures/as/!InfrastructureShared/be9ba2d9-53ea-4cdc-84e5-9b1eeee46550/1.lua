-- Threat: !InfrastructureShared
-- Name: be9ba2d9-53ea-4cdc-84e5-9b1eeee46550
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block Launching of executable content from email attachment",
    
    Description = "Windows Defender Exploit Guard detected launching of executable content from the email attachment",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end
