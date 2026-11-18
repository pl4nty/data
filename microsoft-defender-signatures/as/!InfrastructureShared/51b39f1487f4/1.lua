-- Threat: !InfrastructureShared
-- Name: 51b39f1487f4
-- Type: 21
-- Includes: LuaFuncHelper

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
AppendToRollingQueue("iscsicpl_bypass", l_0_0.ppid, 1, 5)
return mp.INFECTED
