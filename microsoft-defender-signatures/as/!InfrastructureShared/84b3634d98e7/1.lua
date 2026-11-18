-- Threat: !InfrastructureShared
-- Name: 84b3634d98e7
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_M", 100, "Behavior:Win32/ISSW3Mem.SA")
return mp.INFECTED
