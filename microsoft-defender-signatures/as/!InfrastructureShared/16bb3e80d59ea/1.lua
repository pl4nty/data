-- Threat: !InfrastructureShared
-- Name: 16bb3e80d59ea
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
else
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if string.find(l_0_1, "/bin/", 1, true) == 1 or string.find(l_0_1, "/system/", 1, true) == 1 or string.find(l_0_1, "/library/apple/", 1, true) == 1 or string.find(l_0_1, "/library/installersandboxes/", 1, true) == 1 or string.find(l_0_1, "/.git/modules/", 1, true) or string.find(l_0_1, "/.git/hooks/", 1, true) or string.find(l_0_1, "/sbin/", 1, true) == 1 or string.find(l_0_1, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_1, "/private/var/folders/", 1, true) == 1 or string.find(l_0_1, "/usr/", 1, true) == 1 and not string.find(l_0_1, "/usr/local/", 1, true) == 1 or string.find(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if string.match(l_0_0, "/%.") then
  TrackPidAndTechniqueBM("BM", "T1059.006", "Execution_CommandandScriptingInterpreter_Python")
  return mp.INFECTED
end
return mp.CLEAN
