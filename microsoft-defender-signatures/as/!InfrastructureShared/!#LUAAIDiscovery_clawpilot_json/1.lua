-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAIDiscovery_clawpilot_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder0!.copilot") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!m-settings.json") and not (mp.get_mpattribute)("Lua:FnameAttr!clawpilot-settings.json") then
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
l_0_9.autoApproveGlobal = true
l_0_9.autoApprovePerServer = {}
l_0_9.autoApproveReadOnly = nil
l_0_9.allowPatterns = nil
local l_0_10 = l_0_8.permissions
if not isnull(l_0_10) and type(l_0_10) == "table" then
  if type(l_0_10.autoApproveReadOnly) == "boolean" then
    l_0_9.autoApproveReadOnly = l_0_10.autoApproveReadOnly
  end
  if not isnull(l_0_10.servers) and type(l_0_10.servers) == "table" then
    for l_0_14,l_0_15 in pairs(l_0_10.servers) do
      -- DECOMPILER ERROR at PC150: Confused about usage of register: R16 in 'UnsetPending'

      if type(l_0_14) == "string" and type(l_0_15) == "table" and l_0_15.autoApprove == true and l_0_15.enabled ~= false then
        (l_0_9.autoApprovePerServer)[l_0_14] = true
      end
    end
  end
  do
    if not isnull(l_0_10.allow) and type(l_0_10.allow) == "table" then
      l_0_9.allowPatterns = {}
      for l_0_19,l_0_20 in ipairs(l_0_10.allow) do
        -- DECOMPILER ERROR at PC178: Confused about usage of register: R16 in 'UnsetPending'

        if type(l_0_20) == "string" then
          (l_0_9.allowPatterns)[#l_0_9.allowPatterns + 1] = l_0_20
        end
      end
    end
    do
      local l_0_21 = false
      for l_0_25,l_0_26 in pairs(l_0_9.autoApprovePerServer) do
        if l_0_26 == true then
          l_0_21 = true
          break
        end
      end
      do
        do
          l_0_9.autoApproveGlobal = l_0_21
          local l_0_27 = {}
          if not isnull(l_0_8.disabledServers) and type(l_0_8.disabledServers) == "table" then
            for l_0_31,l_0_32 in ipairs(l_0_8.disabledServers) do
              if type(l_0_32) == "string" then
                l_0_27[(string.lower)(l_0_32)] = true
              end
            end
          end
          do
            if not isnull(l_0_8.autoApprove) and type(l_0_8.autoApprove) == "table" then
              if type((l_0_8.autoApprove).global) == "boolean" then
                l_0_9.autoApproveGlobal = (l_0_8.autoApprove).global
              end
              if not isnull((l_0_8.autoApprove).perServer) and type((l_0_8.autoApprove).perServer) == "table" then
                for l_0_36,l_0_37 in pairs((l_0_8.autoApprove).perServer) do
                  if type(l_0_36) == "string" and type(l_0_37) == "table" then
                    local l_0_38 = (string.lower)(l_0_36)
                    -- DECOMPILER ERROR at PC275: Confused about usage of register: R18 in 'UnsetPending'

                    if not l_0_27[l_0_38] then
                      (l_0_9.autoApprovePerServer)[l_0_36] = l_0_37
                    end
                  end
                end
              end
            end
            do
              l_0_27 = safeJsonSerialize
              l_0_27 = l_0_27(l_0_9)
              local l_0_39 = nil
              l_0_39 = pcall
              l_0_39 = l_0_39(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
              local l_0_40, l_0_41 = nil
              if l_0_39 and l_0_40 ~= nil then
                l_0_41 = pairs
                l_0_41 = l_0_41(l_0_40)
                for l_0_45,l_0_46 in l_0_41 do
                  local l_0_46 = nil
                  if l_0_44 == l_0_4 and l_0_45 == l_0_27 then
                    l_0_46 = mp
                    l_0_46 = l_0_46.CLEAN
                    return l_0_46
                  end
                end
              end
              do
                AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_27, l_0_5, 100)
                do
                  local l_0_47 = nil
                  if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) then
                    l_0_47 = MpCommon
                    l_0_47 = l_0_47.BmTriggerSig
                    l_0_47((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "AIDiscovery_clawpilot_json", l_0_27)
                  end
                  l_0_47 = mp
                  l_0_47 = l_0_47.set_mpattribute
                  l_0_47("MpDisableCaching")
                  l_0_47 = mp
                  l_0_47 = l_0_47.INFECTED
                  do return l_0_47 end
                  -- DECOMPILER ERROR at PC332: Confused about usage of register R14 for local variables in 'ReleaseLocals'

                end
              end
            end
          end
        end
      end
    end
  end
end

