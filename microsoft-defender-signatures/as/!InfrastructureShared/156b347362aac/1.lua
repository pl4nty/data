-- Threat: !InfrastructureShared
-- Name: 156b347362aac
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if not this_sigattrlog[9].matched or this_sigattrlog[9].utf8p2 == nil or this_sigattrlog[9].utf8p2 == "" or this_sigattrlog[9].utf8p1 == nil or this_sigattrlog[9].utf8p1 == "" then
  return mp.CLEAN
end
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
l_0_0 = bm.get_imagepath()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_4 = bm.get_current_process_startup_info()
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_4.command_line
if IsExcludedByCmdlineMacOS(l_0_5) then
  return mp.CLEAN
end
l_0_1 = this_sigattrlog[9].utf8p2
l_0_2 = this_sigattrlog[9].utf8p1
local l_0_6 = mp.SIGATTR_LOG_SZ
for l_0_7 = l_0_6 - 1, 1, -1 do
  if sigattr_tail[l_0_7] ~= nil and sigattr_tail[l_0_7].attribute ~= nil and sigattr_tail[l_0_7].attribute == 16384 and sigattr_tail[l_0_7].utf8p1 ~= nil and sigattr_tail[l_0_7].utf8p1 ~= "" and string.find(sigattr_tail[l_0_7].utf8p1, "%$HOME%$/") ~= 1 and (sigattr_tail[l_0_7].utf8p1 == l_0_2 or string.find(l_0_1, sigattr_tail[l_0_7].utf8p1:match("[^/]*$"), 1, true)) then
    for l_0_8, l_0_9 in ipairs(l_0_3) do
      if string.find(sigattr_tail[l_0_7].utf8p1, l_0_9, 1, true) == 1 then
        if sysio.IsFileExists(sigattr_tail[l_0_7].utf8p1) then
          bm.trigger_sig("BM_SusFileDownExecM", sigattr_tail[l_0_7].utf8p1)
          bm.add_threat_file(sigattr_tail[l_0_7].utf8p1)
        end
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
