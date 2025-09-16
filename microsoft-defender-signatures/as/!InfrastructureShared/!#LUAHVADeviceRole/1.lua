-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAHVADeviceRole\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "hvadevicerole"
local l_0_1 = "hvatracker"
local l_0_2 = (MpCommon.AtomicCounterValueNamespaced)(l_0_1, l_0_0)
if l_0_2 ~= nil then
  return mp.CLEAN
end
local l_0_3 = "hva_counter"
local l_0_4 = "hva_max_scan"
local l_0_5 = "ExtendedHvaDeviceProperties"
local l_0_6 = 259200
local l_0_7 = 1
local l_0_8 = (MpCommon.AtomicCounterValueNamespaced)(l_0_3, l_0_0)
if l_0_8 == nil then
  (MpCommon.AtomicCounterSetNamespaced)(l_0_3, l_0_0, 0, l_0_6)
  l_0_8 = 0
end
local l_0_9 = (MpCommon.AtomicCounterValueNamespaced)(l_0_4, l_0_0)
if l_0_9 == nil then
  (MpCommon.AtomicCounterSetNamespaced)(l_0_4, l_0_0, l_0_7, l_0_6)
  l_0_9 = l_0_7
end
if l_0_9 <= l_0_8 then
  if l_0_2 == nil then
    pcall((MpCommon.AtomicCounterSetNamespaced)(l_0_1, l_0_0, 1, l_0_6))
  end
  return mp.CLEAN
end
local l_0_10 = "http://67dda214-3ec7-4d14-aac7-7d3658a8c8ea-001.info"
local l_0_11 = {}
l_0_11[1] = l_0_10
local l_0_12 = {}
l_0_12.SIG_CONTEXT = "LUA_GENERIC"
l_0_12.CONTENT_SOURCE = "HVA_PAYLOAD_LOOKUP"
l_0_12.TAG = "NOLOOKUP"
local l_0_13 = false
local l_0_14 = nil
local l_0_15, l_0_16 = pcall(mp.GetUrlReputation, l_0_11, l_0_12)
if l_0_15 and l_0_16 ~= nil and l_0_16.urls ~= nil then
  for l_0_20,l_0_21 in ipairs(l_0_16.urls) do
    if l_0_21.determination == 4 then
      local l_0_22 = l_0_21.urlresponsecontext
      if l_0_22 then
        for l_0_26,l_0_27 in ipairs(l_0_22) do
          if l_0_27.key == "HvaPayload" then
            l_0_14 = l_0_27.value
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
do
  local l_0_28 = nil
  if l_0_9 <= (MpCommon.AtomicCounterAddNamespaced)(l_0_3, l_0_0, 1) and l_0_2 == nil then
    l_0_28 = pcall
    l_0_28((MpCommon.AtomicCounterSetNamespaced)(l_0_1, l_0_0, 1, l_0_6))
  end
  if l_0_13 and l_0_14 then
    l_0_28 = l_0_28(l_0_14, "^|[^|]*|", "")
    l_0_14 = l_0_28
    l_0_28 = l_0_28(l_0_14, "[^|]+")
    for l_0_32 in l_0_28 do
      local l_0_32 = nil
      l_0_32 = l_0_32(l_0_31, "([^=]+)=(.*)")
      local l_0_33, l_0_34 = nil
      if l_0_32 then
        l_0_34 = AppendToRollingQueue
        l_0_34(l_0_5, l_0_32, l_0_33, l_0_6, 100)
      end
    end
    local l_0_35 = nil
    local l_0_36 = nil
    local l_0_37 = nil
    l_0_37 = pcall
    l_0_37(mp.GetUrlReputation, l_0_35, l_0_36)
  end
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC175: Confused about usage of register R18 for local variables in 'ReleaseLocals'

  end
end

