-- Threat: !InfrastructureShared
-- Name: !#TEL:Win32/SysvolNewSmbPair.A
-- Type: 12
-- Includes: LuaFuncHelper, SysvolPathInfra
-- MpAttributes: RPF:TopLevelFile & (MpOnOpenRtpScan | MpOnModifiedCloseRtpScan)

local l_0_0 = versioning.GetOrgID()
local l_0_1 = 100
if type(l_0_0) == "string" then
  l_0_0 = l_0_0:lower()
  if l_0_0 == "26e8b179-9fbe-40fd-8f34-37cdee8c4766" or l_0_0 == "e6e2b814-cd64-4ac3-9e16-91753ff30617" or l_0_0 == "bcfa1838-fccc-4999-9d5b-5ec1ac1a4776" then
    l_0_1 = 25000
  end
end
if versioning.IsSampled(l_0_1, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_2 ~= mp.SCANREASON_ONOPEN and l_0_2 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) ~= 4 then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
if type(l_0_3) ~= "string" or l_0_3 == "" or type(l_0_4) ~= "string" or l_0_4 == "" or type(l_0_5) ~= "string" or l_0_5 == "" or l_0_5 == "-" then
  return mp.CLEAN
end
l_0_3, l_0_4, l_0_5 = string.lower(l_0_3), string.lower(l_0_4), string.lower(l_0_5)
if l_0_4 == "nt authority" and l_0_5 == "anonymous logon" then
  return mp.CLEAN
end

local function l_0_6(l_1_0)
  mp.set_mpattribute("MpInternal_researchdata=SysvolNewSmbPairStatus=" .. l_1_0)
end

mp.set_mpattribute("MpDisableCaching")
local l_0_7 = MpCommon.GetCurrentTimeT()
if type(l_0_7) ~= "number" or l_0_7 <= 0 or l_0_7 % 1 ~= 0 then
  l_0_6("InvalidObservationTime")
  return mp.CLEAN
end
local l_0_8 = "SysvolNewSmbPairHistory_v1"
local l_0_9 = 2592000
local l_0_10 = 86400
local l_0_11 = Infrastructure_GetSysvolQueueCapacity()
if not l_0_11 then
  l_0_6("QueueCapacityUnavailable")
  return mp.CLEAN
end
local l_0_12 = l_0_3 .. "\000" .. l_0_4 .. "\000" .. l_0_5
local l_0_13 = crypto.Sha1Buffer(l_0_12, 0, #l_0_12)

local function l_0_14(l_2_0, l_2_1)
  if not AppendToRollingQueue(l_0_8, l_2_0, l_2_1, l_0_9, l_0_11, 1) then
    l_0_6("HistoryUpdateFailed")
    return false
  end
  return true
end

local l_0_15, l_0_16 = pcall(MpCommon.RollingQueueQueryKey, l_0_8, "__history__")
local l_0_17 = l_0_15 and type(l_0_16) == "table" and tonumber(l_0_16.value) or nil
if not l_0_17 or l_0_17 <= 0 or l_0_7 < l_0_17 then
  l_0_6("StartingWarmup")
  l_0_17 = l_0_7
end
if not l_0_14("__history__", tostring(l_0_17)) then
  return mp.CLEAN
end
local l_0_18, l_0_19 = pcall(MpCommon.RollingQueueCapacity, l_0_8)
if not l_0_18 or type(l_0_19) ~= "number" or l_0_19 < 2 or l_0_19 % 1 ~= 0 then
  l_0_6("QueueCapacityUnavailable")
  l_0_14("__history__", tostring(l_0_7))
  return mp.CLEAN
end
if l_0_11 > l_0_19 then
  l_0_11 = l_0_19
end
local l_0_20, l_0_21 = pcall(MpCommon.RollingQueueQueryKey, l_0_8, l_0_13)
if not l_0_20 then
  l_0_6("HistoryQueryFailed")
  l_0_14("__history__", tostring(l_0_7))
  return mp.CLEAN
end
local l_0_22, l_0_23
if l_0_21 ~= nil then
  if type(l_0_21) == "table" and type(l_0_21.value) == "string" then
    l_0_22, l_0_23 = l_0_21.value:match("^(%d+):([01])$")
    l_0_22 = tonumber(l_0_22)
  end
  if not l_0_22 or l_0_22 <= 0 or l_0_7 < l_0_22 then
    l_0_6("InvalidTupleHistory")
    l_0_17 = l_0_7
    if not l_0_14("__history__", tostring(l_0_7)) then
      return mp.CLEAN
    end
    l_0_22, l_0_23 = l_0_7, "0"
  end
else
  local l_0_24, l_0_25 = pcall(MpCommon.RollingQueueCount, l_0_8)
  if not l_0_24 or type(l_0_25) ~= "number" or l_0_25 < 1 or l_0_11 <= l_0_25 then
    l_0_6("HistoryUnavailableOrFull")
    l_0_14("__history__", tostring(l_0_7))
    return mp.CLEAN
  end
  l_0_22, l_0_23 = l_0_7, "0"
end
if not l_0_14(l_0_13, tostring(l_0_22) .. ":" .. l_0_23) then
  l_0_14("__history__", tostring(l_0_7))
  return mp.CLEAN
end
if l_0_9 > l_0_7 - l_0_17 or l_0_10 <= l_0_7 - l_0_22 or l_0_23 == "1" or l_0_2 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_26, l_0_27 = Infrastructure_GetSysvolFilePath()
if l_0_27 then
  l_0_6(l_0_27)
end
if not l_0_26 then
  return mp.CLEAN
end
if not l_0_14(l_0_13, tostring(l_0_22) .. ":1") then
  l_0_14("__history__", tostring(l_0_7))
  return mp.CLEAN
end
local l_0_28 = crypto.Sha1Buffer(l_0_4, 0, #l_0_4)
local l_0_29 = crypto.Sha1Buffer(l_0_5, 0, #l_0_5)
mp.set_mpattribute("MpInternal_researchdata=SysvolNewSmbPair=" .. l_0_3 .. "|" .. l_0_28 .. "|" .. l_0_29 .. "|" .. tostring(l_0_7 - l_0_22))
return mp.INFECTED
