-- Threat: !InfrastructureShared
-- Name: b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block untrusted and unsigned processes that run from USB",
    
    Description = "Windows Defender Exploit Guard detected launching of an untrusted or unsigned executable from a removable USB media.",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end
