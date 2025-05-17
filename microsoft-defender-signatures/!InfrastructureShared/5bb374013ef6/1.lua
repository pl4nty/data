-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb374013ef6\1.luac 

-- params : ...
-- function num : 0
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 1000, "Behavior:Win32/Inject.SA")
add_parents()
return mp.INFECTED

