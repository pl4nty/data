-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b325320f96\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1049", "Discovery_SystemNetworkConnectionsDiscovery")
TrackPidAndTechniqueBM("BM", "T1016.001", "Discovery_SystemNetworkConfigurationDiscovery")
reportRelatedBmHits()
return mp.INFECTED

