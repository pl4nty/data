-- Threat: !InfrastructureShared
-- Name: !#999990_Last_PassThruTrigger
-- Type: 16

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0, r0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_SCANREASON)
local r0_2, r0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_CONTROL_GUID)
local r0_4, r0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_CONTROL_VERSION)
local r0_6, r0_7 = false, false
if r0_2 then
  if string.match(r0_3, "6bf52a52%-394a%-11d3%-b153%-00c04f79faa6") then
    return mp.FALSE
  end
  if string.match(r0_3, "22d6f312%-b0f6%-11d0%-94ab%-0080c74c7e95") then
    return mp.FALSE
  end
  if string.match(r0_3, "6e6b5b2a%-ec7e%-4f25%-95bb%-504bb437e95e") then
    return mp.FALSE
  end
  if string.match(r0_3, "5512d122%-5cc6%-11cf%-8d67%-00aa00bdce1d") then
    return mp.FALSE
  end
  local r0_8 = string.match(r0_3, "d27cdb6e%-ae6d%-11cf%-96b8%-444553540000")
  local r0_9, r0_10, r0_11, r0_12, r0_13, r0_14, r0_15
  r0_6 = r0_8 and r0_4 and r0_12 == 32 and r0_11 == 0 and r0_10 == 0 and r0_9 >= 445 or r0_6
  r0_8 = string
  r0_8 = r0_8.match
  r0_8 = r0_8(r0_3, "dfeaf541%-f3e1%-4c24%-acac%-99c30715084a")
  local r0_16 = r0_8 and r0_4 and r0_15 == 5 and r0_14 == 1 and r0_13 == 50918 or r0_7
  if r0_0 and r0_1 ~= mp.SCANREASON_VALIDATION_PRESCAN and r0_6 == false and r0_16 == false then
    mp.aggregate_mpattribute("Context:DataControlGuid.B")
  end
end
if r0_0 and r0_1 ~= mp.SCANREASON_VALIDATION_PRESCAN and r0_6 == false then
  local r0_17, r0_18 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_URL)
  if r0_17 and string.match(r0_18, "[/.]google%.com") then
    mp.aggregate_mpattribute("Context:DataUrl")
  end
  local r0_19, r0_20 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REFERRERURL)
  if r0_19 then
    if string.match(r0_20, "google%.co") then
      mp.aggregate_mpattribute("Context:DataReferrerUrl")
    end
    if string.match(r0_20, "baidu%.com") then
      mp.aggregate_mpattribute("Context:DataReferrerUrl")
    end
    if string.match(r0_20, "yandex%.ru") then
      mp.aggregate_mpattribute("Context:DataReferrerUrl")
    end
    if string.match(r0_20, "bing%.co") then
      mp.aggregate_mpattribute("Context:DataReferrerUrlBing")
    end
    if string.match(r0_20, "/a[fp]u.php?.-id=%d") then
      mp.aggregate_mpattribute("Context:DataReferrerUrlAds")
    end
  end
end
mp.aggregate_mpattribute("//MpIsIEVScan")
return mp.TRUE
