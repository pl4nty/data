-- Threat: !InfrastructureShared
-- Name: 41b3f45ee335
-- Type: 21

if not mp.get_mpattribute("WPADExploitAttempt.detected.P1") then
  return mp.CLEAN
end
local l_0_0, l_0_1
l_0_1 = string.lower(string.sub(this_sigattrlog[3].utf8p1, -12))
if l_0_1 == nil or string.find(l_0_1, "^%%", 0) then
  return mp.CLEAN
end
l_0_0 = this_sigattrlog[3].utf8p1
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
