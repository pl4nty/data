-- Threat: !InfrastructureShared
-- Name: 21d06dc6ce44
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsAiMcpAmsiScan") and not mp.get_mpattribute("MpIsAiNetPromptScan") then
  return mp.CLEAN
end
CollectXpiaEncodingTelemetry()
return mp.INFECTED
