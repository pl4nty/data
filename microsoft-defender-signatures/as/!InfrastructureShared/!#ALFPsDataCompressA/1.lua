-- Threat: !InfrastructureShared
-- Name: !#ALF:PsDataCompress.A
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: Lua:CloudBlockLevelGT3 & MpIsPowerShellAMSIScan & (SCRIPT:PsCompression.A | SCRIPT:PsCompression.B)

TrackPidAndTechnique("AMSI", "T1002", "DataCompress")
return mp.INFECTED
