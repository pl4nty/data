-- Threat: !InfrastructureShared
-- Name: 2db3e8c65918
-- Type: 21

if not mp.get_mpattribute("WPADExploitAttempt.seen") then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2
l_0_0 = this_sigattrlog[2].utf8p1
l_0_1 = string.lower(string.sub(this_sigattrlog[2].utf8p1, -12))
l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
if l_0_1 == nil or string.find(l_0_1, "^%%", 0) or string.find(l_0_1, "rundll32.exe", 1, true) and (string.find(l_0_2, "davclnt.dll", 1, true) or string.find(l_0_2, "winethc.dll", 1, true)) then
  return mp.CLEAN
end
if string.find(l_0_1, ":\\windows\\", 1, true) and (string.find(l_0_1, "taskhostw.exe") or string.find(l_0_1, "consent.exe")) then
  return mp.CLEAN
end
if string.find(l_0_1, ":\\program files", 1, true) and string.find(l_0_1, "\\diebold\\warsaw\\core.exe$", 1, false) then
  return mp.CLEAN
end
if string.find(l_0_1, ":\\programdata\\microsoft\\windows\\devicesoftwareupdates\\", 1, true) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
mp.set_mpattribute("WPADExploitAttempt.detected.1")
return mp.INFECTED
