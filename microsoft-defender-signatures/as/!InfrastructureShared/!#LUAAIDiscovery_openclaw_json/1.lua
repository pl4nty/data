-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_openclaw_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if r0_0 ~= mp.SCANREASON_ONOPEN and r0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:FnameAttr!openclaw.json") then
  local r0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  local r0_2, r0_3 = "ai_discovery_scan", "ai_openclaw_json"
  local r0_4 = string.lower("ai_openclaw_json" .. r0_1)
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
    if r0_8 and r0_8.agents then
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

      local r0_10 = {
        workspace = r0_9(r0_8, "agents", "defaults", "workspace"),
        model_primary = r0_9(r0_8, "agents", "defaults", "model", "primary"),
        model_fallbacks = r0_9(r0_8, "agents", "defaults", "model", "fallbacks"),
        model_defaults = r0_9(r0_8, "agents", "defaults", "models"),
        tools_allow = r0_9(r0_8, "tools", "allow"), tools_deny = r0_9(r0_8, "tools", "deny"),
        tools_elevated = r0_9(r0_8, "tools", "elevated")
      }
      local r0_11 = r0_9(r0_8, "gateway", "mode")
      if not isnull(r0_11) and type(r0_11) == "string" then
        local r0_12 = { mode = string.lower(r0_11) }
        if r0_12.mode == "remote" then
          local r0_13 = r0_9(r0_8, "gateway", "remote", "url")
          if not isnull(r0_13) then
            local r0_14 = ExtractPartsFromUri(r0_13)
            r0_12.host = r0_14.host
            r0_12.port = r0_14.port
          end
        else
          local r0_13 = r0_9(r0_8, "gateway", "bind")
          local r0_15 = nil
          if not (isnull(r0_13) or type(r0_13) ~= "string") then
            local r0_16 = string.lower(r0_13)
            if r0_16 == "loopback" then
              r0_15 = "127.0.0.1"
            elseif r0_16 == "custom" then
              local r0_17 = r0_9(r0_8, "gateway", "customBindHost")
              if not (isnull(r0_17) or type(r0_17) ~= "string") then
                r0_15 = r0_17
              end
            else
              r0_15 = "0.0.0.0"
            end
          end
          r0_12.host = r0_15
          r0_12.port = r0_9(r0_8, "gateway", "port")
        end
        r0_10.gateway = r0_12
      end
      local r0_18 = r0_9(r0_8, "models", "providers")
      if not isnull(r0_18) and type(r0_18) == "table" then
        local r0_19 = {}
        for r0_20, r0_21 in pairs(r0_18) do
          local r0_22 = { baseUrl = r0_21.baseUrl, models = {} }
          if not isnull(r0_21.models) and type(r0_21.models) == "table" then
            for r0_23, r0_24 in pairs(r0_21.models) do
              table.insert(r0_22.models, r0_24.id)
            end
          end
          r0_19[r0_20] = r0_22
        end
        r0_10.providers = r0_19
      end
      if isnull(r0_10) then
        return mp.CLEAN
      end
      local r0_25 = r0_8.mcpServers or r0_8.servers or r0_8.mcp and r0_8.mcp.servers
      if not isnull(r0_25) and type(r0_25) == "table" then
        r0_10.mcpServers = {}
        table.insert(r0_10.mcpServers, McpParseHelper(r0_25))
      end
      local r0_26 = ""
      if versioning.GetHostOsType() == 1 then
        local r0_27 = mp.ContextualExpandEnvironmentVariables("%APPDATA%")
        if not (isnull(r0_27) or r0_27 == "") then
          r0_26 = r0_27 .. "\\npm\\node_modules\\openclaw\\package.json"
        end
      else
        r0_26 = "/usr/local/lib/node_modules/openclaw/package.json"
      end
      if r0_26 and sysio.IsFileExists(r0_26) then
        local r0_28 = sysio.ReadFile(r0_26, 0, 300)
        if r0_28 then
          local r0_29 = tostring(r0_28):match('"version"%s*:%s*"([^"]+)"')
          if r0_29 then
            r0_10.version = r0_29
          end
        end
      end
      local r0_30 = safeJsonSerialize(r0_10)
      local r0_31, r0_32 = pcall(MpCommon.RollingQueueQueryKVNamespaced, r0_3, r0_2)
      if r0_31 and r0_32 ~= nil then
        for r0_33, r0_34 in pairs(r0_32) do
          if r0_33 == r0_4 and r0_34 == r0_30 then
            return mp.CLEAN
          end
        end
      end
      AppendToRollingQueueNamespaced(r0_3, r0_2, r0_4, r0_30, r0_5, 100)
      local r0_35 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
      if r0_35 then
        MpCommon.BmTriggerSig(r0_35, "AIDiscovery_openclaw_json", r0_30)
      end
      mp.set_mpattribute("MpDisableCaching")
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
