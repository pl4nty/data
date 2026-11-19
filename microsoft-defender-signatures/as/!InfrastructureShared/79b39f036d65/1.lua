-- Threat: !InfrastructureShared
-- Name: 79b39f036d65
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/SysMiner.SA")
add_parents()
return mp.INFECTED
