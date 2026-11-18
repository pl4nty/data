-- Threat: !InfrastructureShared
-- Name: 154b33bceb9d0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not this_sigattrlog[5].matched or this_sigattrlog[5].utf8p1 == nil or this_sigattrlog[5].utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[5].utf8p1
if not SuspMacPathsToMonitor(l_0_3, true) then
  return mp.CLEAN
end
local l_0_4
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_4 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_4 = this_sigattrlog[3].utf8p2
end
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3:match("[^/]*$")
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
if string.find(l_0_4, l_0_5, 1, true) then
  TrackPidAndTechniqueBM("BM", "T1071.002", "CommandAndControl_ApplicationLayerProtocol_FileTransferProtocols")
  return mp.INFECTED
end
return mp.CLEAN
