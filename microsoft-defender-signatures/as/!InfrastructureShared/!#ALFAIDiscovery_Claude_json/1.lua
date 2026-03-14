-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAIDiscovery_claude_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:FnameAttr!.claude.json") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_claude_json"
local l_0_4 = (string.lower)("ai_claude_json_" .. l_0_1)
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
if not l_0_8 or not l_0_8.projects then
  return mp.CLEAN
end
local l_0_9 = {}
if not l_0_8.projects then
  for l_0_13,l_0_14 in pairs({}) do
    local l_0_15 = {}
    l_0_15.projectPath = l_0_13
    l_0_15.lastModel = nil
    l_0_15.mcpServers = {}
    if not l_0_14.enabledMcpjsonServers then
      l_0_15.enabledMcpjsonServers = {}
      if not l_0_14.disabledMcpjsonServers then
        l_0_15.disabledMcpjsonServers = {}
        if not l_0_14.disabledMcpServers then
          l_0_15.disabledMcpServers = {}
          if l_0_14.lastModelUsage then
            for l_0_19,l_0_20 in pairs(l_0_14.lastModelUsage) do
              l_0_15.lastModel = l_0_19
              do break end
            end
          end
          do
            if l_0_14.mcpServers or l_0_14.servers then
              do
                do
                  if not l_0_14.mcpServers then
                    local l_0_21, l_0_22 = l_0_14.servers
                  end
                  -- DECOMPILER ERROR at PC133: Confused about usage of register: R16 in 'UnsetPending'

                  for l_0_26,l_0_27 in pairs(l_0_21) do
                    local l_0_23 = nil
                    -- DECOMPILER ERROR at PC140: Overwrote pending register: R22 in 'AssignReg'

                    -- DECOMPILER ERROR at PC145: Overwrote pending register: R22 in 'AssignReg'

                    -- DECOMPILER ERROR at PC150: Overwrote pending register: R22 in 'AssignReg'

                    -- DECOMPILER ERROR at PC152: Overwrote pending register: R22 in 'AssignReg'

                    if (l_0_28.type and not l_0_28.transport) or l_0_28.url then
                      local l_0_29 = ""
                      if l_0_28.headers then
                        for l_0_33,l_0_34 in pairs(l_0_28.headers) do
                          local l_0_30 = {}
                          -- DECOMPILER ERROR at PC163: Confused about usage of register: R28 in 'UnsetPending'

                          if l_0_34 ~= "Authorization" then
                            l_0_30[l_0_34] = R28_PC163
                          end
                        end
                      end
                      do
                        local l_0_35 = nil
                        if l_0_28.env then
                          for l_0_39,l_0_40 in pairs(l_0_28.env) do
                            local l_0_36 = {}
                            -- DECOMPILER ERROR at PC176: Confused about usage of register: R29 in 'UnsetPending'

                            if l_0_40 ~= "API_KEY" then
                              l_0_36[l_0_40] = R29_PC176
                            end
                          end
                        end
                        do
                          local l_0_41 = nil
                          local l_0_42 = table.insert
                          do
                            local l_0_43 = l_0_15.mcpServers
                            l_0_42(l_0_43, {name = l_0_27, type = l_0_28.type, url = l_0_28.url, command = l_0_28.command, args = l_0_28.args, tools = l_0_28.tools, transport = l_0_29, headers = l_0_35, environment = l_0_41})
                            -- DECOMPILER ERROR at PC198: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC198: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC198: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC198: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                  ;
                  (table.insert)(l_0_9, l_0_15)
                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC205: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  if isnull(l_0_9) then
    return mp.CLEAN
  end
  local l_0_44 = safeJsonSerialize(l_0_9)
  local l_0_45, l_0_46 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
  if l_0_45 and l_0_46 ~= nil then
    for l_0_50,l_0_51 in pairs(l_0_46) do
      if l_0_50 == l_0_4 and l_0_51 == l_0_44 then
        return mp.CLEAN
      end
    end
  end
  do
    AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_44, l_0_5, 100)
    ;
    (mp.SetDetectionString)(l_0_44)
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.INFECTED
  end
end

