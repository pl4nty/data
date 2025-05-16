-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3c02eff6a\0x000084d0_luac 

-- params : ...
-- function num : 0
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 1000, "Behavior:Win32/Danabot.SA")
add_parents()
return mp.INFECTED

