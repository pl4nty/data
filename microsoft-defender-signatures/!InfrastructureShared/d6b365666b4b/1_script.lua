-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b365666b4b\1_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspiciousRemoteFileExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

