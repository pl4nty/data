-- Threat: !InfrastructureShared
-- Name: 55b356fdde50
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
TrackPidAndTechniqueBM("BM", "T1505.002", "TransportAgent")
return mp.INFECTED
