-- Threat: !InfrastructureShared
-- Name: HvaLookupHelpers
-- Type: 1
-- Includes: LuaFuncHelper, BMLuaLib

function ExtractDeviceProperties()
  local function l_1_0(l_2_0)
    if l_2_0 == "true" then
      return true
    end
    if l_2_0 == "false" then
      return false
    end
    if tonumber(l_2_0) then
      return tonumber(l_2_0)
    end
    return l_2_0
  end
  
  local l_1_1 = {}
  local l_1_2 = "ExtendedHvaDeviceProperties"
  local l_1_3 = GetRollingQueue(l_1_2)
  if l_1_3 ~= nil then
    for l_1_4, l_1_5 in pairs(l_1_3) do
      local l_1_6 = l_1_5.key
      local l_1_7 = l_1_5.value
      if l_1_6 == "DeviceRoles" then
        l_1_1[l_1_6] = {}
        for l_1_8 in l_1_7:gmatch("[^%+]+") do
          local l_1_9, l_1_10 = l_1_8:match("([^,]+),(.*)")
          if l_1_9 then
            local l_1_11 = {}
            for l_1_12, l_1_13 in l_1_10:gmatch("([^=,]+)=([^=,]+)") do
              l_1_11[l_1_12] = l_1_0(l_1_13)
            end
            l_1_1[l_1_6][l_1_9] = l_1_11
          end
        end
      else
        l_1_1[l_1_6] = l_1_0(l_1_7)
      end
    end
  end
  return l_1_1
end

function IsDeviceHVA()
  local l_3_0 = "ExtendedHvaDeviceProperties"
  local l_3_1 = GetRollingQueueKeyValue(l_3_0, "DeviceRoles")
  if l_3_1 ~= nil then
    return true
  end
  return false
end

function RegisterHvaDeviceRole(l_4_0)
  local l_4_1 = "ExtendedHvaDeviceProperties"
  local l_4_2 = 604800
  local l_4_3 = "DeviceRoles"
  local l_4_4 = "unknown"
  local l_4_5, l_4_6, l_4_7, l_4_8 = pcall(function()
    return MpCommon.GetDateFromTimeT(MpCommon.GetCurrentTimeT())
  end)
  if l_4_5 and l_4_6 and l_4_7 and l_4_8 then
    l_4_4 = string.format("%04d-%02d-%02d", l_4_8, l_4_7, l_4_6)
  end
  local l_4_9 = l_4_0 .. ",Confidence=High:Local,LastSeen=" .. l_4_4
  AppendToRollingQueue(l_4_1, l_4_3, l_4_9, l_4_2, 100)
  local l_4_10 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.report"
  local l_4_11 = {
    [1] = l_4_10
  }
  local l_4_12 = {
    SIG_CONTEXT = "LUA_GENERIC",
    CONTENT_SOURCE = "HVA_PAYLOAD_REPORT",
    HVAREPORT = "DeviceRoles=" .. l_4_9,
    TAG = "NOLOOKUP"
  }
  pcall(mp.GetUrlReputation, l_4_11, l_4_12)
end

function IsDeviceHVAWithAD()
  local l_6_0 = false
  if IsDeviceHVA() then
    local l_6_1 = ExtractDeviceProperties()
    if l_6_1 ~= nil and l_6_1.DeviceRoles ~= nil then
      l_6_0 = true
    end
  end
  if not l_6_0 and IsActiveDirectoryRole() then
    l_6_0 = true
  end
  if l_6_0 == true then
    return true
  end
  return false
end
