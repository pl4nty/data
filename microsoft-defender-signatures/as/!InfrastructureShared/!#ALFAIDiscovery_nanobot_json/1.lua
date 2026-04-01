-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_nanobot_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder0!.nanobot") or not (mp.get_mpattribute)("Lua:FnameAttr!config.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_nanobot_config_json"
local l_0_4 = "ai_nanobot_config_json_" .. l_0_1
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
l_0_9.defaultAgent = {}
l_0_9.customAgents = {}
l_0_9.mcpServers = {}
l_0_9.toolExecEnable = true
local l_0_10 = {}
l_0_10.host = (l_0_8.gateway).host or "0.0.0.0"
l_0_10.port = (l_0_8.gateway).port or 18790
l_0_9.gateway = l_0_10
l_0_10 = isnull
l_0_10 = l_0_10(l_0_8.agents)
if not l_0_10 then
  l_0_10 = type
  l_0_10 = l_0_10(l_0_8.agents)
  if l_0_10 == "table" then
    l_0_10 = pairs
    l_0_10 = l_0_10(l_0_8.agents)
    for l_0_14,i_2 in l_0_10 do
      if type(l_0_13) == "string" and type(l_0_14) == "table" then
        if l_0_13 == "defaults" then
          local l_0_15 = {}
          l_0_15.model = (string.lower)(l_0_14.model or "")
          l_0_15.provider = (string.lower)(l_0_14.provider or "")
          l_0_9.defaultAgent = l_0_15
        else
          do
            local l_0_16 = table.insert
            local l_0_17 = l_0_9.customAgents
            do
              local l_0_18 = {}
              l_0_18.agentName = (string.lower)(l_0_13)
              l_0_18.model = (string.lower)(l_0_14.model or "")
              l_0_18.provider = (string.lower)(l_0_14.provider or "")
              l_0_16(l_0_17, l_0_18)
              -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end
if not isnull(l_0_8.tools) and type(l_0_8.tools) == "table" then
  if not isnull((l_0_8.tools).mcpServers) and type((l_0_8.tools).mcpServers) == "table" then
    (table.insert)(l_0_9.mcpServers, McpParseHelper((l_0_8.tools).mcpServers))
  end
  if not isnull((l_0_8.tools).exec) and type((l_0_8.tools).exec) == "table" then
    l_0_9.toolExecEnable = ((l_0_8.tools).exec).enable
  end
end
local l_0_19 = nil
local l_0_20, l_0_21 = nil
if l_0_19 and l_0_20 ~= nil then
  for l_0_25,l_0_26 in l_0_21 do
    local l_0_26 = nil
    if l_0_24 == l_0_4 and l_0_25 == safeJsonSerialize(l_0_9) then
      l_0_26 = mp
      l_0_26 = l_0_26.CLEAN
      return l_0_26
    end
  end
end
do
  -- DECOMPILER ERROR at PC253: Overwrote pending register: R13 in 'AssignReg'

  l_0_21(l_0_3, l_0_2, l_0_4, safeJsonSerialize(l_0_9), l_0_5, 100)
  ;
  (mp.SetDetectionString)(safeJsonSerialize(l_0_9))
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC272: Confused about usage of register R13 for local variables in 'ReleaseLocals'

end

