-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb33686dcdd\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
  return mp.CLEAN
end
;
(bm.add_related_string)("picus_service_create", "BM:ModServices.B", bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1543.003", "picus_service_persistence")
return mp.INFECTED

