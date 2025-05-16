-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\110b3144c2c3b\0x00000ab4_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1133", "InitialAccess_ExternalRemoteServices_SSHSuspiciousCommandExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

