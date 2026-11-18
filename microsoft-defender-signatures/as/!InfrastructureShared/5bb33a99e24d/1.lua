-- Threat: !InfrastructureShared
-- Name: 5bb33a99e24d
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-NONA", "DnsExfil.BD", true)
return mp.INFECTED
