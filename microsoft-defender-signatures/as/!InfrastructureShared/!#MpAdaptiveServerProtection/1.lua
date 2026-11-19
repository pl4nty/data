-- Threat: !InfrastructureShared
-- Name: !#MpAdaptiveServerProtection
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpEnableExchgTaintTracking

local l_0_0 = GetRollingQueueKeyValue("IsExchgServerTainted", "MpEnableTaintTracking")
if l_0_0 == nil then
  AppendToRollingQueue("IsExchgServerTainted", "MpEnableTaintTracking", 1, 604800)
end
return mp.CLEAN
