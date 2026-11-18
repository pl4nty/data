-- Threat: !InfrastructureShared
-- Name: 1a3b36bbb45b1
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p1
else
  return mp.CLEAN
end
if l_0_0 ~= nil then
  bm.add_related_file(l_0_0)
  mp.ReportLowfi(l_0_0, 4257421737)
end
TrackPidAndTechniqueBM("BM", "T1574", "DefenseEvasion_HijackExecutionFlow_HiddenSuspiciousModuleDrop")
return mp.INFECTED
