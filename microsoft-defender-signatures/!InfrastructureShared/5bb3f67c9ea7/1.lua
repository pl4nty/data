-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3f67c9ea7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if SuspMacPathsToMonitor(l_0_2, true) or (string.find)(l_0_2, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_2, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_2, "/Users/[^/]+/Desktop/", 1, false) then
  TrackPidAndTechniqueBM("BM", "T1071.001", "CommandAndControl_ApplicationLayerProtocol_WebProtocols")
  return mp.INFECTED
end
return mp.CLEAN

