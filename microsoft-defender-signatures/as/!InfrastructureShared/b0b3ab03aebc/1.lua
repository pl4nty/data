-- Threat: !InfrastructureShared
-- Name: b0b3ab03aebc
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
taint(l_0_0, "mounted_file_execution", 3600)
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_RunningFromMnt")
return mp.INFECTED
