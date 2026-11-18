-- Threat: !InfrastructureShared
-- Name: 17ab39dd76f3e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM("BM", "T1040", "CredentialAccess_NetworkSniffing_SuspiciousProcess")
  addRelatedProcess()
  reportRelatedBmHits()
  if not this_sigattrlog[2].matched and not this_sigattrlog[3].matched and sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
