-- Threat: !InfrastructureShared
-- Name: 56cb3c4e7060a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" and isTainted(l_0_0, "new_elf_file_created_hint") then
  addRelatedProcess()
  reportRelatedBmHits()
  bm.add_related_string("ImagePath", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1106", "Execution_NativeAPI_RansomGoLangCryptoAPI")
  return mp.INFECTED
end
return mp.CLEAN
