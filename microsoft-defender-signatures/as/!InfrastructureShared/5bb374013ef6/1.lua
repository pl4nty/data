-- Threat: !InfrastructureShared
-- Name: 5bb374013ef6
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_H", 1000, "Behavior:Win32/Inject.SA")
add_parents()
return mp.INFECTED
