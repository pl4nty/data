-- Threat: !InfrastructureShared
-- Name: 5bb33f0f8ccd
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-TL-TXT", "ExfilOverDnsTunnel.AD", true)
return mp.INFECTED
