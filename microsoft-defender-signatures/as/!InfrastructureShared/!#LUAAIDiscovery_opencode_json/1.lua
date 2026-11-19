-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_opencode_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:FnameAttr!opencode.json") and not mp.get_mpattribute("Lua:FnameAttr!opencode.jsonc") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_opencode_config_json"
local l_0_4 = "ai_opencode_config_json_" .. l_0_1
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
  model = l_0_8.model,
  smallModel = l_0_8.small_model,
  autoUpdate = l_0_8.autoupdate,
  tools = l_0_8.tools,
  plugins = l_0_8.plugin,
  permissions = nil,
  providers = nil,
  mcpServers = nil,
  gateway = nil
}
if not isnull(l_0_8.permission) and type(l_0_8.permission) == "table" then
  l_0_9.permissions = {}
  for l_0_10, l_0_11 in pairs(l_0_8.permission) do
    if type(l_0_10) == "string" then
      if type(l_0_11) == "string" then
        l_0_9.permissions[l_0_10] = l_0_11
      elseif type(l_0_11) == "table" then
        local l_0_12 = {}
        for l_0_13, l_0_14 in pairs(l_0_11) do
          if type(l_0_13) == "string" and type(l_0_14) == "string" then
            l_0_12[l_0_13] = l_0_14
          end
        end
        l_0_9.permissions[l_0_10] = l_0_12
      end
    end
  end
end
if not isnull(l_0_8.provider) and type(l_0_8.provider) == "table" then
  l_0_9.providers = {}
  for l_0_15, l_0_16 in pairs(l_0_8.provider) do
    if type(l_0_15) == "string" and type(l_0_16) == "table" then
      local l_0_17 = {
        name = string.lower(l_0_15),
        api = l_0_16.api,
        id = l_0_16.id
      }
      if not isnull(l_0_16.options) and type(l_0_16.options) == "table" then
        l_0_17.baseURL = l_0_16.options.baseURL or l_0_16.options.enterpriseUrl
      end
      if not isnull(l_0_16.models) and type(l_0_16.models) == "table" then
        local l_0_18 = {}
        for l_0_19, l_0_20 in pairs(l_0_16.models) do
          table.insert(l_0_18, string.lower(l_0_19))
        end
        l_0_17.models = l_0_18
      end
      table.insert(l_0_9.providers, l_0_17)
    end
  end
end
if not isnull(l_0_8.mcp) and type(l_0_8.mcp) == "table" then
  local function l_0_21(l_1_0)
    return type(l_1_0) == "table" and (l_1_0.type == "local" or l_1_0.type == "remote" or l_1_0.type == nil and type(l_1_0.enabled) == "boolean")
  end
  
  local function l_0_22(l_2_0, l_2_1)
    local l_2_2 = l_2_0[l_2_1]
    if type(l_2_2) == "boolean" then
      if l_2_1 == "enabled" then
        return not l_2_2
      end
      return l_2_2
    end
    if l_2_2 == nil then
      if l_2_0.type == "remote" and type(l_2_0.url) == "string" and l_2_0.url ~= "" then
        return false
      end
      if l_2_0.type == "local" and type(l_2_0.command) == "table" and type(l_2_0.command[1]) == "string" and l_2_0.command[1] ~= "" then
        return false
      end
    end
  end
  
  local l_0_23 = {}
  local l_0_24 = {}
  for l_0_25, l_0_26 in pairs(l_0_8.mcp) do
    if type(l_0_25) == "string" and type(l_0_26) == "table" and (l_0_25 ~= "servers" and l_0_25 ~= "timeout" or l_0_21(l_0_26)) then
      l_0_23[l_0_25] = l_0_26
      l_0_24[l_0_25] = l_0_22(l_0_26, "enabled")
    end
  end
  local l_0_27 = l_0_8.mcp.servers
  if type(l_0_27) == "table" and not l_0_21(l_0_27) then
    for l_0_28, l_0_29 in pairs(l_0_27) do
      if type(l_0_28) == "string" and type(l_0_29) == "table" then
        l_0_23[l_0_28] = l_0_29
        l_0_24[l_0_28] = l_0_22(l_0_29, "disabled")
      end
    end
  end
  local l_0_30 = McpParseHelper(l_0_23)
  for l_0_31, l_0_32 in ipairs(l_0_30) do
    l_0_32.Disabled = l_0_24[l_0_32.ServerName]
  end
  l_0_9.mcpServers = {}
  table.insert(l_0_9.mcpServers, l_0_30)
end
if not isnull(l_0_8.server) and type(l_0_8.server) == "table" then
  l_0_9.gateway = {
    host = l_0_8.server.hostname,
    port = l_0_8.server.port
  }
end
local l_0_33 = safeJsonSerialize(l_0_9)
local l_0_34, l_0_35 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_34 and l_0_35 ~= nil then
  for l_0_36, l_0_37 in pairs(l_0_35) do
    if l_0_36 == l_0_4 and l_0_37 == l_0_33 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_33, l_0_5, 100)
local l_0_38 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_38 then
  MpCommon.BmTriggerSig(l_0_38, "AIDiscovery_opencode_json", l_0_33)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
