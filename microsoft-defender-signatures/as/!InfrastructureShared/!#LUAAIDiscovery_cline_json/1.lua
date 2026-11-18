-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_cline_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute("Lua:LastFolder1!.cline") and mp.get_mpattribute("Lua:LastFolder0!data")) or not mp.get_mpattribute("Lua:FnameAttr!globalstate.json") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_cline_global_json"
local l_0_4 = "ai_cline_global_json_" .. l_0_1
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
local l_0_9 = {
  currMode = l_0_8.mode,
  configuredPlanModels = {},
  configuredActModels = {},
  autoApprovalSettings = {}
}
if l_0_8.planModeApiProvider and l_0_8.planModeApiModelId then
  table.insert(l_0_9.configuredPlanModels, {
    provider = string.lower(l_0_8.planModeApiProvider),
    modelId = string.lower(l_0_8.planModeApiModelId)
  })
end
if l_0_8.actModeApiProvider and l_0_8.actModeApiModelId then
  table.insert(l_0_9.configuredActModels, {
    provider = string.lower(l_0_8.actModeApiProvider),
    modelId = string.lower(l_0_8.actModeApiModelId)
  })
end
for l_0_10, l_0_11 in pairs(l_0_8) do
  if l_0_10 ~= "planModeApiModelId" and l_0_10 ~= "actModeApiModelId" and type(l_0_11) == "string" and not isnull(l_0_11) then
    local l_0_12 = string.match(l_0_10, "^planMode(.+)ModelId$")
    if l_0_12 then
      table.insert(l_0_9.configuredPlanModels, {
        provider = string.lower(l_0_12),
        modelId = string.lower(l_0_11)
      })
    else
      local l_0_13 = string.match(l_0_10, "^actMode(.+)ModelId$")
      if l_0_13 then
        table.insert(l_0_9.configuredActModels, {
          provider = string.lower(l_0_13),
          modelId = string.lower(l_0_11)
        })
      end
    end
  end
end
if l_0_8.planModeVsCodeLmModelSelector and type(l_0_8.planModeVsCodeLmModelSelector) == "table" and not isnull(l_0_8.planModeVsCodeLmModelSelector.family) then
  table.insert(l_0_9.configuredPlanModels, {
    provider = "vscode-lm",
    vendor = string.lower(l_0_8.planModeVsCodeLmModelSelector.vendor or ""),
    modelId = string.lower(l_0_8.planModeVsCodeLmModelSelector.family)
  })
end
if l_0_8.actModeVsCodeLmModelSelector and type(l_0_8.actModeVsCodeLmModelSelector) == "table" and not isnull(l_0_8.actModeVsCodeLmModelSelector.family) then
  table.insert(l_0_9.configuredActModels, {
    provider = "vscode-lm",
    vendor = string.lower(l_0_8.actModeVsCodeLmModelSelector.vendor or ""),
    modelId = string.lower(l_0_8.actModeVsCodeLmModelSelector.family)
  })
end
if l_0_8.autoApprovalSettings and type(l_0_8.autoApprovalSettings) == "table" then
  l_0_9.autoApprovalSettings = {
    enabled = l_0_8.autoApprovalSettings.enabled,
    enableNotifications = l_0_8.autoApprovalSettings.enableNotifications,
    version = l_0_8.autoApprovalSettings.version,
    actions = l_0_8.autoApprovalSettings.actions
  }
end
local l_0_14 = safeJsonSerialize(l_0_9)
local l_0_15, l_0_16 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_15 and l_0_16 ~= nil then
  for l_0_17, l_0_18 in pairs(l_0_16) do
    if l_0_17 == l_0_4 and l_0_18 == l_0_14 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_14, l_0_5, 100)
local l_0_19 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_19 then
  MpCommon.BmTriggerSig(l_0_19, "AIDiscovery_cline_json", l_0_14)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
