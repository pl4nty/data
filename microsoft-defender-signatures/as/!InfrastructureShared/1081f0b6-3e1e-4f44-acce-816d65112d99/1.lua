-- Threat: !InfrastructureShared
-- Name: 1081f0b6-3e1e-4f44-acce-816d65112d99
-- Type: 25

function GetRuleInfo()
  if versioning.GetTestMode() ~= 53019 then
    local l_1_0 = versioning.GetOrgID()
    
    if l_1_0 == nil then
      return nil
    end
    l_1_0 = string.lower(l_1_0)
    if l_1_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
      return nil
    end
  end
  return {
    Name = "Block execution of files related to Remote Monitoring & Management tools",
    Description = "Windows Defender Exploit Guard detected execution of a file related to an RMM tool",
    NotificationDedupingInterval = 120,
    NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI,
    Type = HIPS.RULE_DISABLE_AUDIT_INHERITANCE
  }
end
