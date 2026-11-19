-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_zeroclaw_toml
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:TOMLExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!.zeroclaw") or not mp.get_mpattribute("Lua:FnameAttr!config.toml") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_zeroclaw_config_toml"
local l_0_4 = "ai_zeroclaw_config_toml_" .. l_0_1
local l_0_5 = 86400
local l_0_6 = mp.getfilesize()
if 1024000 < l_0_6 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = tostring(mp.readfile(0, l_0_6))
mp.readprotection(true)
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8, l_0_9 = pcall(MpCommon.TomlDeserialize, l_0_7)
if not l_0_8 or not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = {
  model_provider = l_0_9.default_provider,
  model = l_0_9.default_model,
  autonomyLevel = l_0_9.autonomy and l_0_9.autonomy.level or "supervised",
  mcpServers = nil,
  integrations = {},
  gateway = nil
}
if not isnull(l_0_9.mcp) and type(l_0_9.mcp) == "table" and not isnull(l_0_9.mcp.servers) and type(l_0_9.mcp.servers) == "table" then
  l_0_10.mcpServers = {}
  table.insert(l_0_10.mcpServers, McpParseHelper(l_0_9.mcp.servers))
end
l_0_10.integrations = {
  claude_code = l_0_9.claude_code and l_0_9.claude_code.enabled,
  codex_cli = l_0_9.codex_cli and l_0_9.codex_cli.enabled,
  gemini_cli = l_0_9.gemini_cli and l_0_9.gemini_cli.enabled,
  opencode_cli = l_0_9.opencode_cli and l_0_9.opencode_cli.enabled,
  microsoft365 = l_0_9.microsoft365 and l_0_9.microsoft365.enabled,
  google_workspace = l_0_9.google_workspace and l_0_9.google_workspace.enabled,
  cloud_ops = l_0_9.cloud_ops and l_0_9.cloud_ops.enabled
}
if not isnull(l_0_9.gateway) and type(l_0_9.gateway) == "table" then
  l_0_10.gateway = {
    host = l_0_9.gateway.host,
    port = l_0_9.gateway.port
  }
end
local l_0_11 = safeJsonSerialize(l_0_10)
local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_12 and l_0_13 ~= nil then
  for l_0_14, l_0_15 in pairs(l_0_13) do
    if l_0_14 == l_0_4 and l_0_15 == l_0_11 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_11, l_0_5, 100)
local l_0_16 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_16 then
  MpCommon.BmTriggerSig(l_0_16, "AIDiscovery_zeroclaw_toml", l_0_11)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
