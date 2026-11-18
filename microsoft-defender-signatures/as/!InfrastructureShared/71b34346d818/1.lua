-- Threat: !InfrastructureShared
-- Name: 71b34346d818
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_M", 5000, "Behavior:Win32/SystemBC.SC")
reportRelevantUntrustedEntities(1)
return mp.INFECTED
