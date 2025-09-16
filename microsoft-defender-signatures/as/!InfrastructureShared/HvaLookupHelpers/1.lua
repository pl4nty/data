-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\HvaLookupHelpers\1.luac 

-- params : ...
-- function num : 0
ExtractDeviceProperties = function()
  -- function num : 0_0
  local l_1_0 = function(l_2_0)
    -- function num : 0_0_0
    if l_2_0 == "true" then
      return true
    end
    if l_2_0 == "false" then
      return false
    end
    if tonumber(l_2_0) then
      local l_2_1 = tonumber
      local l_2_2 = l_2_0
      do return l_2_1(l_2_2) end
      -- DECOMPILER ERROR at PC17: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
    do return l_2_0 end
    -- DECOMPILER ERROR at PC18: Confused about usage of register R1 for local variables in 'ReleaseLocals'

  end

  local l_1_1 = {}
  local l_1_2 = "ExtendedHvaDeviceProperties"
  local l_1_3 = GetRollingQueue(l_1_2)
  if l_1_3 ~= nil then
    for l_1_7,l_1_8 in pairs(l_1_3) do
      local l_1_9 = l_1_8.key
      local l_1_10 = l_1_8.value
      if l_1_9 == "DeviceRoles" then
        l_1_1[l_1_9] = {}
        for l_1_14 in l_1_10:gmatch("[^%+]+") do
          local l_1_15, l_1_16 = l_1_14:match("([^,]+),(.*)")
          if l_1_15 then
            local l_1_17 = {}
            for l_1_21,l_1_22 in l_1_16:gmatch("([^=,]+)=([^=,]+)") do
              l_1_17[l_1_21] = l_1_0(l_1_22)
            end
            -- DECOMPILER ERROR at PC39: Confused about usage of register: R18 in 'UnsetPending'

            ;
            (l_1_1[l_1_9])[l_1_15] = l_1_17
          end
        end
      else
        do
          do
            l_1_1[l_1_9] = l_1_0(l_1_10)
            -- DECOMPILER ERROR at PC47: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC47: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC47: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  return l_1_1
end

IsDeviceHVA = function()
  -- function num : 0_1
  local l_2_0 = "ExtendedHvaDeviceProperties"
  if GetRollingQueueKeyValue(l_2_0, "DeviceRoles") ~= nil then
    return true
  end
  return false
end


