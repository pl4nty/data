-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/VMPackedUntrustedDriver.A!ibt
-- Type: 11
-- MpAttributes: HSTR:VirTool:Win32/Obfuscator.XZ & pea_isdriver & !PEPCODE:HasDigitalSignature & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_0 = mp.getfilesize()
  if 122880 < l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
