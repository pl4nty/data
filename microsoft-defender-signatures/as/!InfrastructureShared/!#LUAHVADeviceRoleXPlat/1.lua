-- Threat: !InfrastructureShared
-- Name: !#LUA:HVADeviceRoleXPlat
-- Type: 12
-- Includes: LuaFuncHelper

local l_0_0 = "hvadevicerole"
local l_0_1 = "hvatracker"
local l_0_2 = MpCommon.AtomicCounterValueNamespaced(l_0_1, l_0_0)
if l_0_2 ~= nil then
  return mp.CLEAN
end
local l_0_3 = "hva_counter"
local l_0_4 = "hva_max_scan"
local l_0_5 = "ExtendedHvaDeviceProperties"
local l_0_6 = 604800
local l_0_7 = 1
local l_0_8 = MpCommon.AtomicCounterValueNamespaced(l_0_3, l_0_0)
if l_0_8 == nil then
  pcall(MpCommon.AtomicCounterSetNamespaced, l_0_3, l_0_0, 0, l_0_6)
  l_0_8 = 0
end
local l_0_9 = MpCommon.AtomicCounterValueNamespaced(l_0_4, l_0_0)
if l_0_9 == nil then
  MpCommon.AtomicCounterSetNamespaced(l_0_4, l_0_0, l_0_7, l_0_6)
  l_0_9 = l_0_7
end
if l_0_8 >= l_0_9 then
  if l_0_2 == nil then
    pcall(MpCommon.AtomicCounterSetNamespaced, l_0_1, l_0_0, 1, l_0_6)
  end
  return mp.CLEAN
end
local l_0_10 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.info"
local l_0_11 = {
  [1] = l_0_10
}
local l_0_12 = {
  SIG_CONTEXT = "LUA_GENERIC",
  CONTENT_SOURCE = "HVA_PAYLOAD_LOOKUP",
  TAG = "NOLOOKUP"
}
local l_0_13 = false
local l_0_14
local l_0_15, l_0_16 = pcall(mp.GetUrlReputation, l_0_11, l_0_12)
if l_0_15 and l_0_16 ~= nil and l_0_16.urls ~= nil then
  for l_0_17, l_0_18 in ipairs(l_0_16.urls) do
    if l_0_18.determination == 4 then
      local l_0_19 = l_0_18.urlresponsecontext
      if l_0_19 then
        for l_0_20, l_0_21 in ipairs(l_0_19) do
          local l_0_22 = l_0_21.key
          local l_0_23 = l_0_21.value
          if l_0_22 == "HvaPayload" then
            l_0_14 = l_0_23
            if l_0_14 ~= nil then
              l_0_13 = true
              break
            end
          end
        end
      end
    end
  end
end
local l_0_24 = MpCommon.AtomicCounterAddNamespaced(l_0_3, l_0_0, 1)
if l_0_24 and l_0_9 <= l_0_24 and l_0_2 == nil then
  pcall(MpCommon.AtomicCounterSetNamespaced(l_0_1, l_0_0, 1, l_0_6))
end
if l_0_13 and l_0_14 then
  l_0_14 = l_0_14:gsub("^|[^|]*|", "")
  for l_0_25 in l_0_14:gmatch("[^|]+") do
    local l_0_26, l_0_27 = l_0_25:match("([^=]+)=(.*)")
    if l_0_26 then
      AppendToRollingQueue(l_0_5, l_0_26, l_0_27, l_0_6, 100)
    end
  end
  local l_0_28 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.report"
  local l_0_29 = {
    [1] = l_0_28
  }
  local l_0_30 = {
    SIG_CONTEXT = "LUA_GENERIC",
    CONTENT_SOURCE = "HVA_PAYLOAD_REPORT",
    HVAREPORT = l_0_14,
    TAG = "NOLOOKUP"
  }
  pcall(mp.GetUrlReputation, l_0_29, l_0_30)
end
return mp.CLEAN
