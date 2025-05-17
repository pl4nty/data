-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4b5b3d76701be\1.luac 

-- params : ...
-- function num : 0
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1552", "CredentialAccess_UnsecuredCredentials")
return mp.INFECTED

