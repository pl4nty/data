-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8ab3a1988f07\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).ppid == nil then
  return mp.CLEAN
end
l_0_1 = ((bm.get_current_process_startup_info)()).ppid
TrackPidAndTechniqueBM(l_0_1, "T1562.002", "event_logger_disable")
return mp.INFECTED

