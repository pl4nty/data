-- Threat: !InfrastructureShared
-- Name: e6db77e5-3df2-4cf1-b95a-636979351e5b
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block persistence through WMI event subscription",
    
    Description = "Windows Defender Exploit Guard detected an attempted installation of a persistent entity in the WMI repo via event subscription",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end
