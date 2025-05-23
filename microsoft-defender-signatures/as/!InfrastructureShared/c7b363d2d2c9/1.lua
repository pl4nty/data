-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c7b363d2d2c9\1.luac 

-- params : ...
-- function num : 0
if IsTechniqueObservedGlobal("CredentialAccess_SshBruteForceIncoming", true) then
  TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess_OSCredentialDumping_mt2023")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

