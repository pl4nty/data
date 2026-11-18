-- Threat: !InfrastructureShared
-- Name: 25d0263e80d3
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsAiMcpAmsiScan") and not mp.get_mpattribute("MpIsAiNetPromptScan") then
  return mp.CLEAN
end
CollectXpiaEncodingTelemetry()
return mp.INFECTED
