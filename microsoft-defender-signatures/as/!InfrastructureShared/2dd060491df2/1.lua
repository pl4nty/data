-- Threat: !InfrastructureShared
-- Name: 2dd060491df2
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsAiMcpAmsiScan") and not mp.get_mpattribute("MpIsAiNetPromptScan") then
  return mp.CLEAN
end
CollectXpiaEncodingTelemetry()
return mp.INFECTED
