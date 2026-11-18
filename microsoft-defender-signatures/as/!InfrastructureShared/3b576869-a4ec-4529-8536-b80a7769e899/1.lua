-- Threat: !InfrastructureShared
-- Name: 3b576869-a4ec-4529-8536-b80a7769e899
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block Office applications from creating executable content",
    
    Description = "Windows Defender Exploit Guard detected the Office application creating executable content.",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end

function GetCommandLineRegExp()
  return "((windowsapps\\\\[^\\\\]+\\\\)|(microsoft office\\\\(root\\\\)?))office..\\\\[^\\.]+\\.exe\\\"?[^\\\"]+\\\"([^\\\"]+)\\\"?"
end
