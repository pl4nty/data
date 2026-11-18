-- Threat: !InfrastructureShared
-- Name: 5bb3fdf45f3a
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-A", "DnsExfil.AD", true)
return mp.INFECTED
