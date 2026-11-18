-- Threat: !InfrastructureShared
-- Name: d3e037e1-3eb8-44c8-a917-57927947596d
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block JavaScript or VBScript from launching downloaded executable content",
    
    Description = "Windows Defender Exploit Guard detected a script interpreter process running obfuscated JavaScript, VBScript, or macro code.",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end
