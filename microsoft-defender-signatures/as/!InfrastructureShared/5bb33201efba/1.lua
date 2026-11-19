-- Threat: !InfrastructureShared
-- Name: 5bb33201efba
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-A", "DnsExfil.A", false)
return mp.INFECTED
