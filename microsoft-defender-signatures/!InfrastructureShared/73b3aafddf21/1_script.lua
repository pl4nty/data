-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3aafddf21\1_luac 

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
if not SuspMacPathsToMonitor(l_0_2, true) and not (string.find)(l_0_2, "/Users/[^/]+/Downloads/", 1, false) and not (string.find)(l_0_2, "/Users/[^/]+/Documents/", 1, false) and not (string.find)(l_0_2, "/Users/[^/]+/Desktop/", 1, false) then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[2]).utf8p1
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_2)) then
  (bm.trigger_sig)("MacSuspDecoyDownload", l_0_3)
  TrackPidAndTechniqueBM("BM", "T1036.008", "DefenseEvasion_Masquerading_DecoyDownload")
  return mp.INFECTED
end
return mp.CLEAN

