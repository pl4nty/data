-- Threat: !InfrastructureShared
-- Name: d3d76a1fa5cb
-- Type: 21
-- Includes: ResearchData, HvaLookupHelpers, LuaFuncHelper, BMLuaLib

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0 ~= nil and l_0_0.DeviceRoles ~= nil then
    local l_0_1 = mp.GetScannedPPID()
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_2 = string.lower(mp.GetProcessCommandLine(l_0_1))
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if not string.find(l_0_2, "-q", 1, true) or not string.find(l_0_2, ":\\\"", 1, true) then
      return mp.CLEAN
    end
    local l_0_3 = getSessionInfo(l_0_1, "SuspTaskCreateOnHVA")
    set_research_data("HVASessionInfo", safeJsonSerialize(l_0_3), false)
    return mp.INFECTED
  end
end
return mp.CLEAN
