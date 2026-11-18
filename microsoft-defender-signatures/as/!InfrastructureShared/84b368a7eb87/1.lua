-- Threat: !InfrastructureShared
-- Name: 84b368a7eb87
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-NONA", "DnsExfil.BC", true)
return mp.INFECTED
