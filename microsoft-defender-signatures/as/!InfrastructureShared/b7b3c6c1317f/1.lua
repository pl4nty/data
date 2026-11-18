-- Threat: !InfrastructureShared
-- Name: b7b3c6c1317f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
RemediateProcessTreeForLinux()
return mp.INFECTED
