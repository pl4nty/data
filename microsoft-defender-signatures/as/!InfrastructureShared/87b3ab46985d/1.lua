-- Threat: !InfrastructureShared
-- Name: 87b3ab46985d
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/Ratived.A")
return mp.INFECTED
