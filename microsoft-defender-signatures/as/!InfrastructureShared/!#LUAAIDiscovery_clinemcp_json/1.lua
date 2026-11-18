-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_clinemcp_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute("Lua:FnameAttr!cline_mcp_settings.json") and mp.get_mpattribute("Lua:LastFolder0!settings")) or (not mp.get_mpattribute("Lua:LastFolder1!data") or not mp.get_mpattribute("Lua:LastFolder2!.cline")) and (not (mp.get_mpattribute("Lua:LastFolder1!saoudrizwan.claude-dev") and mp.get_mpattribute("Lua:LastFolder2!globalstorage")) or not mp.get_mpattribute("Lua:LastFolder3!user")) then
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
if type(l_0_4) ~= "table" or type(l_0_4.mcpServers) ~= "table" then
  return mp.CLEAN
end
local l_0_5 = {}
for l_0_6, l_0_7 in pairs(l_0_4.mcpServers) do
  if type(l_0_6) == "string" and type(l_0_7) == "table" then
    l_0_5[l_0_6] = type(l_0_7.transport) == "table" and l_0_7.transport or l_0_7
  end
end
local l_0_8 = safeJsonSerialize({
  configFilePath = l_0_1,
  mcpServers = {
    McpParseHelper(l_0_5)
  }
})
if isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = "ai_cline_mcp_json"
local l_0_10 = l_0_9 .. "_" .. l_0_1
local l_0_11, l_0_12 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_9, "ai_discovery_scan")
if l_0_11 and l_0_12 ~= nil then
  for l_0_13, l_0_14 in pairs(l_0_12) do
    if l_0_13 == l_0_10 and l_0_14 == l_0_8 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_9, "ai_discovery_scan", l_0_10, l_0_8, 86400, 100)
local l_0_15 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_15 then
  MpCommon.BmTriggerSig(tostring(l_0_15), "AIDiscovery_clinemcp_json", l_0_8)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
