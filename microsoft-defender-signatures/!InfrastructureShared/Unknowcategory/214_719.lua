-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\214_719.luac 

-- params : ...
-- function num : 0
GetRuleInfo = function()
  -- function num : 0_0
  do
    if (versioning.GetTestMode)() ~= 53019 then
      local l_1_0 = (versioning.GetOrgID)()
      if l_1_0 == nil then
        return nil
      end
      l_1_0 = (string.lower)(l_1_0)
      if l_1_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
        return nil
      end
    end
    local l_1_1 = {}
    l_1_1.Name = "Block execution of files related to Remote Monitoring & Management tools"
    l_1_1.Description = "Windows Defender Exploit Guard detected execution of a file related to an RMM tool"
    l_1_1.NotificationDedupingInterval = 120
    l_1_1.NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
    l_1_1.Type = HIPS.RULE_DISABLE_AUDIT_INHERITANCE
    return l_1_1
  end
end


