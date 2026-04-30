-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_clawpilot_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!clawpilot-settings.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_clawpilot_settings_json"
local l_0_4 = "ai_clawpilot_settings_json_" .. l_0_1
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
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = {}
l_0_9.autoApproveGlobal = false
l_0_9.autoApprovePerServer = {}
local l_0_10 = {}
if not isnull(l_0_8.disabledServers) and type(l_0_8.disabledServers) == "table" then
  for l_0_14,l_0_15 in ipairs(l_0_8.disabledServers) do
    if type(l_0_15) == "string" then
      l_0_10[(string.lower)(l_0_15)] = true
    end
  end
end
do
  if not isnull(l_0_8.autoApprove) and type(l_0_8.autoApprove) == "table" then
    if not isnull((l_0_8.autoApprove).global) and type((l_0_8.autoApprove).global) == "boolean" then
      l_0_9.autoApproveGlobal = (l_0_8.autoApprove).global
    end
    if not isnull((l_0_8.autoApprove).perServer) and type((l_0_8.autoApprove).perServer) == "table" then
      for l_0_19,l_0_20 in pairs((l_0_8.autoApprove).perServer) do
        if type(l_0_19) == "string" and type(l_0_20) == "table" then
          local l_0_21 = (string.lower)(l_0_19)
          -- DECOMPILER ERROR at PC171: Confused about usage of register: R17 in 'UnsetPending'

          if not l_0_10[l_0_21] then
            (l_0_9.autoApprovePerServer)[l_0_19] = l_0_20
          end
        end
      end
    end
  end
  do
    local l_0_22 = safeJsonSerialize(l_0_9)
    local l_0_23, l_0_24 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
    if l_0_23 and l_0_24 ~= nil then
      for l_0_28,l_0_29 in pairs(l_0_24) do
        if l_0_28 == l_0_4 and l_0_29 == l_0_22 then
          return mp.CLEAN
        end
      end
    end
    do
      AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_22, l_0_5, 100)
      ;
      (mp.SetDetectionString)(l_0_22)
      ;
      (mp.set_mpattribute)("MpDisableCaching")
      return mp.INFECTED
    end
  end
end

