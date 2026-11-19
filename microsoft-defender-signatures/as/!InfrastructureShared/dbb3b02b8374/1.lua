-- Threat: !InfrastructureShared
-- Name: dbb3b02b8374
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_M", 100, "Behavior:Win32/SystemBC.SE")
return mp.INFECTED
