-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\14ab32fedc4cf\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1133", "InitialAccess_ExternalRemoteServices_SSHSuspiciousCommandExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

