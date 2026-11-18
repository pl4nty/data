-- Threat: !InfrastructureShared
-- Name: 7fb37320d58a
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, HvaLookupHelpers, ResearchData

local l_0_0 = IsDeviceHVAWithAD()
if l_0_0 == true then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = getSessionInfo(l_0_1, "ScreenConnectRemote")
  set_research_data("HVASessionInfo", safeJsonSerialize(l_0_2), false)
  return mp.INFECTED
end
return mp.CLEAN
