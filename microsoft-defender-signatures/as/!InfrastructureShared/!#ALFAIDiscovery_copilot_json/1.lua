-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_copilot_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!config.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not (string.find)(l_0_1, "\\.copilot\\config.json", 1, false) then
  return mp.CLEAN
end
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_copilot_json"
local l_0_4 = (string.lower)("ai_copilot_json" .. l_0_1)
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
l_0_10.model = l_0_9(l_0_8, "model")
l_0_10.reasoning_effort = l_0_9(l_0_8, "reasoning_effort")
l_0_10.marketplaces = l_0_9(l_0_8, "marketplaces")
do
  if not l_0_8.mcpServers and not l_0_8.servers then
    local l_0_11, l_0_12, l_0_13, l_0_14 = (l_0_8.mcp).servers
  end
  -- DECOMPILER ERROR at PC118: Confused about usage of register: R11 in 'UnsetPending'

  -- DECOMPILER ERROR at PC126: Confused about usage of register: R11 in 'UnsetPending'

  if next(l_0_11) then
    (table.insert)(l_0_10.mcpServers, McpParseHelper(l_0_11))
  end
  if isnull(l_0_10) then
    return mp.CLEAN
  end
  local l_0_15 = nil
  local l_0_16, l_0_17 = safeJsonSerialize(l_0_10), pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
  if l_0_17 and MpCommon.RollingQueueQueryKVNamespaced ~= nil then
    for l_0_21,l_0_22 in pairs(R16_PC152) do
      local l_0_18 = nil
      -- DECOMPILER ERROR at PC156: Confused about usage of register: R19 in 'UnsetPending'

      if l_0_22 == l_0_4 and R19_PC156 == l_0_16 then
        return mp.CLEAN
      end
    end
  end
  do
    AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_16, l_0_5, 100)
    ;
    (mp.SetDetectionString)(l_0_16)
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.INFECTED
  end
end

