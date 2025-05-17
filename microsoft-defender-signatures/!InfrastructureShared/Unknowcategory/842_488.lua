-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\842_488.luac 

-- params : ...
-- function num : 0
GetRuleInfo = function()
  -- function num : 0_0
  local l_1_0 = {}
  l_1_0.Name = "Block use of copied or impersonated system tools"
  l_1_0.Description = "Windows Defender Exploit Guard detected use of copied or impersonated system tool"
  l_1_0.NotificationDedupingInterval = 120
  l_1_0.NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  l_1_0.Type = HIPS.RULE_DISABLE_AUDIT_INHERITANCE
  return l_1_0
end


