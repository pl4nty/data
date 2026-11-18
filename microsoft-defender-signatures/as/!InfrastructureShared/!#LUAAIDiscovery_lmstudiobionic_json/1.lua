-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_lmstudiobionic_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute("Lua:FnameAttr!ng-mcp.json") and mp.get_mpattribute("Lua:LastFolder0!.internal") and mp.get_mpattribute("Lua:LastFolder1!bionic") and mp.get_mpattribute("Lua:LastFolder2!apps")) or not mp.get_mpattribute("Lua:LastFolder3!.lmstudio") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if type(l_0_2) ~= "number" or l_0_2 < 0 or 1024000 < l_0_2 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(0, l_0_2)
mp.readprotection(true)
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = safeJsonDeserialize(tostring(l_0_3))
if type(l_0_4) ~= "table" or type(l_0_4.servers) ~= "table" then
  return mp.CLEAN
end
local l_0_5 = {}
for l_0_6, l_0_7 in ipairs(l_0_4.servers) do
  if type(l_0_7) == "table" and type(l_0_7.connection) == "table" then
    local l_0_8 = l_0_7.id or l_0_7.name
    if type(l_0_8) == "string" and l_0_8 ~= "" then
      if l_0_5[l_0_8] ~= nil then
        l_0_8 = l_0_8 .. "#" .. tostring(l_0_6)
      end
      l_0_5[l_0_8] = l_0_7.connection
    end
  end
end
local l_0_9 = safeJsonSerialize({
  configFilePath = l_0_1,
  mcpServers = {
    McpParseHelper(l_0_5)
  }
})
if isnull(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = "ai_bionic_json"
local l_0_11 = l_0_10 .. "_" .. l_0_1
local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_10, "ai_discovery_scan")
if l_0_12 and l_0_13 ~= nil then
  for l_0_14, l_0_15 in pairs(l_0_13) do
    if l_0_14 == l_0_11 and l_0_15 == l_0_9 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_10, "ai_discovery_scan", l_0_11, l_0_9, 86400, 100)
local l_0_16 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_16 then
  MpCommon.BmTriggerSig(tostring(l_0_16), "AIDiscovery_lmstudiobionic_json", l_0_9)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
