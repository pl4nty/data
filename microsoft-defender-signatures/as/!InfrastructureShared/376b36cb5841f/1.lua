-- Threat: !InfrastructureShared
-- Name: 376b36cb5841f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil then
  local l_0_2 = l_0_1.command_line
  local l_0_3 = l_0_1.ppid
  if l_0_3 ~= nil and IsDetectionThresholdMet(l_0_3) then
    if l_0_2 ~= nil then
      l_0_2 = string.lower(l_0_2)
      local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_2)
      for l_0_5, l_0_6 in ipairs(l_0_4) do
        l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
        if sysio.IsFileExists(l_0_6) then
          AddResearchData(l_0_3, true)
          bm.add_related_file(l_0_6)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
