-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\99b380d249c3\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1040", "Network_Sniffing")
reportRelatedBmHits()
return mp.INFECTED

