-- Threat: !InfrastructureShared
-- Name: 5bb36ef210b7
-- Type: 21
-- Includes: BMLuaLib

reportAndSinkholeDNSTelemetry("NRI-DNS-TL-TXT", "ExfilOverDnsTunnel.A", false)
return mp.INFECTED
