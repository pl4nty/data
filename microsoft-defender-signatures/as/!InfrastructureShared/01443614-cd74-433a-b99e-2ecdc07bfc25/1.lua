-- Threat: !InfrastructureShared
-- Name: 01443614-cd74-433a-b99e-2ecdc07bfc25
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block executable files from running unless they meet a prevalence, age, or trusted list criteria",
    
    Description = "Windows Defender Exploit Guard detected the launch of a newly created untrusted executable file",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end
