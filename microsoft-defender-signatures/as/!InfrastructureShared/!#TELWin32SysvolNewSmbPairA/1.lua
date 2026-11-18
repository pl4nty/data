-- Threat: !InfrastructureShared
-- Name: !#TEL:Win32/SysvolNewSmbPair.A
-- Type: 12
-- Includes: LuaFuncHelper, SysvolPathInfra
-- MpAttributes: RPF:TopLevelFile & (MpOnOpenRtpScan | MpOnModifiedCloseRtpScan)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) ~= 4 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
if type(l_0_1) ~= "string" or l_0_1 == "" or type(l_0_2) ~= "string" or l_0_2 == "" or type(l_0_3) ~= "string" or l_0_3 == "" or l_0_3 == "-" then
  return mp.CLEAN
end
l_0_1, l_0_2, l_0_3 = string.lower(l_0_1), string.lower(l_0_2), string.lower(l_0_3)
if l_0_2 == "nt authority" and l_0_3 == "anonymous logon" then
  return mp.CLEAN
end

local function l_0_4(l_1_0)
  mp.set_mpattribute("MpInternal_researchdata=SysvolNewSmbPairStatus=" .. l_1_0)
end

mp.set_mpattribute("MpDisableCaching")
local l_0_5 = MpCommon.GetCurrentTimeT()
if type(l_0_5) ~= "number" or l_0_5 <= 0 or l_0_5 % 1 ~= 0 then
  l_0_4("InvalidObservationTime")
  return mp.CLEAN
end
local l_0_6 = "SysvolNewSmbPairHistory_v1"
local l_0_7 = 2592000
local l_0_8 = 86400
local l_0_9 = Infrastructure_GetSysvolQueueCapacity()
if not l_0_9 then
  l_0_4("QueueCapacityUnavailable")
  return mp.CLEAN
end
local l_0_10 = l_0_1 .. "\000" .. l_0_2 .. "\000" .. l_0_3
local l_0_11 = crypto.Sha1Buffer(l_0_10, 0, #l_0_10)

local function l_0_12(l_2_0, l_2_1)
  if not AppendToRollingQueue(l_0_6, l_2_0, l_2_1, l_0_7, l_0_9, 1) then
    l_0_4("HistoryUpdateFailed")
    return false
  end
  return true
end

local l_0_13, l_0_14 = pcall(MpCommon.RollingQueueQueryKey, l_0_6, "__history__")
local l_0_15 = l_0_13 and type(l_0_14) == "table" and tonumber(l_0_14.value) or nil
if not l_0_15 or l_0_15 <= 0 or l_0_5 < l_0_15 then
  l_0_4("StartingWarmup")
  l_0_15 = l_0_5
end
if not l_0_12("__history__", tostring(l_0_15)) then
  return mp.CLEAN
end
local l_0_16, l_0_17 = pcall(MpCommon.RollingQueueCapacity, l_0_6)
if not l_0_16 or type(l_0_17) ~= "number" or l_0_17 < 2 or l_0_17 % 1 ~= 0 then
  l_0_4("QueueCapacityUnavailable")
  l_0_12("__history__", tostring(l_0_5))
  return mp.CLEAN
end
if l_0_9 > l_0_17 then
  l_0_9 = l_0_17
end
local l_0_18, l_0_19 = pcall(MpCommon.RollingQueueQueryKey, l_0_6, l_0_11)
if not l_0_18 then
  l_0_4("HistoryQueryFailed")
  l_0_12("__history__", tostring(l_0_5))
  return mp.CLEAN
end
local l_0_20, l_0_21
if l_0_19 ~= nil then
  if type(l_0_19) == "table" and type(l_0_19.value) == "string" then
    l_0_20, l_0_21 = l_0_19.value:match("^(%d+):([01])$")
    l_0_20 = tonumber(l_0_20)
  end
  if not l_0_20 or l_0_20 <= 0 or l_0_5 < l_0_20 then
    l_0_4("InvalidTupleHistory")
    l_0_15 = l_0_5
    if not l_0_12("__history__", tostring(l_0_5)) then
      return mp.CLEAN
    end
    l_0_20, l_0_21 = l_0_5, "0"
  end
else
  local l_0_22, l_0_23 = pcall(MpCommon.RollingQueueCount, l_0_6)
  if not l_0_22 or type(l_0_23) ~= "number" or l_0_23 < 1 or l_0_9 <= l_0_23 then
    l_0_4("HistoryUnavailableOrFull")
    l_0_12("__history__", tostring(l_0_5))
    return mp.CLEAN
  end
  l_0_20, l_0_21 = l_0_5, "0"
end
if not l_0_12(l_0_11, tostring(l_0_20) .. ":" .. l_0_21) then
  l_0_12("__history__", tostring(l_0_5))
  return mp.CLEAN
end
if l_0_7 > l_0_5 - l_0_15 or l_0_8 <= l_0_5 - l_0_20 or l_0_21 == "1" or l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_24, l_0_25 = Infrastructure_GetSysvolFilePath()
if l_0_25 then
  l_0_4(l_0_25)
end
if not l_0_24 then
  return mp.CLEAN
end
if not l_0_12(l_0_11, tostring(l_0_20) .. ":1") then
  l_0_12("__history__", tostring(l_0_5))
  return mp.CLEAN
end
local l_0_26 = crypto.Sha1Buffer(l_0_2, 0, #l_0_2)
local l_0_27 = crypto.Sha1Buffer(l_0_3, 0, #l_0_3)
mp.set_mpattribute("MpInternal_researchdata=SysvolNewSmbPair=" .. l_0_1 .. "|" .. l_0_26 .. "|" .. l_0_27 .. "|" .. tostring(l_0_5 - l_0_20))
return mp.INFECTED
