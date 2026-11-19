-- Threat: !InfrastructureShared
-- Name: 69b3cc6001c2
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if (string.match(l_0_0, "%d+%.%d+%.%d+%.%d+") or string.match(l_0_0, "[%a%d]+%:") or string.match(l_0_0, "%s-l[%s$]") or string.match(l_0_0, "%s%-%-listen[%s$]")) and string.match(l_0_0, "/bin/%a*sh") and (string.match(l_0_0, "%s%-[ec]%s") or string.match(l_0_0, "%s%-%-exec%s") or string.match(l_0_0, "%s%-%-sh%-exec%s")) then
  TrackPidAndTechniqueBM("BM", "T1059", "Execution_ReShell")
  return mp.INFECTED
end
return mp.CLEAN
