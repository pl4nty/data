-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_claude_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if r0_0 ~= mp.SCANREASON_ONOPEN and r0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:FnameAttr!.claude.json")
  and (not mp.get_mpattribute("Lua:LastFolder0!.claude")
    or not mp.get_mpattribute("Lua:FnameAttr!settings.json")
      and not mp.get_mpattribute("Lua:FnameAttr!settings.local.json")) then
  return mp.CLEAN
end
local r0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local r0_2, r0_3 = "ai_discovery_scan", "ai_claude_json"
local r0_4 = string.lower("ai_claude_json_" .. r0_1)
local r0_5 = 86400
local r0_6 = mp.getfilesize()
if r0_6 > 1024000 then
  return mp.CLEAN
end
mp.readprotection(false)
local r0_7 = tostring(mp.readfile(0, r0_6))
mp.readprotection(true)
if r0_7 then
  local r0_8 = safeJsonDeserialize(r0_7)
  if r0_8 then
    local function r0_9(p1_0, ...)
      if type(p1_0) == "table" then
        local r1_1 = p1_0
        for r1_2, r1_3 in ipairs({ ... }) do
          if type(r1_1) ~= "table" or r1_1[r1_3] == nil then
            return nil
          end
          r1_1 = r1_1[r1_3]
        end
        return r1_1
      end
      return nil
    end

    local r0_10 = {}
    for r0_11, r0_12 in pairs(r0_8.projects or {}) do
      local r0_13 = {
        projectPath = r0_11, lastModel = nil, mcpServers = {},
        enabledMcpjsonServers = r0_12.enabledMcpjsonServers or {},
        disabledMcpjsonServers = r0_12.disabledMcpjsonServers or {},
        disabledMcpServers = r0_12.disabledMcpServers or {}
      }
      if r0_12.lastModelUsage then
        for r0_14, r0_15 in pairs(r0_12.lastModelUsage) do
          r0_13.lastModel = r0_14
          break
        end
      end
      local r0_16 = r0_12.mcpServers or r0_12.servers or r0_12.mcp and r0_12.mcp.servers
      if not isnull(r0_16) and type(r0_16) == "table" then
        r0_10.mcpServers = {}
        table.insert(r0_10.mcpServers, McpParseHelper(r0_16))
      end
      table.insert(r0_10, r0_13)
    end
    r0_10.permissions = r0_9(r0_8, "permissions")
    r0_10.model = r0_9(r0_8, "model")
    r0_10.availableModels = r0_9(r0_8, "availableModels")
    r0_10.modelOverrides = r0_9(r0_8, "modelOverrides")
    r0_10.effortLevel = r0_9(r0_8, "effortLevel")
    r0_10.agent = r0_9(r0_8, "agent")
    r0_10.enableAllProjectMcpServers = r0_9(r0_8, "enableAllProjectMcpServers")
    r0_10.enabledMcpjsonServers = r0_9(r0_8, "enabledMcpjsonServers")
    r0_10.disabledMcpjsonServers = r0_9(r0_8, "disabledMcpjsonServers")
    r0_10.allowedMcpServers = r0_9(r0_8, "allowedMcpServers")
    r0_10.deniedMcpServers = r0_9(r0_8, "deniedMcpServers")
    r0_10.hooks = r0_9(r0_8, "hooks")
    if isnull(r0_10) then
      return mp.CLEAN
    end
    local r0_17 = safeJsonSerialize(r0_10)
    local r0_18, r0_19 = pcall(MpCommon.RollingQueueQueryKVNamespaced, r0_3, r0_2)
    if r0_18 and r0_19 ~= nil then
      for r0_20, r0_21 in pairs(r0_19) do
        if r0_20 == r0_4 and r0_21 == r0_17 then
          return mp.CLEAN
        end
      end
    end
    AppendToRollingQueueNamespaced(r0_3, r0_2, r0_4, r0_17, r0_5, 100)
    local r0_22 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if r0_22 then
      MpCommon.BmTriggerSig(r0_22, "AIDiscovery_claude_json", r0_17)
    end
    mp.set_mpattribute("MpDisableCaching")
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
