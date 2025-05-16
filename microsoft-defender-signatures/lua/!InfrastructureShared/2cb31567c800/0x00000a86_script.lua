-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2cb31567c800\0x00000a86_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1110", "CredentialAccess_BruteForce")
reportRelatedBmHits()
return mp.INFECTED

