-- Threat: !InfrastructureShared
-- Name: a1b370e50c7b
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_M", 2000, "Behavior:Win64/BadHatch.A")
return mp.INFECTED
