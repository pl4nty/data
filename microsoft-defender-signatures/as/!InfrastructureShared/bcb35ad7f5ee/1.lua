-- Threat: !InfrastructureShared
-- Name: bcb35ad7f5ee
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if SuspMacPathsToMonitor(l_0_2, true) and IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_2) then
  TrackPidAndTechniqueBM("BM", "T1555.001", "CredentialAccess_CredentialsfromPasswordStores_Keychain")
  return mp.INFECTED
end
return mp.CLEAN
