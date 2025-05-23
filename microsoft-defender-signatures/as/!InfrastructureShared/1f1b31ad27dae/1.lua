-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f1b31ad27dae\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1102", "CommandAndControl_WebService")
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

