-- Threat: !InfrastructureShared
-- Name: 15b39e6d4e13
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003.002", "credentialdumping")
local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 then
  local l_0_2 = l_0_1.command_line
  if l_0_2 ~= nil then
    l_0_2 = string.lower(l_0_2)
    local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
      if sysio.IsFileExists(l_0_5) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
return mp.INFECTED
