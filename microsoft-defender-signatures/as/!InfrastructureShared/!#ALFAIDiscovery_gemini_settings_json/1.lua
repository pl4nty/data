-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_gemini_settings_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder0!.gemini") or not (mp.get_mpattribute)("Lua:FnameAttr!settings.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_gemini_settings_json"
local l_0_4 = "ai_gemini_settings_json_" .. l_0_1
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
local l_0_9 = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  if l_1_0 and not isnull(l_1_0[l_1_1]) then
    return l_1_0[l_1_1]
  else
    return l_1_2
  end
end

local l_0_10 = {}
l_0_10.defaultApprovalMode = l_0_9(l_0_8.general, "defaultApprovalMode", "default")
l_0_10.enablePermanentToolApproval = l_0_9(l_0_8.security, "enablePermanentToolApproval", "false")
l_0_10.enableAutoUpdate = l_0_9(l_0_8.general, "enableAutoUpdate", "true")
l_0_10.modelName = l_0_9(l_0_8.model, "name", "")
local l_0_11 = safeJsonSerialize(l_0_10)
local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_12 and l_0_13 ~= nil then
  for l_0_17,l_0_18 in pairs(l_0_13) do
    if l_0_17 == l_0_4 and l_0_18 == l_0_11 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_11, l_0_5, 100)
  ;
  (mp.SetDetectionString)(l_0_11)
  return mp.INFECTED
end

