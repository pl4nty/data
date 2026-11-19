-- Threat: !InfrastructureShared
-- Name: 1e0b3d8559c20
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/NotepadInject.SA")
add_parents()
return mp.INFECTED
