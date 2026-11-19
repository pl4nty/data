-- Threat: !InfrastructureShared
-- Name: 51b31c073298
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_0
local l_0_1, l_0_2 = pcall(bm.get_current_process_startup_info)
local l_0_3
if l_0_1 then
  l_0_0 = l_0_2.command_line
  l_0_3 = l_0_2.ppid
end
if l_0_0 ~= nil and l_0_3 ~= nil then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    if sysio.IsFileExists(l_0_6) and not mp.IsKnownFriendlyFile(l_0_6, true, false) then
      bm.add_related_file(l_0_6)
    end
  end
  TrackPidAndTechniqueBM(l_0_3, "T1574.002", "susp_dll_loaded")
  return mp.INFECTED
end
return mp.CLEAN
