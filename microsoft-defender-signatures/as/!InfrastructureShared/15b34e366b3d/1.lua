-- Threat: !InfrastructureShared
-- Name: 15b34e366b3d
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("altDNSServerUsage", "AlternateDNSServerUsage")
MpCommon.SetPersistContextNoPath("altDNSServerUsage", {}, 1)
bm.add_related_string("debug", "Current", bm.RelatedStringBMReport)
reportPersistedContext("dnsServers", "bmurl", "AlternateDNSServerUsage")
bm.add_related_string("debug", "Previous", bm.RelatedStringBMReport)
reportPersistedContext("lastDnsServers", "bmurl", "AlternateDNSServerUsage")
bm.add_related_string("debug", "Refresh", bm.RelatedStringBMReport)
updateSystemDNSServers()
reportPersistedContext("dnsServers", "bmurl", "AlternateDNSServerUsage")
return mp.INFECTED
