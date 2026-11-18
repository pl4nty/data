-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_goose_yaml
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: (Lua:YAMLExt | Lua:YMLExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute("Lua:FnameAttr!config.yaml") or mp.get_mpattribute("Lua:FnameAttr!config.yml")) or not mp.get_mpattribute("Lua:LastFolder0!goose") and (not (mp.get_mpattribute("Lua:LastFolder0!config") and mp.get_mpattribute("Lua:LastFolder1!goose")) or not mp.get_mpattribute("Lua:LastFolder2!block")) then
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
local l_0_4, l_0_5, l_0_6 = pcall(MpCommon.YamlDeserialize, tostring(l_0_3))
if not l_0_4 or l_0_6 ~= "ok" or type(l_0_5) ~= "table" or type(l_0_5.extensions) ~= "table" then
  return mp.CLEAN
end
local l_0_7 = {}
for l_0_8, l_0_9 in pairs(l_0_5.extensions) do
  if type(l_0_8) == "string" and type(l_0_9) == "table" then
    l_0_7[l_0_8] = {
      command = l_0_9.cmd,
      args = l_0_9.args,
      env = l_0_9.envs,
      url = l_0_9.uri,
      type = l_0_9.type
    }
  end
end
local l_0_10 = safeJsonSerialize({
  configFilePath = l_0_1,
  mcpServers = {
    McpParseHelper(l_0_7)
  }
})
if isnull(l_0_10) then
  return mp.CLEAN
end
local l_0_11 = "ai_goose_yaml"
local l_0_12 = l_0_11 .. "_" .. l_0_1
local l_0_13, l_0_14 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_11, "ai_discovery_scan")
if l_0_13 and l_0_14 ~= nil then
  for l_0_15, l_0_16 in pairs(l_0_14) do
    if l_0_15 == l_0_12 and l_0_16 == l_0_10 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_11, "ai_discovery_scan", l_0_12, l_0_10, 86400, 100)
local l_0_17 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_17 then
  MpCommon.BmTriggerSig(tostring(l_0_17), "AIDiscovery_goose_yaml", l_0_10)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
