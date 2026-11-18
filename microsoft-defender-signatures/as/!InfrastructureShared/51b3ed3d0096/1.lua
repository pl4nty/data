-- Threat: !InfrastructureShared
-- Name: 51b3ed3d0096
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  triggerMemoryScanOnProcessTree(true, false, "SMS", 5000, "Behavior:Win32/InitiateSmsScan.A")
  AppendToRollingQueue("InitiateMemQuery", l_0_0.ppid, nil, 5000)
  return mp.INFECTED
end
return mp.CLEAN
