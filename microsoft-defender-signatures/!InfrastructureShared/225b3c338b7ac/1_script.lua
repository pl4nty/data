-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\225b3c338b7ac\1_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

