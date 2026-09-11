-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAIDiscovery_kilo_json\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
do
  if not (mp.get_mpattribute)("Lua:FnameAttr!kilo.json") then
    local l_0_1 = (mp.get_mpattribute)("Lua:FnameAttr!kilo.jsonc")
  end
  local l_0_2 = nil
  do
    if not (mp.get_mpattribute)("Lua:LastFolder0!.kilocode") then
      local l_0_3 = (mp.get_mpattribute)("Lua:FnameAttr!config.json")
    end
    do
      if (mp.get_mpattribute)("Lua:LastFolder0!kilo") then
        local l_0_4 = nil
      end
      local l_0_5 = nil
      if (not l_0_2 or (mp.get_mpattribute)("Lua:LastFolder0!.kilo") or not (mp.get_mpattribute)("Lua:LastFolder0!kilo")) and (not l_0_5 or not (mp.get_mpattribute)("Lua:LastFolder1!.config")) then
        return mp.CLEAN
      end
      local l_0_6 = nil
      if isnull((mp.getfilename)(mp.FILEPATH_QUERY_FULL)) then
        return mp.CLEAN
      end
      local l_0_7 = nil
      if type((mp.getfilesize)()) ~= "number" or (mp.getfilesize)() < 0 or (mp.getfilesize)() > 1024000 then
        return mp.CLEAN
      end
      ;
      (mp.readprotection)(false)
      local l_0_8 = nil
      ;
      (mp.readprotection)(true)
      if isnull((mp.readfile)(0, (mp.getfilesize)())) then
        return mp.CLEAN
      end
      local l_0_9 = nil
      if type(safeJsonDeserialize(tostring((mp.readfile)(0, (mp.getfilesize)())))) ~= "table" or type((safeJsonDeserialize(tostring((mp.readfile)(0, (mp.getfilesize)())))).mcp) ~= "table" then
        return mp.CLEAN
      end
      local l_0_10 = nil
      for l_0_14,l_0_15 in pairs((safeJsonDeserialize(tostring((mp.readfile)(0, (mp.getfilesize)())))).mcp) do
        local l_0_11, l_0_12, l_0_13 = , {}
        -- DECOMPILER ERROR at PC140: Confused about usage of register: R14 in 'UnsetPending'

        -- DECOMPILER ERROR at PC145: Confused about usage of register: R15 in 'UnsetPending'

        if type(R14_PC140) == "string" and type(R15_PC145) == "table" then
          l_0_13[R14_PC140] = R15_PC145
        end
      end
      local l_0_16 = nil
      local l_0_17 = nil
      local l_0_18 = nil
      if isnull(safeJsonSerialize({configFilePath = l_0_9, 
mcpServers = {McpParseHelper(l_0_18)}
})) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC178: Confused about usage of register: R12 in 'UnsetPending'

      local l_0_19, l_0_20 = nil
      if pcall(MpCommon.RollingQueueQueryKVNamespaced, "ai_kilo_json", "ai_discovery_scan") and MpCommon.RollingQueueQueryKVNamespaced ~= nil then
        for l_0_24,l_0_25 in pairs(R17_PC187) do
          local l_0_21, l_0_22, l_0_23 = "ai_kilo_json" .. "_" .. l_0_9
          -- DECOMPILER ERROR at PC189: Confused about usage of register: R19 in 'UnsetPending'

          -- DECOMPILER ERROR at PC191: Confused about usage of register: R20 in 'UnsetPending'

          if R19_PC189 == l_0_21 and R20_PC191 == l_0_19 then
            return mp.CLEAN
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC201: Confused about usage of register: R13 in 'UnsetPending'

        AppendToRollingQueueNamespaced(l_0_20, "ai_discovery_scan", l_0_21, l_0_19, 86400, 100)
        local l_0_26 = nil
        if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) then
          (MpCommon.BmTriggerSig)(tostring((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)), "AIDiscovery_kilo_json", l_0_19)
        end
        ;
        (mp.set_mpattribute)("MpDisableCaching")
        return mp.INFECTED
      end
    end
  end
end

