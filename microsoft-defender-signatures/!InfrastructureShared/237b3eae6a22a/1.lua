-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\237b3eae6a22a\1.luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 30000000 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1018", "Discovery_RemoteSystemDiscovery")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

