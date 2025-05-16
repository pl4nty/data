-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b30b917976\0x00001cf3_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1059.004", "Execution")
TrackPidAndTechniqueBM("BM", "T1071.001", "CommandAndControl")
addChildrenAsThreat()
return mp.INFECTED

