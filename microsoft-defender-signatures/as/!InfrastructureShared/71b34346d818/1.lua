-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\71b34346d818\1.luac 

-- params : ...
-- function num : 0
triggerMemoryScanOnProcessTree(true, true, "SMS_M", 5000, "Behavior:Win32/SystemBC.SC")
reportRelevantUntrustedEntities(1)
return mp.INFECTED

