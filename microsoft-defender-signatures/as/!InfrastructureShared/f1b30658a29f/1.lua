-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f1b30658a29f\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1098", "Persistence_AccountManipulation")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

