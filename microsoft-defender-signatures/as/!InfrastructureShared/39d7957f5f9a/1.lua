-- Threat: !InfrastructureShared
-- Name: 39d7957f5f9a
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or #l_0_1 <= 4 then
  return mp.CLEAN
end
local l_0_2 = string.lower(MpCommon.PathToWin32Path(l_0_1))
if l_0_2 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("BmProcessSearchOrderHijackA", l_0_2, true) then
  local l_0_3 = GetRealPidForScenario("CMDHSTR")
  if IsTacticObservedForPid(l_0_3, "simtool_childproc") or IsTacticObservedForParents(l_0_3, "simtool_childproc", 3) then
    return mp.INFECTED
  end
end
return mp.CLEAN
