-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\236b3f352b62b\1_luac 

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
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[4]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[4]).utf8p1
if SuspMacPathsToMonitor(l_0_3, true) or (string.find)(l_0_3, ".app/Contents/MacOS/", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1041", "Exfiltration_ExfiltrationOverC2Channel_BeaverTail")
  return mp.INFECTED
end
return mp.CLEAN

