-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b304374583\1_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts")
TrackPidAndTechniqueBM("BM", "T1059.004", "Execution_UnixShell")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

