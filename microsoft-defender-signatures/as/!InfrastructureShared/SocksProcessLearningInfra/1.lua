-- Threat: !InfrastructureShared
-- Name: SocksProcessLearningInfra
-- Type: 1

local function l_0_0(l_1_0)
  return type(l_1_0) == "number" and 0 < l_1_0 and l_1_0 < 9007199254740992 and l_1_0 % 1 == 0
end

function Infrastructure_ObserveSocksProcess(l_2_0, l_2_1)
  if l_2_0 ~= "" and l_2_0 ~= "Client" and l_2_0 ~= "Server" then
    return mp.CLEAN, "InvalidActivity"
  end
  local l_2_2 = MpCommon.GetCurrentTimeT()
  if not l_0_0(l_2_2) then
    return mp.CLEAN, "InvalidClock"
  end
  local l_2_3 = "SocksProcessLearning_v1"
  local l_2_4 = 2147483647
  local l_2_5, l_2_6 = pcall(MpCommon.QueryDynamicConfigNumber, "MpRollingQueuesMaxCapacity")
  if not (l_2_5 and l_0_0(l_2_6)) or l_2_6 < 3 then
    return mp.CLEAN, "CapacityUnavailable"
  end
  if 1000 < l_2_6 then
    l_2_6 = 1000
  end
  local l_2_7, l_2_8
  
  local function l_2_9(l_3_0)
    local l_3_1, l_3_2 = pcall(MpCommon.RollingQueueQueryKey, l_2_3, l_3_0)
    if not l_3_1 then
      l_2_7 = "HistoryReadFailed"
    end
    return l_3_1, l_3_2
  end
  
  local function l_2_10(l_4_0, l_4_1)
    local l_4_2 = pcall(MpCommon.RollingQueueAppend, l_2_3, l_4_0, l_4_1, l_2_4)
    if not l_4_2 then
      l_2_7 = "HistoryWriteFailed"
    end
    return l_4_2
  end
  
  if not pcall(MpCommon.RollingQueueCreate, l_2_3, l_2_6, l_2_4, 1) then
    return mp.CLEAN, "HistoryCreateFailed"
  end
  local l_2_11, l_2_12 = pcall(MpCommon.RollingQueueCapacity, l_2_3)
  if not (l_2_11 and l_0_0(l_2_12)) or l_2_12 < 3 then
    return mp.CLEAN, "CapacityUnavailable"
  end
  local l_2_13, l_2_14 = l_2_9("__started__")
  if not l_2_13 then
    return mp.CLEAN, l_2_7
  end
  local l_2_15, l_2_16 = l_2_9("__saturated__")
  if not l_2_15 then
    return mp.CLEAN, l_2_7
  end
  local l_2_17 = type(l_2_14) == "table" and tonumber(l_2_14.value) or nil
  if not l_0_0(l_2_17) or l_2_2 < l_2_17 or type(l_2_16) ~= "table" or l_2_16.value ~= "0" and l_2_16.value ~= "1" then
    if not l_2_10("__started__", string.format("%.0f", l_2_2)) or not l_2_10("__saturated__", "0") then
      return mp.CLEAN, l_2_7
    end
    l_2_17 = l_2_2
    l_2_16 = {value = "0"}
    l_2_8 = "StartingWarmup"
  end
  if l_2_0 == "" then
    return mp.CLEAN, l_2_8
  end
  if type(l_2_1) == "string" then
    l_2_1 = MpCommon.PathToWin32Path(l_2_1)
  end
  if type(l_2_1) ~= "string" or l_2_1 == "" or l_2_1:find("\000", 1, true) or not l_2_1:match("^%a:\\") and not l_2_1:match("^\\\\[^\\]+\\[^\\]+\\") then
    return mp.CLEAN, "ProcessPathUnavailable"
  end
  l_2_1 = l_2_1:lower()
  local l_2_18 = crypto.Sha1Buffer(l_2_1, 0, #l_2_1)
  local l_2_19 = l_2_18 .. "|" .. l_2_0
  local l_2_20, l_2_21 = l_2_9(l_2_19)
  if not l_2_20 then
    return mp.CLEAN, l_2_7
  end
  if l_2_21 ~= nil then
    if type(l_2_21) ~= "table" or l_2_21.value ~= "Seen" then
      if not l_2_10("__started__", string.format("%.0f", l_2_2)) or not l_2_10(l_2_19, "Seen") then
        return mp.CLEAN, l_2_7
      end
      return mp.CLEAN, "InvalidPairHistory"
    end
    return mp.CLEAN, l_2_8
  end
  if l_2_16.value ~= "0" then
    return mp.CLEAN, "HistorySaturatedOrInvalid"
  end
  local l_2_22, l_2_23 = pcall(MpCommon.RollingQueueCount, l_2_3)
  if not (l_2_22 and l_0_0(l_2_23)) or l_2_23 < 2 then
    return mp.CLEAN, "HistoryCountUnavailable"
  end
  if l_2_12 <= l_2_23 then
    if not l_2_10("__saturated__", "1") then
      return mp.CLEAN, l_2_7
    end
    return mp.CLEAN, "HistorySaturated"
  end
  if not l_2_10(l_2_19, "Seen") then
    return mp.CLEAN, l_2_7
  end
  local l_2_24, l_2_25 = l_2_9("__started__")
  if not l_2_24 then
    return mp.CLEAN, l_2_7
  end
  if type(l_2_25) ~= "table" or tonumber(l_2_25.value) ~= l_2_17 then
    return mp.CLEAN, "HistoryChangedDuringUpdate"
  end
  if l_2_2 - l_2_17 < 2592000 then
    return mp.CLEAN, l_2_8
  end
  return mp.INFECTED, nil, "SOCKS|" .. l_2_0 .. "|" .. l_2_18
end
