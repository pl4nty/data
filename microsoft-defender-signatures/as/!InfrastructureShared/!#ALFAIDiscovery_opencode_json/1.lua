-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_opencode_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!opencode.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_opencode_config_json"
local l_0_4 = "ai_opencode_config_json_" .. l_0_1
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
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = {}
l_0_9.model = l_0_8.model
l_0_9.smallModel = l_0_8.small_model
l_0_9.autoUpdate = l_0_8.autoupdate
l_0_9.tools = l_0_8.tools
l_0_9.plugins = l_0_8.plugin
l_0_9.permissions = nil
l_0_9.providers = nil
l_0_9.mcpServers = nil
l_0_9.gateway = nil
if not isnull(l_0_8.permission) and type(l_0_8.permission) == "table" then
  l_0_9.permissions = {}
  for l_0_13,l_0_14 in pairs(l_0_8.permission) do
    -- DECOMPILER ERROR at PC122: Confused about usage of register: R15 in 'UnsetPending'

    if type(l_0_13) == "string" then
      if type(l_0_14) == "string" then
        (l_0_9.permissions)[l_0_13] = l_0_14
      else
        if type(l_0_14) == "table" then
          local l_0_15 = {}
          for l_0_19,l_0_20 in pairs(l_0_14) do
            if type(l_0_19) == "string" and type(l_0_20) == "string" then
              l_0_15[l_0_19] = l_0_20
            end
          end
          -- DECOMPILER ERROR at PC148: Confused about usage of register: R16 in 'UnsetPending'

          ;
          (l_0_9.permissions)[l_0_13] = l_0_15
        end
      end
    end
  end
end
do
  if not isnull(l_0_8.provider) and type(l_0_8.provider) == "table" then
    l_0_9.providers = {}
    for l_0_24,l_0_25 in pairs(l_0_8.provider) do
      if type(l_0_24) == "string" and type(l_0_25) == "table" then
        local l_0_26 = {}
        l_0_26.name = (string.lower)(l_0_24)
        l_0_26.api = l_0_25.api
        l_0_26.id = l_0_25.id
        if not isnull(l_0_25.options) and type(l_0_25.options) == "table" then
          if not (l_0_25.options).baseURL then
            l_0_26.baseURL = (l_0_25.options).enterpriseUrl
            do
              do
                if not isnull(l_0_25.models) and type(l_0_25.models) == "table" then
                  local l_0_27 = {}
                  for l_0_31,l_0_32 in pairs(l_0_25.models) do
                    (table.insert)(l_0_27, (string.lower)(l_0_31))
                  end
                  l_0_26.models = l_0_27
                end
                ;
                (table.insert)(l_0_9.providers, l_0_26)
                -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC235: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  if not isnull(l_0_8.mcp) and type(l_0_8.mcp) == "table" then
    l_0_9.mcpServers = {}
    ;
    (table.insert)(l_0_9.mcpServers, McpParseHelper(l_0_8.mcp))
  end
  do
    if not isnull(l_0_8.server) and type(l_0_8.server) == "table" then
      local l_0_33 = {}
      l_0_33.host = (l_0_8.server).hostname
      l_0_33.port = (l_0_8.server).port
      l_0_9.gateway = l_0_33
    end
    local l_0_34 = safeJsonSerialize(l_0_9)
    local l_0_35, l_0_36 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
    if l_0_35 and l_0_36 ~= nil then
      for l_0_40,l_0_41 in pairs(l_0_36) do
        if l_0_40 == l_0_4 and l_0_41 == l_0_34 then
          return mp.CLEAN
        end
      end
    end
    do
      AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_34, l_0_5, 100)
      local l_0_42 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      if l_0_42 then
        (MpCommon.BmTriggerSig)(l_0_42, "AIDiscovery_opencode_json", l_0_34)
      end
      ;
      (mp.SetDetectionString)(l_0_34)
      ;
      (mp.set_mpattribute)("MpDisableCaching")
      return mp.INFECTED
    end
  end
end

