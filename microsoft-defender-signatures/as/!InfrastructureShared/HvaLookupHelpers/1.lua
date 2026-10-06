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

RegisterHvaDeviceRole = function(l_3_0)
  -- function num : 0_2
  local l_3_1 = "ExtendedHvaDeviceProperties"
  local l_3_2 = 604800
  local l_3_3 = "DeviceRoles"
  local l_3_4 = "unknown"
  local l_3_5, l_3_6, l_3_7, l_3_8 = pcall(function()
    -- function num : 0_2_0
    local l_4_0 = MpCommon.GetDateFromTimeT
    local l_4_1 = (MpCommon.GetCurrentTimeT)()
    do return l_4_0(l_4_1) end
    -- DECOMPILER ERROR at PC7: Confused about usage of register R1 for local variables in 'ReleaseLocals'

  end
)
  if l_3_5 and l_3_6 and l_3_7 and l_3_8 then
    l_3_4 = (string.format)("%04d-%02d-%02d", l_3_8, l_3_7, l_3_6)
  end
  local l_3_9 = l_3_0 .. ",Confidence=High:Local,LastSeen=" .. l_3_4
  AppendToRollingQueue(l_3_1, l_3_3, l_3_9, l_3_2, 100)
  local l_3_10 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.report"
  local l_3_11 = {}
  l_3_11[1] = l_3_10
  local l_3_12 = {}
  l_3_12.SIG_CONTEXT = "LUA_GENERIC"
  l_3_12.CONTENT_SOURCE = "HVA_PAYLOAD_REPORT"
  l_3_12.HVAREPORT = "DeviceRoles=" .. l_3_9
  l_3_12.TAG = "NOLOOKUP"
  pcall(mp.GetUrlReputation, l_3_11, l_3_12)
end

IsDeviceHVAWithAD = function()
  -- function num : 0_3
  local l_4_0 = false
  do
    if IsDeviceHVA() then
      local l_4_1 = ExtractDeviceProperties()
      if l_4_1 ~= nil and l_4_1.DeviceRoles ~= nil then
        l_4_0 = true
      end
    end
    if not l_4_0 and IsActiveDirectoryRole() then
      l_4_0 = true
    end
    if l_4_0 == true then
      return true
    end
    return false
  end
end


