-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\65b3b2f203c0\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1572", "CommandAndControl_ProtocolTuneling")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

