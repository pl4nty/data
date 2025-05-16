-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\79b39f036d65\0x000084df_luac 

-- params : ...
-- function num : 0
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/SysMiner.SA")
add_parents()
return mp.INFECTED

