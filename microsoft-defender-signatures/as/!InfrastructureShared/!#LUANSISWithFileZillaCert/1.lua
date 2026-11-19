-- Threat: !InfrastructureShared
-- Name: !#LUA:NSISWithFileZillaCert
-- Type: 10
-- MpAttributes: (MIXED:PUA:timkosse | MIXED:PUA:FileZilla) & //NSIS_Installer

mp.set_mpattribute("MpIsExhaustiveScriptScan")
if mp.get_mpattribute("MIXED:PUA:FileZilla") then
  mp.UfsSetMetadataBool("LUAUFS:NSISFileZillaBndlCert", true)
else
  mp.UfsSetMetadataBool("LUAUFS:NSISHasFileZillaCert", true)
end
return mp.INFECTED
