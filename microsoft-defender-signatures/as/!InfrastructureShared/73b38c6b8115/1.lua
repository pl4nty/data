-- Threat: !InfrastructureShared
-- Name: 73b38c6b8115
-- Type: 21

if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[3].utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[3].utf8p1
local l_0_1 = {
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
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) == 1 then
    if sysio.IsFileExists(l_0_0) then
      bm.add_threat_file(l_0_0)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
