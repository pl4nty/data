-- Threat: !InfrastructureShared
-- Name: 66b303c32e3a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if StringStartsWith(l_0_1, "\\\\") then
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil)
    TrackPidAndTechniqueBM(l_0_0.ppid, "T1021.002", "proc_launch_from_share")
    return mp.INFECTED
  end
end
return mp.CLEAN
