-- Threat: !InfrastructureShared
-- Name: be29777b5cad
-- Type: 21

if not mp.get_mpattribute("MpIsAiMcpAmsiScan") and not mp.get_mpattribute("MpIsAiMcpODRScan") and not mp.get_mpattribute("MpIsAiNetPromptScan") then
  return mp.CLEAN
end
return mp.INFECTED
