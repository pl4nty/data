-- Threat: !InfrastructureShared
-- Name: 5bb3b69d6c90
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-NONA", "DnsExfil.B", false)
return mp.INFECTED
