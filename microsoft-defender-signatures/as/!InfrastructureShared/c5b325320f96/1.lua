-- Threat: !InfrastructureShared
-- Name: c5b325320f96
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1049", "Discovery_SystemNetworkConnectionsDiscovery")
TrackPidAndTechniqueBM("BM", "T1016.001", "Discovery_SystemNetworkConfigurationDiscovery")
reportRelatedBmHits()
return mp.INFECTED
