-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_openclaw_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!openclaw.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_openclaw_json"
local l_0_4 = (string.lower)("ai_openclaw_json" .. l_0_1)
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
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 or not l_0_8.agents then
  return mp.CLEAN
end
local l_0_9 = function(l_1_0, ...)
  -- function num : 0_0
  if type(l_1_0) ~= "table" then
    return nil
  end
  for l_1_5,l_1_6 in ipairs({...}) do
    local l_1_2 = l_1_0
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R7 in 'UnsetPending'

    if type(l_1_2) ~= "table" or l_1_2[R7_PC19] == nil then
      return nil
    end
    l_1_2 = l_1_2[R7_PC19]
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  return l_1_2
end

local l_0_10 = {}
l_0_10.workspace = l_0_9(l_0_8, "agents", "defaults", "workspace")
l_0_10.model_primary = l_0_9(l_0_8, "agents", "defaults", "model", "primary")
l_0_10.model_fallbacks = l_0_9(l_0_8, "agents", "defaults", "model", "fallbacks")
l_0_10.model_defaults = l_0_9(l_0_8, "agents", "defaults", "models")
l_0_10.tools_allow = l_0_9(l_0_8, "tools", "allow")
l_0_10.tools_deny = l_0_9(l_0_8, "tools", "deny")
l_0_10.tools_elevated = l_0_9(l_0_8, "tools", "elevated")
local l_0_11 = l_0_9(l_0_8, "gateway", "mode")
if not isnull(l_0_11) and type(l_0_11) == "string" then
  local l_0_12 = {}
  l_0_12.mode = (string.lower)(l_0_11)
  if l_0_12.mode == "remote" then
    local l_0_13 = l_0_9(l_0_8, "gateway", "remote", "url")
    if not isnull(l_0_13) then
      local l_0_14 = ExtractPartsFromUri(l_0_13)
      l_0_12.host = l_0_14.host
      l_0_12.port = l_0_14.port
    end
  else
    do
      local l_0_15 = (l_0_9(l_0_8, "gateway", "bind"))
      local l_0_16 = nil
      if not isnull(l_0_15) and type(l_0_15) == "string" then
        local l_0_17 = (string.lower)(l_0_15)
        if l_0_17 == "loopback" then
          l_0_16 = "127.0.0.1"
        else
          if l_0_17 == "custom" then
            local l_0_18 = l_0_9(l_0_8, "gateway", "customBindHost")
            if not isnull(l_0_18) and type(l_0_18) == "string" then
              l_0_16 = l_0_18
            end
          else
            do
              do
                do
                  do
                    l_0_16 = "0.0.0.0"
                    l_0_12.host = l_0_16
                    l_0_12.port = l_0_9(l_0_8, "gateway", "port")
                    l_0_10.gateway = l_0_12
                    local l_0_19 = l_0_9(l_0_8, "models", "providers")
                    do
                      if not isnull(l_0_19) and type(l_0_19) == "table" then
                        local l_0_20 = {}
                        for l_0_24,l_0_25 in pairs(l_0_19) do
                          local l_0_26 = {}
                          l_0_26.baseUrl = l_0_25.baseUrl
                          l_0_26.models = {}
                          if not isnull(l_0_25.models) and type(l_0_25.models) == "table" then
                            for l_0_30,l_0_31 in pairs(l_0_25.models) do
                              (table.insert)(l_0_26.models, l_0_31.id)
                            end
                          end
                          do
                            do
                              l_0_20[l_0_24] = l_0_26
                              -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out DO_STMT

                            end
                          end
                        end
                        l_0_10.providers = l_0_20
                      end
                      if isnull(l_0_10) then
                        return mp.CLEAN
                      end
                      do
                        if not l_0_8.mcpServers and not l_0_8.servers and l_0_8.mcp then
                          local l_0_32, l_0_33, l_0_34, l_0_35, l_0_36, l_0_37 = (l_0_8.mcp).servers
                        end
                        -- DECOMPILER ERROR at PC298: Confused about usage of register: R13 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC303: Confused about usage of register: R13 in 'UnsetPending'

                        if not isnull(l_0_32) and type(l_0_32) == "table" then
                          l_0_10.mcpServers = {}
                          -- DECOMPILER ERROR at PC313: Confused about usage of register: R13 in 'UnsetPending'

                          ;
                          (table.insert)(l_0_10.mcpServers, McpParseHelper(l_0_32))
                        end
                        local l_0_38 = nil
                        local l_0_39, l_0_40 = safeJsonSerialize(l_0_10), pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
                        if l_0_40 and MpCommon.RollingQueueQueryKVNamespaced ~= nil then
                          for l_0_44,l_0_45 in pairs(R18_PC331) do
                            local l_0_41 = nil
                            if l_0_45 == l_0_4 and l_0_28 == l_0_39 then
                              return mp.CLEAN
                            end
                          end
                        end
                        do
                          AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_39, l_0_5, 100)
                          local l_0_46 = nil
                          if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) then
                            (MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "AIDiscovery_openclaw_json", l_0_39)
                          end
                          ;
                          (mp.SetDetectionString)(l_0_39)
                          ;
                          (mp.set_mpattribute)("MpDisableCaching")
                          return mp.INFECTED
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

