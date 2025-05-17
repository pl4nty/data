-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3e0726380\1_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

