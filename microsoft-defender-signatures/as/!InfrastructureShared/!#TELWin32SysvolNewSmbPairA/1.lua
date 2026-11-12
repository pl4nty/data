-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELWin32SysvolNewSmbPairA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID) ~= 4 then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
if type(l_0_1) ~= "string" or l_0_1 == "" or type(l_0_2) ~= "string" or l_0_2 == "" or type(l_0_3) ~= "string" or l_0_3 == "" or l_0_3 == "-" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_2 == "nt authority" and l_0_3 == "anonymous logon" then
  return mp.CLEAN
end
local l_0_4 = function(l_1_0)
  -- function num : 0_0
  (mp.set_mpattribute)("MpInternal_researchdata=SysvolNewSmbPairStatus=" .. l_1_0)
end

;
(mp.set_mpattribute)("MpDisableCaching")
local l_0_5 = (MpCommon.GetCurrentTimeT)()
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
local l_0_11 = (crypto.Sha1Buffer)(l_0_10, 0, #l_0_10)
local l_0_13, l_0_14 = function(l_2_0, l_2_1)
  -- function num : 0_1 , upvalues : l_0_6, l_0_7, l_0_9, l_0_4
  if not AppendToRollingQueue(l_0_6, l_2_0, l_2_1, l_0_7, l_0_9, 1) then
    l_0_4("HistoryUpdateFailed")
    return false
  end
  return true
end
, pcall(MpCommon.RollingQueueQueryKey, l_0_6, "__history__")
do
  local l_0_15, l_0_16, l_0_17 = , l_0_14 and type(R16_PC153) == "table" and tonumber(R16_PC153) or nil, R16_PC153
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R15 in 'UnsetPending'

  -- DECOMPILER ERROR at PC164: Confused about usage of register: R15 in 'UnsetPending'

  -- DECOMPILER ERROR at PC166: Confused about usage of register: R15 in 'UnsetPending'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R16 in 'AssignReg'

  if not l_0_16 or l_0_16 <= 0 or l_0_5 < l_0_16 then
    l_0_17("StartingWarmup")
    local l_0_18, l_0_19 = , l_0_5
  end
  do
    -- DECOMPILER ERROR at PC175: Confused about usage of register: R15 in 'UnsetPending'

    if not l_0_13("__history__", tostring(l_0_19)) then
      return mp.CLEAN
    end
    local l_0_20, l_0_21 = nil
    if not pcall(MpCommon.RollingQueueCapacity, l_0_6) or type(R19_PC192) ~= "number" or MpCommon.RollingQueueCapacity < 2 or MpCommon.RollingQueueCapacity % 1 ~= 0 then
      l_0_4(R19_PC192)
      -- DECOMPILER ERROR at PC204: Overwrote pending register: R19 in 'AssignReg'

      l_0_13(R19_PC192, tostring(l_0_5))
      return mp.CLEAN
    end
    if MpCommon.RollingQueueCapacity < l_0_9 then
      l_0_9 = 
    end
    -- DECOMPILER ERROR at PC216: Overwrote pending register: R19 in 'AssignReg'

    -- DECOMPILER ERROR at PC217: Overwrote pending register: R19 in 'AssignReg'

    local l_0_22, l_0_23 = nil
    if not pcall(R19_PC192, l_0_6, l_0_11) then
      l_0_4("HistoryQueryFailed")
      l_0_13("__history__", tostring(l_0_5))
      return mp.CLEAN
    end
    local l_0_24, l_0_25 = , R19_PC192
    -- DECOMPILER ERROR at PC252: Overwrote pending register: R21 in 'AssignReg'

    -- DECOMPILER ERROR at PC253: Overwrote pending register: R20 in 'AssignReg'

    -- DECOMPILER ERROR at PC260: Confused about usage of register: R20 in 'UnsetPending'

    -- DECOMPILER ERROR at PC262: Confused about usage of register: R20 in 'UnsetPending'

    -- DECOMPILER ERROR at PC266: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC266: Unhandled construct in 'MakeBoolean' P1

    if (type(l_0_25) == "table" and type(l_0_25.value) == "string" and not tonumber(nil)) or l_0_5 < tonumber(nil) then
      l_0_4("InvalidTupleHistory")
      if not l_0_13("__history__", tostring(l_0_5)) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC280: Overwrote pending register: R21 in 'AssignReg'

    end
    do
      local l_0_26, l_0_27 = l_0_5, nil
      if not pcall(MpCommon.RollingQueueCount, l_0_6) or type(R25_PC292) ~= "number" or MpCommon.RollingQueueCount < 1 or l_0_9 <= MpCommon.RollingQueueCount then
        l_0_4(R25_PC292)
        -- DECOMPILER ERROR at PC303: Overwrote pending register: R25 in 'AssignReg'

        l_0_13(R25_PC292, tostring(l_0_5))
        return mp.CLEAN
      end
      l_0_26 = l_0_5
      -- DECOMPILER ERROR at PC317: Confused about usage of register: R20 in 'UnsetPending'

      -- DECOMPILER ERROR at PC317: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC319: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC328: Overwrote pending register: R25 in 'AssignReg'

      if not l_0_13(l_0_11, tostring(R25_PC292) .. R25_PC292 .. l_0_27) then
        l_0_13("__history__", tostring(R25_PC292))
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC337: Confused about usage of register: R20 in 'UnsetPending'

      -- DECOMPILER ERROR at PC340: Confused about usage of register: R21 in 'UnsetPending'

      if l_0_5 - l_0_21 < l_0_7 or l_0_8 <= l_0_5 - l_0_26 or l_0_27 == "1" or l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
        return mp.CLEAN
      end
      local l_0_28, l_0_29 = nil
      if "__history__" then
        l_0_4(R25_PC355)
      end
      if not Infrastructure_GetSysvolFilePath() then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC372: Overwrote pending register: R25 in 'AssignReg'

      if not l_0_13(R25_PC355, tostring(l_0_28) .. ":1") then
        l_0_13(R25_PC355, tostring(l_0_5))
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC382: Overwrote pending register: R25 in 'AssignReg'

      local l_0_30 = nil
      -- DECOMPILER ERROR at PC386: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC387: Overwrote pending register: R25 in 'AssignReg'

      do
        local l_0_31 = nil
        ;
        (mp.set_mpattribute)("MpInternal_researchdata=SysvolNewSmbPair=" .. l_0_1 .. "|" .. (crypto.Sha1Buffer)(R25_PC355, 0, #l_0_2) .. "|" .. R25_PC355 .. "|" .. tostring(l_0_5 - l_0_28))
        do return mp.INFECTED end
        -- DECOMPILER ERROR at PC409: freeLocal<0 in 'ReleaseLocals'

      end
    end
  end
end

