-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3be7e97c6\0x000009c2_luac 

-- params : ...
-- function num : 0
TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
addRelatedProcess()
return mp.INFECTED

