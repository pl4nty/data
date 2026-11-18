-- Threat: !InfrastructureShared
-- Name: 15b3dc1b17e8
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, HvaLookupHelpers, TechniqueTracker, ResearchData

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  AddResearchData(l_0_0.ppid, true)
  local l_0_1 = IsDeviceHVAWithAD()
  if l_0_1 == true then
    local l_0_2 = getSessionInfo(l_0_0, "GenSuspRemotelyInitiatedProc.A")
    set_research_data("HVASessionInfo", safeJsonSerialize(l_0_2), false)
  end
  return mp.INFECTED
end
return mp.CLEAN
