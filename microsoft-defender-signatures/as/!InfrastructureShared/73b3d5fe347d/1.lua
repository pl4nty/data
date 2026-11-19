-- Threat: !InfrastructureShared
-- Name: 73b3d5fe347d
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = false
local l_0_2
if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p2 == nil or this_sigattrlog[3].utf8p2 == "" then
  return mp.CLEAN
end
l_0_2 = this_sigattrlog[3].utf8p2
local l_0_3 = {
  "/tmp/test10",
  "/private/tmp/test10",
  "/tmp/test9.scpt",
  "/private/tmp/test9.scpt",
  "/usr/local/bin/com.docker.sock",
  "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool",
  "/usr/local/bin/com.docker.vmnat",
  "/usr/local/bin/com.docker.vmnat.lock",
  "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon",
  "/Library/PrivilegedHelperTools/us.zoom.ZoomService"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_2, l_0_5, 1, true) == 1 then
    l_0_1 = true
    break
  end
end
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = bm.get_imagepath()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_6 = bm.get_current_process_startup_info()
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = l_0_6.command_line
if IsExcludedByCmdlineMacOS(l_0_7) then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) then
  bm.trigger_sig("BM_UnsProcCreatedUnsFile", l_0_2)
  if sysio.IsFileExists(l_0_2) then
    bm.add_threat_file(l_0_2)
  end
  if (SuspMacPathsToMonitor(l_0_0, true) or string.find(l_0_0, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Desktop/", 1, false)) and sysio.IsFileExists(l_0_0) then
    bm.add_threat_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
