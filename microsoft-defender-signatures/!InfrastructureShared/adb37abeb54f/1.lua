-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb37abeb54f\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1040", "CredentialAccess_NetworkSniffing_MemoryExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

