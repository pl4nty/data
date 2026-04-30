-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_codex_toml\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder0!.codex") or not (mp.get_mpattribute)("Lua:FnameAttr!config.toml") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_codex_config_toml"
local l_0_4 = "ai_codex_config_toml_" .. l_0_1
local l_0_5 = 86400
local l_0_6 = (mp.getfilesize)()
if l_0_6 > 1024000 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_7 = tostring((mp.readfile)(0, l_0_6))
;
(mp.readprotection)(true)
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8, l_0_9 = pcall(MpCommon.TomlDeserialize, l_0_7)
if not l_0_8 or not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = {}
l_0_10.model = l_0_9.model
l_0_10.model_provider = l_0_9.model_provider
l_0_10.approval_policy = l_0_9.approval_policy
l_0_10.sandbox_mode = l_0_9.sandbox_mode
l_0_10.web_search = l_0_9.web_search
l_0_10.mcpServers = nil
if not isnull(l_0_9.mcp_servers) and type(l_0_9.mcp_servers) == "table" then
  l_0_10.mcpServers = {}
  ;
  (table.insert)(l_0_10.mcpServers, McpParseHelper(l_0_9.mcp_servers))
end
local l_0_11 = safeJsonSerialize(l_0_10)
local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_12 and l_0_13 ~= nil then
  for l_0_17,l_0_18 in pairs(l_0_13) do
    if l_0_17 == l_0_4 and l_0_18 == l_0_11 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_11, l_0_5, 100)
  ;
  (mp.SetDetectionString)(l_0_11)
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end

