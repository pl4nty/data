-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\81b394f57b1e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[3]).utf8p1 == "" or not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[4]).utf8p2 == "" or not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[3]).utf8p1
local l_0_4 = (this_sigattrlog[4]).utf8p2
local l_0_5 = (this_sigattrlog[2]).utf8p2
if not SuspMacPathsToMonitor(l_0_5, false) then
  return mp.CLEAN
end
if (string.lower)(l_0_3) == l_0_4 and SuspMacPathsToMonitor(l_0_3, true) then
  if (sysio.IsFileExists)(l_0_3) then
    (bm.trigger_sig)("SuspFileDropdHttp.C", l_0_3)
  end
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspScriptUsingHttp")
  return mp.INFECTED
end
return mp.CLEAN

