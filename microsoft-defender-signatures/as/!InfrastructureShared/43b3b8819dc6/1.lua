-- Threat: !InfrastructureShared
-- Name: 43b3b8819dc6
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 100, "Behavior:Win32/Ryuk.SB!sms")
return mp.INFECTED
