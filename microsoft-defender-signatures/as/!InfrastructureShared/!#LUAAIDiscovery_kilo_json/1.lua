-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_kilo_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_mpattribute("Lua:FnameAttr!kilo.json") or mp.get_mpattribute("Lua:FnameAttr!kilo.jsonc")
local l_0_2 = mp.get_mpattribute("Lua:FnameAttr!config.json")
local l_0_3 = mp.get_mpattribute("Lua:LastFolder0!.kilocode") or mp.get_mpattribute("Lua:LastFolder0!.kilo")
local l_0_4 = mp.get_mpattribute("Lua:LastFolder0!kilo") and mp.get_mpattribute("Lua:LastFolder1!.config")
local l_0_5 = mp.get_mpattribute("Lua:LastFolder0!kilo")
if (not l_0_1 or not l_0_3 and not l_0_5) and (not l_0_2 or not l_0_4) then
  return mp.CLEAN
end
local l_0_6 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if isnull(l_0_6) then
  return mp.CLEAN
end
local l_0_7 = mp.getfilesize()
if type(l_0_7) ~= "number" or l_0_7 < 0 or 1024000 < l_0_7 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_8 = mp.readfile(0, l_0_7)
mp.readprotection(true)
if isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = safeJsonDeserialize(tostring(l_0_8))
if type(l_0_9) ~= "table" or type(l_0_9.mcp) ~= "table" then
  return mp.CLEAN
end
local l_0_10 = {}
for l_0_11, l_0_12 in pairs(l_0_9.mcp) do
  if type(l_0_11) == "string" and type(l_0_12) == "table" then
    l_0_10[l_0_11] = l_0_12
  end
end
local l_0_13 = safeJsonSerialize({
  configFilePath = l_0_6,
  mcpServers = {
    McpParseHelper(l_0_10)
  }
})
if isnull(l_0_13) then
  return mp.CLEAN
end
local l_0_14 = "ai_kilo_json"
local l_0_15 = l_0_14 .. "_" .. l_0_6
local l_0_16, l_0_17 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_14, "ai_discovery_scan")
if l_0_16 and l_0_17 ~= nil then
  for l_0_18, l_0_19 in pairs(l_0_17) do
    if l_0_18 == l_0_15 and l_0_19 == l_0_13 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_14, "ai_discovery_scan", l_0_15, l_0_13, 86400, 100)
local l_0_20 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_20 then
  MpCommon.BmTriggerSig(tostring(l_0_20), "AIDiscovery_kilo_json", l_0_13)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
