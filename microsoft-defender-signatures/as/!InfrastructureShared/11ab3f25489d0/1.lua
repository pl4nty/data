-- Threat: !InfrastructureShared
-- Name: 11ab3f25489d0
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2
local l_0_3 = false
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p1 ~= "" and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[2].utf8p1
  l_0_2 = this_sigattrlog[2].utf8p2
end
local l_0_4 = {
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
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_1, l_0_6, 1, true) == 1 then
    l_0_3 = true
    break
  end
end
if not l_0_3 then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" or string.find(l_0_0, "/System/", 1, true) == 1 or string.find(l_0_0, ".app/Contents/", 1, true) then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_1) then
  bm.trigger_sig("AdhocPersistDPRK", l_0_0)
  if sysio.IsFileExists(l_0_1) then
    bm.add_threat_file(l_0_1)
  end
  return mp.INFECTED
end
return mp.CLEAN
