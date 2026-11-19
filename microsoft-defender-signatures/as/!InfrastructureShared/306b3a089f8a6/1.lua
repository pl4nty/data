-- Threat: !InfrastructureShared
-- Name: 306b3a089f8a6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil and this_sigattrlog[11].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[11].utf8p2)
end
if l_0_3 ~= "" and l_0_3 ~= nil and string.find(l_0_3, "post", 1, true) and (string.find(l_0_3, "buildid", 1, true) or string.find(l_0_3, "osver", 1, true)) then
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  TrackPidAndTechniqueBM("BM", "T1105", "IngressToolTransfer_PRI1_CommandAndControl_FileDownloadCurl")
  return mp.INFECTED
end
return mp.CLEAN
