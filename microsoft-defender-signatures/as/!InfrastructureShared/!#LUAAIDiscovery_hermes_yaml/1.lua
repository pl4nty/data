-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_hermes_yaml
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: (Lua:YAMLExt | Lua:YMLExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:FnameAttr!config.yaml") and not mp.get_mpattribute("Lua:FnameAttr!config.yml") then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!hermes") and (not mp.get_mpattribute("Lua:LastFolder1!profiles") or not mp.get_mpattribute("Lua:LastFolder2!hermes")) then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_hermes_config_yaml"
local l_0_4 = "ai_hermes_config_yaml_" .. l_0_1
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
local l_0_8, l_0_9, l_0_10 = pcall(MpCommon.YamlDeserialize, l_0_7)
if not l_0_8 or isnull(l_0_9) or type(l_0_9) ~= "table" or l_0_10 ~= "ok" then
  return mp.CLEAN
end
local l_0_11 = {
  model = nil,
  modelProvider = nil,
  toolsets = nil,
  approvalMode = nil,
  gateway = nil,
  mcpServers = nil
}
if not isnull(l_0_9.model) then
  if type(l_0_9.model) == "table" then
    l_0_11.model = l_0_9.model.model or l_0_9.model.name
    l_0_11.modelProvider = l_0_9.model.provider
  elseif type(l_0_9.model) == "string" then
    l_0_11.model = l_0_9.model
  end
end
if not isnull(l_0_9.approvals) and type(l_0_9.approvals) == "table" then
  l_0_11.approvalMode = l_0_9.approvals.mode
end
local l_0_12 = l_0_9.gateway
if not isnull(l_0_12) and (not isnull(l_0_12.host) or not isnull(l_0_12.port)) then
  l_0_11.gateway = {
    host = l_0_12.host,
    port = l_0_12.port
  }
end
if not isnull(l_0_9.mcp_servers) and type(l_0_9.mcp_servers) == "table" then
  l_0_11.mcpServers = {}
  table.insert(l_0_11.mcpServers, McpParseHelper(l_0_9.mcp_servers))
end
local l_0_13 = safeJsonSerialize(l_0_11)
local l_0_14, l_0_15 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_14 and l_0_15 ~= nil then
  for l_0_16, l_0_17 in pairs(l_0_15) do
    if l_0_16 == l_0_4 and l_0_17 == l_0_13 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_13, l_0_5, 100)
local l_0_18 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_18 then
  MpCommon.BmTriggerSig(tostring(l_0_18), "AIDiscovery_hermes_yaml", l_0_13)
end
mp.SetDetectionString(l_0_13)
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
