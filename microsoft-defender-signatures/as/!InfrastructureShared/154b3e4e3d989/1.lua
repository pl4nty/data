-- Threat: !InfrastructureShared
-- Name: 154b3e4e3d989
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1, l_0_2
if bm.GetSignatureMatchDuration() > 600000000 then
  return mp.CLEAN
end
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].utf8p1
end
if not l_0_0 or l_0_0 == "" or l_0_0 ~= l_0_1 or l_0_0 ~= l_0_2 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1190", "InitialAccess_ElfFileDrop")
return mp.INFECTED
