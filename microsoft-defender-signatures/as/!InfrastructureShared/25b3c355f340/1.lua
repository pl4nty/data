-- Threat: !InfrastructureShared
-- Name: 25b3c355f340
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_1 ~= nil then
  local l_0_2 = mp.GetParentProcInfo(l_0_1.ppid)
  if l_0_2 ~= nil and IsKeyInRollingQueue("iscsicpl_bypass", l_0_2.ppid, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
