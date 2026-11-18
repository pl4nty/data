-- Threat: !InfrastructureShared
-- Name: !#InDecodedScriptSig
-- Type: 13

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("ScriptSigDecoded", false)
if l_0_0 == 0 and l_0_1 == true then
  return mp.INFECTED
end
return mp.CLEAN
