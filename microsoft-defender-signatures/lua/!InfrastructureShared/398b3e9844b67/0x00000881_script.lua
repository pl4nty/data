-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\398b3e9844b67\0x00000881_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not (this_sigattrlog[16]).matched or (this_sigattrlog[16]).utf8p1 == nil or (this_sigattrlog[16]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[16]).utf8p1
if (sysio.IsFileExists)(l_0_3) and SuspMacPathsToMonitor((string.lower)(l_0_3), true) then
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_Http.A")
  return mp.INFECTED
end
return mp.CLEAN

