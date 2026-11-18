-- Threat: !InfrastructureShared
-- Name: 35b3868b56c8
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = bm.get_current_process_startup_info()
  if not isnull(l_0_1.command_line) then
    local l_0_2 = l_0_1.command_line
    if string.find(l_0_2, "-k localService -p -s RemoteRegistry", -36, true) and GetRollingQueue("SuspADSyncAccessByPid4") ~= nil then
      bm.add_threat_file(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
