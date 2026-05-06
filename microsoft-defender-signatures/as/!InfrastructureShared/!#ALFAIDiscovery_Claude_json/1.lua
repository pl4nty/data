-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_claude_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!.claude.json") and (not (mp.get_mpattribute)("Lua:LastFolder0!.claude") or (mp.get_mpattribute)("Lua:FnameAttr!settings.json") or not (mp.get_mpattribute)("Lua:FnameAttr!settings.local.json")) then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_claude_json"
local l_0_4 = (string.lower)("ai_claude_json_" .. l_0_1)
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
if not l_0_8 then
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
if not l_0_8.projects then
  for l_0_14,l_0_15 in pairs({}) do
    local l_0_16 = {}
    l_0_16.projectPath = l_0_14
    l_0_16.lastModel = nil
    l_0_16.mcpServers = {}
    if not l_0_15.enabledMcpjsonServers then
      l_0_16.enabledMcpjsonServers = {}
      if not l_0_15.disabledMcpjsonServers then
        l_0_16.disabledMcpjsonServers = {}
        if not l_0_15.disabledMcpServers then
          l_0_16.disabledMcpServers = {}
          if l_0_15.lastModelUsage then
            for l_0_20,l_0_21 in pairs(l_0_15.lastModelUsage) do
              l_0_16.lastModel = l_0_20
              do break end
            end
          end
          do
            do
              do
                if not l_0_15.mcpServers and not l_0_15.servers and l_0_15.mcp then
                  local l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27 = (l_0_15.mcp).servers
                end
                -- DECOMPILER ERROR at PC150: Confused about usage of register: R17 in 'UnsetPending'

                -- DECOMPILER ERROR at PC155: Confused about usage of register: R17 in 'UnsetPending'

                if not isnull(l_0_22) and type(l_0_22) == "table" then
                  l_0_10.mcpServers = {}
                  -- DECOMPILER ERROR at PC165: Confused about usage of register: R17 in 'UnsetPending'

                  ;
                  (table.insert)(l_0_10.mcpServers, McpParseHelper(l_0_22))
                end
                ;
                (table.insert)(l_0_10, l_0_16)
                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  l_0_10.permissions = l_0_9(l_0_8, "permissions")
  l_0_10.model = l_0_9(l_0_8, "model")
  l_0_10.availableModels = l_0_9(l_0_8, "availableModels")
  l_0_10.modelOverrides = l_0_9(l_0_8, "modelOverrides")
  l_0_10.effortLevel = l_0_9(l_0_8, "effortLevel")
  l_0_10.agent = l_0_9(l_0_8, "agent")
  l_0_10.enableAllProjectMcpServers = l_0_9(l_0_8, "enableAllProjectMcpServers")
  l_0_10.enabledMcpjsonServers = l_0_9(l_0_8, "enabledMcpjsonServers")
  l_0_10.disabledMcpjsonServers = l_0_9(l_0_8, "disabledMcpjsonServers")
  l_0_10.allowedMcpServers = l_0_9(l_0_8, "allowedMcpServers")
  l_0_10.deniedMcpServers = l_0_9(l_0_8, "deniedMcpServers")
  if isnull(l_0_10) then
    return mp.CLEAN
  end
  local l_0_28 = safeJsonSerialize(l_0_10)
  local l_0_29, l_0_30 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
  if l_0_29 and l_0_30 ~= nil then
    for l_0_34,l_0_35 in pairs(l_0_30) do
      if l_0_34 == l_0_4 and l_0_35 == l_0_28 then
        return mp.CLEAN
      end
    end
  end
  do
    AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_28, l_0_5, 100)
    ;
    (mp.SetDetectionString)(l_0_28)
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.INFECTED
  end
end

