-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_antigravitycli__json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder1!.gemini") or not (mp.get_mpattribute)("Lua:LastFolder0!antigravity-cli") or not (mp.get_mpattribute)("Lua:FnameAttr!settings.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_antigravity_cli_settings_json"
local l_0_4 = "ai_antigravity_cli_settings_json_" .. l_0_1
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
l_0_9.allowNonWorkspaceAccess = l_0_8.allowNonWorkspaceAccess
l_0_9.artifactReviewPolicy = l_0_8.artifactReviewPolicy
l_0_9.enableTerminalSandbox = l_0_8.enableTerminalSandbox
l_0_9.toolPermission = l_0_8.toolPermission
local l_0_10 = safeJsonSerialize(l_0_9)
local l_0_11, l_0_12 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_11 and l_0_12 ~= nil then
  for l_0_16,l_0_17 in pairs(l_0_12) do
    if l_0_16 == l_0_4 and l_0_17 == l_0_10 then
      return mp.CLEAN
    end
  end
end
do
  AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_10, l_0_5, 100)
  local l_0_18 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_18 then
    (MpCommon.BmTriggerSig)(l_0_18, "AIDiscovery_antigravity_cli_settings_json", l_0_10)
  end
  ;
  (mp.SetDetectionString)(l_0_10)
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end

