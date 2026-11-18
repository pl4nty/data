-- Threat: !InfrastructureShared
-- Name: 32b3e9dea30d
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-NONA", "DnsExfil.BS", false)
return mp.INFECTED
