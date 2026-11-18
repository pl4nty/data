-- Threat: !InfrastructureShared
-- Name: 97b3c48e8439
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_ExfiltrationOverAlternativeProtocol_AsymmetricEncryptedNonC2Protocol")
bm.trigger_sig("BM_FileUploadOverUsingSCP", "Detected")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
