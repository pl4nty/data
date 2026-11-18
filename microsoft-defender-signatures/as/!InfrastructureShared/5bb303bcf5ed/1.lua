-- Threat: !InfrastructureShared
-- Name: 5bb303bcf5ed
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
local l_0_3 = {
  "/usr/local/bin/com.docker.sock",
  "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool",
  "/usr/local/bin/com.docker.vmnat",
  "/usr/local/bin/com.docker.vmnat.lock",
  "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon",
  "/Library/PrivilegedHelperTools/us.zoom.ZoomService"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_2, l_0_5, 1, true) == 1 then
    if sysio.IsFileExists(l_0_2) then
      bm.add_threat_file(l_0_2)
    end
    TrackPidAndTechniqueBM("BM", "T1036.004", "DefenseEvasion_Masquerading_SuspUserAgent")
    return mp.INFECTED
  end
end
return mp.CLEAN
