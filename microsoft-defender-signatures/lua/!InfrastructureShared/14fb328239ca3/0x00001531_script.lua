-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\14fb328239ca3\0x00001531_luac 

-- params : ...
-- function num : 0
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/PyCompiledBins.B")
AddResearchData("BM", true)
return mp.INFECTED

