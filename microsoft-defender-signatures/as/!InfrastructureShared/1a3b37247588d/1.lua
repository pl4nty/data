-- Threat: !InfrastructureShared
-- Name: 1a3b37247588d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 150000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
reportRelatedBmHits()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1486", "Impact_CcryptEncryption")
RemediateProcessTreeForLinux()
return mp.INFECTED
