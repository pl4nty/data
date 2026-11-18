-- Threat: !InfrastructureShared
-- Name: !#LUA:Phorndex:Installer
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & CERT:Phorndex

mp.set_mpattribute("MpIsExhaustiveScriptScan")
mp.UfsSetMetadataBool("LUAUFS:HasPhorndexCert", true)
return mp.INFECTED
