-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b349c73ee7\0x000009bd_luac 

-- params : ...
-- function num : 0
TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
return mp.INFECTED

