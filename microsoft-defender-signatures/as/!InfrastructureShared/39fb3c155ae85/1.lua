-- Threat: !InfrastructureShared
-- Name: 39fb3c155ae85
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" then
  addRelatedProcess()
  reportRelatedBmHits()
  bm.add_related_string("ImagePath", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  return mp.INFECTED
end
return mp.CLEAN
