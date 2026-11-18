-- Threat: !InfrastructureShared
-- Name: !#LUA:NSISWithPiriformCert
-- Type: 10
-- MpAttributes: MIXED:PUA:PiriformBundler & //NSIS_Installer

mp.set_mpattribute("MpIsExhaustiveScriptScan")
mp.UfsSetMetadataBool("LUAUFS:NSISHasPiriformCert", true)
return mp.INFECTED
