-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_clawpilot_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!.copilot") then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:FnameAttr!m-settings.json") and not mp.get_mpattribute("Lua:FnameAttr!clawpilot-settings.json") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_clawpilot_settings_json"
local l_0_4 = "ai_clawpilot_settings_json_" .. l_0_1
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
  autoApproveGlobal = true,
  autoApprovePerServer = {},
  autoApproveReadOnly = nil,
  allowPatterns = nil
}
local l_0_10 = l_0_8.permissions
if not isnull(l_0_10) and type(l_0_10) == "table" then
  do
    if type(l_0_10.autoApproveReadOnly) == "boolean" then
      l_0_9.autoApproveReadOnly = l_0_10.autoApproveReadOnly
    end
    if not isnull(l_0_10.servers) and type(l_0_10.servers) == "table" then
      for l_0_11, l_0_12 in pairs(l_0_10.servers) do
        if type(l_0_11) == "string" and type(l_0_12) == "table" and l_0_12.autoApprove == true and l_0_12.enabled ~= false then
          l_0_9.autoApprovePerServer[l_0_11] = true
        end
      end
    end
    if not isnull(l_0_10.allow) and type(l_0_10.allow) == "table" then
      l_0_9.allowPatterns = {}
      for l_0_13, l_0_14 in ipairs(l_0_10.allow) do
        if type(l_0_14) == "string" then
          l_0_9.allowPatterns[#l_0_9.allowPatterns + 1] = l_0_14
        end
      end
    end
    local l_0_15 = false
    for l_0_16, l_0_17 in pairs(l_0_9.autoApprovePerServer) do
      if l_0_17 == true then
        l_0_15 = true
        break
      end
    end
    l_0_9.autoApproveGlobal = l_0_15
  end
else
  local l_0_18 = {}
  if not isnull(l_0_8.disabledServers) and type(l_0_8.disabledServers) == "table" then
    for l_0_19, l_0_20 in ipairs(l_0_8.disabledServers) do
      if type(l_0_20) == "string" then
        l_0_18[string.lower(l_0_20)] = true
      end
    end
  end
  if not isnull(l_0_8.autoApprove) and type(l_0_8.autoApprove) == "table" then
    if type(l_0_8.autoApprove.global) == "boolean" then
      l_0_9.autoApproveGlobal = l_0_8.autoApprove.global
    end
    if not isnull(l_0_8.autoApprove.perServer) and type(l_0_8.autoApprove.perServer) == "table" then
      for l_0_21, l_0_22 in pairs(l_0_8.autoApprove.perServer) do
        if type(l_0_21) == "string" and type(l_0_22) == "table" then
          local l_0_23 = string.lower(l_0_21)
          if not l_0_18[l_0_23] then
            l_0_9.autoApprovePerServer[l_0_21] = l_0_22
          end
        end
      end
    end
  end
end
local l_0_24 = safeJsonSerialize(l_0_9)
local l_0_25, l_0_26 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_25 and l_0_26 ~= nil then
  for l_0_27, l_0_28 in pairs(l_0_26) do
    if l_0_27 == l_0_4 and l_0_28 == l_0_24 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_24, l_0_5, 100)
local l_0_29 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_29 then
  MpCommon.BmTriggerSig(l_0_29, "AIDiscovery_clawpilot_json", l_0_24)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
