-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\beb30440706e\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1222", "DefenseEvasion_PermissionModification_ChmodToExec")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

