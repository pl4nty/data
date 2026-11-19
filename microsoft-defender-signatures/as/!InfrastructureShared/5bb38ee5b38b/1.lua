-- Threat: !InfrastructureShared
-- Name: 5bb38ee5b38b
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
l_0_0 = l_0_0.ppid or -1
local l_0_1 = "genb_ransom_meta_" .. l_0_0
local l_0_2 = MpCommon.RollingQueueCount(l_0_1)
if l_0_2 ~= nil and 25 <= l_0_2 and l_0_2 <= 100 then
  local l_0_3 = GetRollingQueue(l_0_1)
  if l_0_3 == nil or type(l_0_3) ~= "table" then
    return mp.CLEAN
  end
  local l_0_4 = {}
  local l_0_5
  local l_0_6 = ""
  local l_0_7 = ""
  local l_0_8 = {}
  local l_0_9 = 0
  local l_0_10 = {}
  local l_0_11 = 0
  local l_0_12 = 0
  local l_0_13 = {}
  local l_0_14 = 0
  local l_0_15 = 0
  local l_0_16 = ""
  local l_0_17 = false
  for l_0_18, l_0_19 in ipairs(l_0_3) do
    l_0_5 = explode(l_0_19.value, "|")
    table.insert(l_0_4, {
      Extension = l_0_5[1],
      NewFileName = l_0_5[2],
      OldFileName = l_0_5[3],
      FileType = l_0_5[4],
      FileSize = l_0_5[5],
      MagicByte = l_0_5[6],
      Entropy = l_0_5[7]
    })
    if l_0_10[l_0_5[1]] ~= 1 then
      l_0_11 = l_0_11 + 1
      l_0_10[l_0_5[1]] = 1
    end
    l_0_6 = string.match(l_0_5[2], "(.*[/\\])")
    l_0_7 = mp.crc32(0, l_0_6, 1, #l_0_6)
    if l_0_8[l_0_7] ~= 1 then
      l_0_9 = l_0_9 + 1
      l_0_8[l_0_7] = 1
    end
    l_0_16 = string.match(l_0_5[3], "(.*[/\\])")
    if l_0_16 ~= l_0_6 and l_0_17 == false then
      l_0_17 = true
    end
    if l_0_5[4] == "Unknown" then
      l_0_12 = l_0_12 + 1
    end
    if l_0_13[l_0_5[6]] ~= 1 then
      l_0_14 = l_0_14 + 1
      l_0_13[l_0_5[6]] = 1
    end
    if 7 <= l_0_5[7] then
      l_0_15 = l_0_15 + 1
    end
  end
  bm.add_related_string("GenBRollingQueueData", safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
  local l_0_20 = 0
  if l_0_11 == 1 then
    l_0_20 = l_0_20 + 1
  end
  if 3 < l_0_9 then
    l_0_20 = l_0_20 + 1
  end
  if l_0_17 == false then
    l_0_20 = l_0_20 + 1
  end
  if l_0_12 == l_0_2 then
    l_0_20 = l_0_20 + 1
  end
  if l_0_14 == 1 then
    l_0_20 = l_0_20 + 1
  end
  if l_0_15 == l_0_2 then
    l_0_20 = l_0_20 + 1
  end
  if 4 <= l_0_20 then
    reportSessionInformationInclusive()
    sms_untrusted_process()
    return mp.INFECTED
  end
end
return mp.CLEAN
