-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\96b33842cabc\1_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_MountOverSSH")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

