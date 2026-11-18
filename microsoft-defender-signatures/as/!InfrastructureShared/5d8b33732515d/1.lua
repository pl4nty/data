-- Threat: !InfrastructureShared
-- Name: 5d8b33732515d
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, HvaLookupHelpers, ResearchData

local l_0_0 = IsDeviceHVAWithAD()
if l_0_0 == true then
  local l_0_1 = {}
  local l_0_2 = mp.GetScannedPPID()
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_1 = getSessionInfo(l_0_2, "WsmMonitorForChange")
  set_research_data("HVASessionInfo", safeJsonSerialize(l_0_1), false)
  return mp.INFECTED
end
return mp.CLEAN
