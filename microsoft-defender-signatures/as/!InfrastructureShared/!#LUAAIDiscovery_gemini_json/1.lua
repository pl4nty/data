-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_gemini_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!.gemini") or not mp.get_mpattribute("Lua:FnameAttr!settings.json") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_gemini_settings_json"
local l_0_4 = "ai_gemini_settings_json_" .. l_0_1
local l_0_5 = 86400
local l_0_6 = mp.getfilesize()
if 1024000 < l_0_6 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = tostring(mp.readfile(0, l_0_6))
mp.readprotection(true)
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 then
  return mp.CLEAN
end

local function l_0_9(l_1_0, l_1_1, l_1_2)
  if l_1_0 and not isnull(l_1_0[l_1_1]) then
    return l_1_0[l_1_1]
  else
    return l_1_2
  end
end

local l_0_10 = {
  defaultApprovalMode = l_0_9(l_0_8.general, "defaultApprovalMode", "default"),
  enablePermanentToolApproval = l_0_9(l_0_8.security, "enablePermanentToolApproval", "false"),
  enableAutoUpdate = l_0_9(l_0_8.general, "enableAutoUpdate", "true"),
  modelName = l_0_9(l_0_8.model, "name", ""),
  mcpServers = nil
}
if not isnull(l_0_8.mcpServers) and type(l_0_8.mcpServers) == "table" then
  l_0_10.mcpServers = {}
  table.insert(l_0_10.mcpServers, McpParseHelper(l_0_8.mcpServers))
end
local l_0_11
if versioning.GetHostOsType() == 1 then
  local l_0_12 = mp.ContextualExpandEnvironmentVariables("%APPDATA%")
  if not isnull(l_0_12) and l_0_12 ~= "" then
    l_0_11 = l_0_12 .. "\\npm\\node_modules\\@google\\gemini-cli\\package.json"
  end
else
  l_0_11 = "/usr/local/lib/node_modules/@google/gemini-cli/package.json"
end
if l_0_11 and sysio.IsFileExists(l_0_11) then
  local l_0_13 = sysio.ReadFile(l_0_11, 0, 300)
  if l_0_13 then
    local l_0_14 = tostring(l_0_13):match("\"version\"%s*:%s*\"([^\"]+)\"")
    if l_0_14 then
      l_0_10.version = l_0_14
    end
  end
end
local l_0_15 = safeJsonSerialize(l_0_10)
local l_0_16, l_0_17 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_16 and l_0_17 ~= nil then
  for l_0_18, l_0_19 in pairs(l_0_17) do
    if l_0_18 == l_0_4 and l_0_19 == l_0_15 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_15, l_0_5, 100)
local l_0_20 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_20 then
  MpCommon.BmTriggerSig(l_0_20, "AIDiscovery_gemini_json", l_0_15)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
