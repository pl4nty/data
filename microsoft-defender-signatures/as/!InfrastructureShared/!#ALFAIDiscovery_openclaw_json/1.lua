-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_openclaw_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!openclaw.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_openclaw_json"
local l_0_4 = (string.lower)("ai_openclaw_json" .. l_0_1)
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
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 or not l_0_8.agents then
  return mp.CLEAN
end
local l_0_9 = function(l_1_0, ...)
  -- function num : 0_0
  if type(l_1_0) ~= "table" then
    return nil
  end
  for l_1_5,l_1_6 in ipairs({...}) do
    local l_1_2 = l_1_0
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R7 in 'UnsetPending'

    if type(l_1_2) ~= "table" or l_1_2[R7_PC19] == nil then
      return nil
    end
    l_1_2 = l_1_2[R7_PC19]
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  return l_1_2
end

local l_0_10 = {}
l_0_10.workspace = l_0_9(l_0_8, "agents", "defaults", "workspace")
l_0_10.model_primary = l_0_9(l_0_8, "agents", "defaults", "model", "primary")
l_0_10.model_fallbacks = l_0_9(l_0_8, "agents", "defaults", "model", "fallbacks")
l_0_10.model_defaults = l_0_9(l_0_8, "agents", "defaults", "models")
l_0_10.tools_allow = l_0_9(l_0_8, "tools", "allow")
l_0_10.tools_deny = l_0_9(l_0_8, "tools", "deny")
l_0_10.tools_elevated = l_0_9(l_0_8, "tools", "elevated")
if isnull(l_0_10) then
  return mp.CLEAN
end
local l_0_11 = {}
if l_0_8.mcpServers or l_0_8.servers then
  do
    if not l_0_8.mcpServers then
      local l_0_12, l_0_13 = l_0_8.servers
    end
    -- DECOMPILER ERROR at PC153: Confused about usage of register: R12 in 'UnsetPending'

    for l_0_17,l_0_18 in pairs(l_0_12) do
      local l_0_14 = nil
      -- DECOMPILER ERROR at PC160: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC165: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC170: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC172: Overwrote pending register: R18 in 'AssignReg'

      if (l_0_19.type and not l_0_19.transport) or l_0_19.url then
        local l_0_20 = ""
        if l_0_19.headers then
          for l_0_24,l_0_25 in pairs(l_0_19.headers) do
            local l_0_21 = {}
            local l_0_27 = contains
            local l_0_28 = l_0_25
            l_0_27 = l_0_27(l_0_28, {"api_key", "brave_api_key", "authorization", "access_token"})
            if not l_0_27 then
              l_0_21[l_0_25] = l_0_26
            end
          end
        end
        do
          local l_0_29 = nil
          if l_0_19.env then
            for l_0_33,l_0_34 in pairs(l_0_19.env) do
              local l_0_30 = {}
              local l_0_36 = contains
              local l_0_37 = l_0_34
              l_0_36 = l_0_36(l_0_37, {"api_key", "brave_api_key", "authorization", "access_token"})
              if not l_0_36 then
                l_0_30[l_0_34] = l_0_35
              end
            end
          end
          do
            do
              local l_0_38 = nil
              l_0_11[l_0_18] = {type = l_0_19.type, url = l_0_19.url, command = l_0_19.command, args = l_0_19.args, tools = l_0_19.tools, transport = l_0_20, headers = l_0_29, environment = l_0_38}
              -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    if next(l_0_11) then
      l_0_10.mcpServers = l_0_11
    end
    local l_0_39 = safeJsonSerialize(l_0_10)
    local l_0_40, l_0_41 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
    if l_0_40 and l_0_41 ~= nil then
      for l_0_45,l_0_46 in pairs(l_0_41) do
        if l_0_45 == l_0_4 and l_0_46 == l_0_39 then
          return mp.CLEAN
        end
      end
    end
    do
      AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_39, l_0_5, 100)
      ;
      (mp.SetDetectionString)(l_0_39)
      ;
      (mp.set_mpattribute)("MpDisableCaching")
      return mp.INFECTED
    end
  end
end

