-- Threat: !InfrastructureShared
-- Name: 878d71bccb766
-- Type: 21
-- Includes: ResearchData, HvaLookupHelpers, LuaFuncHelper, BMLuaLib, TechniqueTracker

local l_0_0 = IsDeviceHVAWithAD()
if l_0_0 == true then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = {
    "wsmprovhost.exe"
  }
  if not IsProcNameInParentProcessTree(l_0_1, l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = getSessionInfo(l_0_1, "SuspTaskCreateOnHVA")
  set_research_data("HVASessionInfo", safeJsonSerialize(l_0_3), false)
  return mp.INFECTED
end
return mp.CLEAN
