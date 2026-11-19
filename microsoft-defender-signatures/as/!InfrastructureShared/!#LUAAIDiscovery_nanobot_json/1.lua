-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_nanobot_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!.nanobot") or not mp.get_mpattribute("Lua:FnameAttr!config.json") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_nanobot_config_json"
local l_0_4 = "ai_nanobot_config_json_" .. l_0_1
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
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = {
  defaultAgent = {},
  customAgents = {},
  mcpServers = nil,
  toolExecEnable = true,
  gateway = {
    host = l_0_8.gateway.host or "0.0.0.0",
    port = l_0_8.gateway.port or 18790
  }
}
if not isnull(l_0_8.agents) and type(l_0_8.agents) == "table" then
  for l_0_10, l_0_11 in pairs(l_0_8.agents) do
    if type(l_0_10) == "string" and type(l_0_11) == "table" then
      if l_0_10 == "defaults" then
        l_0_9.defaultAgent = {
          model = string.lower(l_0_11.model or ""),
          provider = string.lower(l_0_11.provider or "")
        }
      else
        table.insert(l_0_9.customAgents, {
          agentName = string.lower(l_0_10),
          model = string.lower(l_0_11.model or ""),
          provider = string.lower(l_0_11.provider or "")
        })
      end
    end
  end
end
if not isnull(l_0_8.tools) and type(l_0_8.tools) == "table" then
  if not isnull(l_0_8.tools.mcpServers) and type(l_0_8.tools.mcpServers) == "table" then
    l_0_9.mcpServers = {}
    table.insert(l_0_9.mcpServers, McpParseHelper(l_0_8.tools.mcpServers))
  end
  if not isnull(l_0_8.tools.exec) and type(l_0_8.tools.exec) == "table" then
    l_0_9.toolExecEnable = l_0_8.tools.exec.enable
  end
end
local l_0_12 = safeJsonSerialize(l_0_9)
local l_0_13, l_0_14 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_13 and l_0_14 ~= nil then
  for l_0_15, l_0_16 in pairs(l_0_14) do
    if l_0_15 == l_0_4 and l_0_16 == l_0_12 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_12, l_0_5, 100)
local l_0_17 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_17 then
  MpCommon.BmTriggerSig(l_0_17, "AIDiscovery_nanobot_json", l_0_12)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
