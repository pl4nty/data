-- Threat: !InfrastructureShared
-- Name: 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block Win32 API calls from Office macro",
    
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI,
    Description = "Windows Defender Exploit Guard detected use of Win32 APIs from Macro code in Office files",
    Flags = HIPS.NO_INVOLVEDDOC_EXCL
  }
end

function GetCommandLineRegExp()
  return "((windowsapps\\\\[^\\\\]+\\\\)|(microsoft office\\\\(root\\\\)?))office..\\\\[^\\.]+\\.exe\\\"?[^\\\"]+\\\"([^\\\"]+)\\\"?"
end
