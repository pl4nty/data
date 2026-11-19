-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_copilot_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:FnameAttr!config.json") and not mp.get_mpattribute("Lua:FnameAttr!settings.json") then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!.copilot") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_copilot_json"
local l_0_4 = string.lower("ai_copilot_json" .. l_0_1)
local l_0_5 = 86400
local l_0_6 = mp.getfilesize()
if 1024000 < l_0_6 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = tostring(mp.readfile(0, l_0_6))
mp.readprotection(true)
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 then
  return mp.CLEAN
end

local function l_0_9(l_1_0, ...)
  if type(l_1_0) ~= "table" then
    return nil
  end
  local l_1_1 = l_1_0
  for l_1_2, l_1_3 in ipairs({
    ...
  }) do
    if type(l_1_1) ~= "table" or l_1_1[l_1_3] == nil then
      return nil
    end
    l_1_1 = l_1_1[l_1_3]
  end
  return l_1_1
end

local l_0_10 = {
  model = l_0_9(l_0_8, "model"),
  reasoning_effort = l_0_9(l_0_8, "reasoning_effort"),
  marketplaces = l_0_9(l_0_8, "marketplaces")
}
local l_0_11 = l_0_8.mcpServers or l_0_8.servers or l_0_8.mcp.servers
if next(l_0_11) then
  l_0_10.mcpServers = {}
  table.insert(l_0_10.mcpServers, McpParseHelper(l_0_11))
end
if isnull(l_0_10) then
  return mp.CLEAN
end
local l_0_12 = safeJsonSerialize(l_0_10)
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
  MpCommon.BmTriggerSig(l_0_17, "AIDiscovery_copilot_json", l_0_12)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
