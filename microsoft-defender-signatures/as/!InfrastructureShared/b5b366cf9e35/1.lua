-- Threat: !InfrastructureShared
-- Name: b5b366cf9e35
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
end
if l_0_0 then
  bm.add_related_file(l_0_0)
end
TrackPidAndTechniqueBM("BM", "T1040", "Discovery_NetworkCapture_Sniffing")
reportRelatedBmHits()
return mp.INFECTED
