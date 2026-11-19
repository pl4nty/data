-- Threat: !InfrastructureShared
-- Name: 121b37e66f4dd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspiciousCommandExecution")
TrackPidAndTechniqueBM("BM", "T1105", "DefeseEvasion_DeobfuscateFilesOrInformation_Base64EncodeCommandExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
