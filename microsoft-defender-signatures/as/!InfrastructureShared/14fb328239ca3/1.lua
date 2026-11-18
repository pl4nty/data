-- Threat: !InfrastructureShared
-- Name: 14fb328239ca3
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/PyCompiledBins.B")
AddResearchData("BM", true)
return mp.INFECTED
