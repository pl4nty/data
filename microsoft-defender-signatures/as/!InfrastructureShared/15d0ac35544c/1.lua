-- Threat: !InfrastructureShared
-- Name: 15d0ac35544c
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("MpIsAiMcpAmsiScan") and not mp.get_mpattribute("MpIsAiNetPromptScan") then
  return mp.CLEAN
end
CollectXpiaEncodingTelemetry()
return mp.INFECTED
