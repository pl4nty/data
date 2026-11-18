-- Threat: !InfrastructureShared
-- Name: 5beb7efe-fd9a-4556-801d-275e5ffc04cc
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block execution of potentially obfuscated scripts",
    
    Description = "Windows Defender Exploit Guard detected either obfuscated JavaScript, VBScript, or macro code.",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end

function GetCommandLineRegExp()
  return "((windowsapps\\\\[^\\\\]+\\\\)|(microsoft office\\\\(root\\\\)?))office..\\\\[^\\.]+\\.exe\\\"?[^\\\"]+\\\"([^\\\"]+)\\\"?"
end
