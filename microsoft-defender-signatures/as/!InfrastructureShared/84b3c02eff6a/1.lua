-- Threat: !InfrastructureShared
-- Name: 84b3c02eff6a
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_H", 1000, "Behavior:Win32/Danabot.SA")
add_parents()
return mp.INFECTED
