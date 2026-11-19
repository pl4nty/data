-- Threat: !InfrastructureShared
-- Name: 84b3afca56f0
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-A", "DnsExfil.AC", true)
return mp.INFECTED
