-- Threat: !InfrastructureShared
-- Name: 32b3391cd85d
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
else
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
TrackPidAndTechniqueBM("BM", "T1570", "LateralMovement_LateralToolTransfer_FTPFileDrop")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
