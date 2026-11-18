-- Threat: !InfrastructureShared
-- Name: 132b3ecdeb4c0
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and l_0_0 ~= "" then
  if string.find(l_0_0, "/home", 1, true) and (string.find(l_0_0, ".local", 1, true) or string.find(l_0_0, ".vscode", 1, true) or string.find(l_0_0, "logstash", 1, true) or string.find(l_0_0, "android-studio", 1, true)) and (string.find(l_0_0, "jbr", 1, true) or string.find(l_0_0, "jdk", 1, true) or string.find(l_0_0, "jre", 1, true)) and string.find(l_0_0, "/bin/java", 1, true) then
    return mp.CLEAN
  end
  if (string.find(l_0_0, "/tmp", 1, true) or string.find(l_0_0, "/home", 1, true) or string.find(l_0_0, "/dev/shm", 1, true) or string.find(l_0_0, "/var/crash", 1, true)) and string.find(l_0_0, "java", 1, true) and StringEndsWith(l_0_0, "--version") then
    bm.trigger_sig("BMSuspOpenFilesCall.A", l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
