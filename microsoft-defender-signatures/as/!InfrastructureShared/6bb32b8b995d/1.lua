-- Threat: !InfrastructureShared
-- Name: 6bb32b8b995d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1, l_0_2 = pcall(bm.get_current_process_startup_info)
if l_0_1 then
  l_0_0 = l_0_2.command_line
end
if l_0_0 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) == true then
      bm.add_related_file(l_0_5)
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1548.002", "uac_bypass")
return mp.INFECTED
