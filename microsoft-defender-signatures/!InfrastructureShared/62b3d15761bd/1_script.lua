-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b3d15761bd\1_luac 

-- params : ...
-- function num : 0
TerminateParentProcessForLinux()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
addRelatedProcess()
return mp.INFECTED

