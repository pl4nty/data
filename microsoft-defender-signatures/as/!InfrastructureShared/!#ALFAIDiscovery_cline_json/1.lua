-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_cline_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder1!.cline") or not (mp.get_mpattribute)("Lua:LastFolder0!data") or not (mp.get_mpattribute)("Lua:FnameAttr!globalstate.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_cline_global_json"
local l_0_4 = "ai_cline_global_json_" .. l_0_1
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
l_0_9.currMode = l_0_8.mode
l_0_9.configuredPlanModels = {}
l_0_9.configuredActModels = {}
l_0_9.autoApprovalSettings = {}
if l_0_8.planModeApiProvider and l_0_8.planModeApiModelId then
  local l_0_10 = table.insert
  local l_0_11 = l_0_9.configuredPlanModels
  local l_0_12 = {}
  l_0_12.provider = (string.lower)(l_0_8.planModeApiProvider)
  l_0_12.modelId = (string.lower)(l_0_8.planModeApiModelId)
  l_0_10(l_0_11, l_0_12)
end
do
  if l_0_8.actModeApiProvider and l_0_8.actModeApiModelId then
    local l_0_13 = table.insert
    local l_0_14 = l_0_9.configuredActModels
    local l_0_15 = {}
    l_0_15.provider = (string.lower)(l_0_8.actModeApiProvider)
    l_0_15.modelId = (string.lower)(l_0_8.actModeApiModelId)
    l_0_13(l_0_14, l_0_15)
  end
  do
    for l_0_19,l_0_20 in pairs(l_0_8) do
      if l_0_19 ~= "planModeApiModelId" and l_0_19 ~= "actModeApiModelId" and type(l_0_20) == "string" and not isnull(l_0_20) then
        local l_0_21 = (string.match)(l_0_19, "^planMode(.+)ModelId$")
        if l_0_21 then
          local l_0_22 = table.insert
          local l_0_23 = l_0_9.configuredPlanModels
          local l_0_24 = {}
          l_0_24.provider = (string.lower)(l_0_21)
          l_0_24.modelId = (string.lower)(l_0_20)
          l_0_22(l_0_23, l_0_24)
        else
          do
            local l_0_25 = (string.match)(l_0_19, "^actMode(.+)ModelId$")
            if l_0_25 then
              local l_0_26 = table.insert
              local l_0_27 = l_0_9.configuredActModels
              local l_0_28 = {}
              l_0_28.provider = (string.lower)(l_0_25)
              l_0_28.modelId = (string.lower)(l_0_20)
              l_0_26(l_0_27, l_0_28)
            end
            do
              -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC206: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    if l_0_8.planModeVsCodeLmModelSelector and type(l_0_8.planModeVsCodeLmModelSelector) == "table" and not isnull((l_0_8.planModeVsCodeLmModelSelector).family) then
      local l_0_29 = table.insert
      local l_0_30 = l_0_9.configuredPlanModels
      local l_0_31 = {}
      l_0_31.provider = "vscode-lm"
      l_0_31.vendor = (string.lower)((l_0_8.planModeVsCodeLmModelSelector).vendor or "")
      l_0_31.modelId = (string.lower)((l_0_8.planModeVsCodeLmModelSelector).family)
      l_0_29(l_0_30, l_0_31)
    end
    do
      if l_0_8.actModeVsCodeLmModelSelector and type(l_0_8.actModeVsCodeLmModelSelector) == "table" and not isnull((l_0_8.actModeVsCodeLmModelSelector).family) then
        local l_0_32 = table.insert
        local l_0_33 = l_0_9.configuredActModels
        local l_0_34 = {}
        l_0_34.provider = "vscode-lm"
        l_0_34.vendor = (string.lower)((l_0_8.actModeVsCodeLmModelSelector).vendor or "")
        l_0_34.modelId = (string.lower)((l_0_8.actModeVsCodeLmModelSelector).family)
        l_0_32(l_0_33, l_0_34)
      end
      do
        do
          if l_0_8.autoApprovalSettings and type(l_0_8.autoApprovalSettings) == "table" then
            local l_0_35 = {}
            l_0_35.enabled = (l_0_8.autoApprovalSettings).enabled
            l_0_35.enableNotifications = (l_0_8.autoApprovalSettings).enableNotifications
            l_0_35.version = (l_0_8.autoApprovalSettings).version
            l_0_35.nonexistentField = (l_0_8.autoApprovalSettings).nonexistentField
            l_0_35.actions = (l_0_8.autoApprovalSettings).actions
            l_0_9.autoApprovalSettings = l_0_35
          end
          local l_0_36 = safeJsonSerialize(l_0_9)
          local l_0_37, l_0_38 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
          if l_0_37 and l_0_38 ~= nil then
            for l_0_42,l_0_43 in pairs(l_0_38) do
              if l_0_42 == l_0_4 and l_0_43 == l_0_36 then
                return mp.CLEAN
              end
            end
          end
          do
            AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_36, l_0_5, 100)
            ;
            (mp.SetDetectionString)(l_0_36)
            return mp.INFECTED
          end
        end
      end
    end
  end
end

