-- Threat: !InfrastructureShared
-- Name: 32b340016975
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-EXF-NONA", "DnsExfil.BE", true)
return mp.INFECTED
