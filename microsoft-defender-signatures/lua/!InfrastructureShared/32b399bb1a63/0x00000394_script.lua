-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b399bb1a63\0x00000394_luac 

-- params : ...
-- function num : 0
if IsTechniqueObservedGlobal("CredentialAccess_SshBruteForceIncoming", true) then
  TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

