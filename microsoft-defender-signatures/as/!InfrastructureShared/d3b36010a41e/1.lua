-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d3b36010a41e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (bm.get_imagepath)()
local l_0_2 = l_0_0.command_line
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
if SuspMacPathsToMonitor(l_0_2, false) then
  TrackPidAndTechniqueBM("BM", "T1059", "Execution_ShellOrInterpreter_General")
  return mp.INFECTED
end
return mp.CLEAN

