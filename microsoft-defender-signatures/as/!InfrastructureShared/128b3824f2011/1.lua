-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\128b3824f2011\1.luac 

-- params : ...
-- function num : 0
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "persistence_schtask_modify_source")
  return mp.INFECTED
end
return mp.CLEAN

