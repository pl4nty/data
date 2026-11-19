-- Threat: !InfrastructureShared
-- Name: 32b30f5e0fa6
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-A", "DnsExfil.AS", false)
return mp.INFECTED
