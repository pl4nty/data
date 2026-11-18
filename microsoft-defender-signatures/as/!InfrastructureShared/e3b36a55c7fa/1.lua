-- Threat: !InfrastructureShared
-- Name: e3b36a55c7fa
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_0 = bm.get_current_process_startup_info()
  if l_0_0 ~= nil and l_0_0.command_line ~= nil then
    local l_0_1 = string.lower(l_0_0.command_line)
    local l_0_2 = {
      ["searchindexer.sys"] = true,
      ["svchost.exe"] = true,
      ["mousocoreworker.exe"] = true,
      ["vssvc.exe"] = true,
      ["usocoreworker.exe"] = true,
      ["klnagent.exe"] = true,
      ["adm.exe"] = true
    }
    local l_0_3 = l_0_1:match("\\([^\\]+)$")
    if l_0_2[l_0_3] then
      return mp.CLEAN
    end
    if l_0_1:find("\\dell\\", 1, true) or l_0_1:find("\\lenovo\\", 1, true) then
      return mp.CLEAN
    end
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
    AddResearchData(l_0_0.ppid, true)
  end
  return mp.INFECTED
end
return mp.CLEAN
