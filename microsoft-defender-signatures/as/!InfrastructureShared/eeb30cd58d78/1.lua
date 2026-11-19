-- Threat: !InfrastructureShared
-- Name: eeb30cd58d78
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
if this_sigattrlog[5].matched then
  local l_0_3 = this_sigattrlog[5].utf8p1
  if l_0_3 ~= nil and l_0_3 ~= "" and (string.find(l_0_3, "/Applications/GlobalProtect.app/Contents/", 1, true) or string.find(l_0_3, "/Library/Application Support/Microsoft/Defender", 1, true)) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("BM", "T1033", "Discovery_SystemUserDiscovery")
return mp.INFECTED
