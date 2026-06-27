-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\18d0ef18f273\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsAiMcpAmsiScan") and not (mp.get_mpattribute)("MpIsAiNetPromptScan") then
  return mp.CLEAN
end
CollectXpiaEncodingTelemetry()
return mp.INFECTED

