-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_grokbuild_toml
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:TOMLExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute("Lua:FnameAttr!config.toml") or mp.get_mpattribute("Lua:FnameAttr!managed_config.toml") or mp.get_mpattribute("Lua:FnameAttr!requirements.toml")) or not mp.get_mpattribute("Lua:LastFolder0!.grok") then
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
local l_0_4, l_0_5 = pcall(MpCommon.TomlDeserialize, tostring(l_0_3))
if not l_0_4 or type(l_0_5) ~= "table" or type(l_0_5.mcp_servers) ~= "table" then
  return mp.CLEAN
end
local l_0_6 = {}
for l_0_7, l_0_8 in pairs(l_0_5.mcp_servers) do
  if type(l_0_7) == "string" and type(l_0_8) == "table" then
    l_0_6[l_0_7] = l_0_8
  end
end
local l_0_9 = safeJsonSerialize({
  configFilePath = l_0_1,
  mcpServers = {
    McpParseHelper(l_0_6)
  }
})
if isnull(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = "ai_grok_build_toml"
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
  MpCommon.BmTriggerSig(tostring(l_0_16), "AIDiscovery_grokbuild_toml", l_0_9)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
