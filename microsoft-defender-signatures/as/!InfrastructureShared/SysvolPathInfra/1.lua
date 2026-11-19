-- Threat: !InfrastructureShared
-- Name: SysvolPathInfra
-- Type: 1
-- Includes: LuaFuncHelper

function Infrastructure_GetSysvolQueueCapacity()
  local l_1_0, l_1_1 = pcall(MpCommon.QueryDynamicConfigNumber, "MpRollingQueuesMaxCapacity")
  
  if not l_1_0 or type(l_1_1) ~= "number" or l_1_1 < 2 or l_1_1 % 1 ~= 0 then
    return nil
  end
  if 10001 < l_1_1 then
    return 10001
  end
  return l_1_1
end

function Infrastructure_IsNewSysvolWriter(l_2_0, l_2_1, l_2_2, l_2_3)
  local function l_2_4(l_3_0)
    mp.set_mpattribute("MpInternal_researchdata=" .. l_2_3 .. "=" .. l_3_0)
  end
  
  local l_2_5 = MpCommon.GetCurrentTimeT()
  if type(l_2_5) ~= "number" or l_2_5 <= 0 or l_2_5 % 1 ~= 0 then
    l_2_4("InvalidObservationTime")
    return false
  end
  local l_2_6 = Infrastructure_GetSysvolQueueCapacity()
  if not l_2_6 then
    l_2_4("QueueCapacityUnavailable")
    return false
  end
  
  local function l_2_7(l_4_0, l_4_1)
    if not AppendToRollingQueue(l_2_0, l_4_0, l_4_1, l_2_1, l_2_6, 1) then
      l_2_4("HistoryUpdateFailed")
      return false
    end
    return true
  end
  
  local l_2_8, l_2_9 = pcall(MpCommon.RollingQueueQueryKey, l_2_0, "__history__")
  local l_2_10 = l_2_8 and type(l_2_9) == "table" and tonumber(l_2_9.value) or nil
  if not l_2_10 or l_2_10 <= 0 or l_2_10 % 1 ~= 0 or l_2_5 < l_2_10 then
    l_2_4("StartingWarmup")
    l_2_10 = l_2_5
  end
  if not l_2_7("__history__", tostring(l_2_10)) then
    return false
  end
  local l_2_11, l_2_12 = pcall(MpCommon.RollingQueueCapacity, l_2_0)
  if not l_2_11 or type(l_2_12) ~= "number" or l_2_12 < 2 or l_2_12 % 1 ~= 0 then
    l_2_4("QueueCapacityUnavailable")
    l_2_7("__history__", tostring(l_2_5))
    return false
  end
  if l_2_6 > l_2_12 then
    l_2_6 = l_2_12
  end
  local l_2_13, l_2_14 = pcall(MpCommon.RollingQueueQueryKey, l_2_0, l_2_2)
  if not l_2_13 then
    l_2_4("HistoryQueryFailed")
    l_2_7("__history__", tostring(l_2_5))
    return false
  end
  local l_2_15
  if l_2_14 ~= nil then
    l_2_15 = type(l_2_14) == "table" and tonumber(l_2_14.value) or nil
    if not l_2_15 or l_2_15 <= 0 or l_2_15 % 1 ~= 0 or l_2_5 < l_2_15 then
      l_2_4("InvalidTupleHistory")
      l_2_10 = l_2_5
      if not l_2_7("__history__", tostring(l_2_5)) then
        return false
      end
      l_2_15 = nil
    end
  else
    local l_2_16, l_2_17 = pcall(MpCommon.RollingQueueCount, l_2_0)
    if not l_2_16 or type(l_2_17) ~= "number" or l_2_17 < 1 or l_2_6 <= l_2_17 then
      l_2_4("HistoryUnavailableOrFull")
      l_2_7("__history__", tostring(l_2_5))
      return false
    end
  end
  if not l_2_7(l_2_2, tostring(l_2_5)) then
    l_2_7("__history__", tostring(l_2_5))
    return false
  end
  return l_2_1 <= l_2_5 - l_2_10 and (not l_2_15 or l_2_1 <= l_2_5 - l_2_15)
end

function Infrastructure_GetSysvolGpoGuid(l_5_0)
  local l_5_1 = l_5_0:match("^policies\\(.+)$") or l_5_0:match("^[^\\]+\\policies\\(.+)$")
  if not l_5_1 then
    return nil
  end
  return l_5_1:match("^({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})\\.+$")
end

function Infrastructure_GetSysvolFilePath()
  local l_6_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if type(l_6_0) ~= "string" or l_6_0 == "" then
    return nil
  end
  l_6_0 = string.lower(l_6_0)
  if l_6_0:sub(1, 8) == "\\device\\" then
    l_6_0 = MpCommon.PathToWin32Path(l_6_0)
    if type(l_6_0) ~= "string" or l_6_0 == "" then
      return nil, "LocalFilePathUnavailable"
    end
    l_6_0 = string.lower(l_6_0)
  end
  if not l_6_0:match("^[a-z]:\\") or l_6_0:find("\\..\\", 1, true) or l_6_0:find("\\.\\", 1, true) then
    return nil
  end
  local l_6_1 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Netlogon\\Parameters")
  local l_6_2 = l_6_1 and sysio.GetRegValueAsString(l_6_1, "SysVol")
  if type(l_6_2) ~= "string" or l_6_2 == "" then
    return nil, "SysvolRootUnavailable"
  end
  l_6_2 = MpCommon.ExpandEnvironmentVariables(l_6_2)
  if type(l_6_2) ~= "string" or l_6_2 == "" then
    return nil, "SysvolRootExpansionFailed"
  end
  l_6_2 = string.lower(l_6_2):gsub("\\+$", "")
  if not l_6_2:match("^[a-z]:\\") then
    return nil, "InvalidSysvolRoot"
  end
  local l_6_3 = l_6_2 .. "\\"
  if l_6_0:sub(1, #l_6_3) == l_6_3 then
    return l_6_0, nil, l_6_0:sub(#l_6_3 + 1)
  end
  local l_6_4 = l_6_2:match("^(.-)\\sysvol$")
  if l_6_4 and (l_6_4:match("\\sysvol$") or l_6_4:match("\\sysvol_dfsr$")) then
    local l_6_5 = l_6_4 .. "\\domain\\"
    if l_6_0:sub(1, #l_6_5) == l_6_5 then
      return l_6_0, nil, l_6_0:sub(#l_6_5 + 1)
    end
  end
  return nil
end
