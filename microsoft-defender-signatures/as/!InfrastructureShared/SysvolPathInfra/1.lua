-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\SysvolPathInfra\1.luac 

-- params : ...
-- function num : 0
Infrastructure_GetSysvolQueueCapacity = function()
  -- function num : 0_0
  local l_1_0, l_1_1 = pcall(MpCommon.QueryDynamicConfigNumber, "MpRollingQueuesMaxCapacity")
  if not l_1_0 or type(l_1_1) ~= "number" or l_1_1 < 2 or l_1_1 % 1 ~= 0 then
    return nil
  end
  if l_1_1 > 10001 then
    return 10001
  end
  return l_1_1
end

Infrastructure_IsNewSysvolWriter = function(l_2_0, l_2_1, l_2_2, l_2_3)
  -- function num : 0_1
  local l_2_5 = function(l_3_0)
    -- function num : 0_1_0 , upvalues : l_2_3
    (mp.set_mpattribute)("MpInternal_researchdata=" .. l_2_3 .. "=" .. l_3_0)
  end

  if type((MpCommon.GetCurrentTimeT)()) ~= "number" or (MpCommon.GetCurrentTimeT)() <= 0 or (MpCommon.GetCurrentTimeT)() % 1 ~= 0 then
    l_2_5("InvalidObservationTime")
    return false
  end
  local l_2_6 = nil
  if not Infrastructure_GetSysvolQueueCapacity() then
    l_2_5("QueueCapacityUnavailable")
    return false
  end
  local l_2_8, l_2_9 = , function(l_4_0, l_4_1)
    -- function num : 0_1_1 , upvalues : l_2_0, l_2_1, l_2_6, l_2_4
    if not AppendToRollingQueue(l_2_0, l_4_0, l_4_1, l_2_1, l_2_6, 1) then
      l_2_4("HistoryUpdateFailed")
      return false
    end
    return true
  end

  do
    local l_2_10, l_2_11, l_2_12, l_2_13 = , pcall(MpCommon.RollingQueueQueryKey, l_2_0, "__history__") and type(R11_PC44) == "table" and tonumber(R11_PC44) or nil, R11_PC44
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R10 in 'UnsetPending'

    -- DECOMPILER ERROR at PC55: Confused about usage of register: R10 in 'UnsetPending'

    -- DECOMPILER ERROR at PC57: Confused about usage of register: R10 in 'UnsetPending'

    -- DECOMPILER ERROR at PC57: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC60: Confused about usage of register: R10 in 'UnsetPending'

    if not l_2_12 or l_2_12 <= 0 or l_2_13 ~= 0 or l_2_6 < l_2_12 then
      l_2_5("StartingWarmup")
      local l_2_14, l_2_15 = nil
    end
    do
      if not l_2_9("__history__", tostring(l_2_6)) then
        return false
      end
      local l_2_16, l_2_17 = nil
      if not pcall(MpCommon.RollingQueueCapacity, l_2_0) or type(R14_PC85) ~= "number" or MpCommon.RollingQueueCapacity < 2 or MpCommon.RollingQueueCapacity % 1 ~= 0 then
        l_2_5(R14_PC85)
        -- DECOMPILER ERROR at PC97: Overwrote pending register: R14 in 'AssignReg'

        l_2_9(R14_PC85, tostring(l_2_6))
        return false
      end
      if MpCommon.RollingQueueCapacity < l_2_8 then
        l_2_8 = 
      end
      -- DECOMPILER ERROR at PC108: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC109: Overwrote pending register: R14 in 'AssignReg'

      local l_2_18, l_2_19 = nil
      if not pcall(R14_PC85, l_2_0, l_2_2) then
        l_2_5("HistoryQueryFailed")
        l_2_9("__history__", tostring(l_2_6))
        return false
      end
      local l_2_20 = nil
      -- DECOMPILER ERROR at PC142: Confused about usage of register: R15 in 'UnsetPending'

      -- DECOMPILER ERROR at PC144: Confused about usage of register: R15 in 'UnsetPending'

      -- DECOMPILER ERROR at PC147: Confused about usage of register: R15 in 'UnsetPending'

      -- DECOMPILER ERROR at PC150: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

      -- DECOMPILER ERROR at PC151: Unhandled construct in 'MakeBoolean' P3

      if ((type(R17_PC131) ~= "table" or not tonumber(R17_PC131)) and not R14_PC85 == nil or nil) or l_2_6 < R14_PC85 == nil or nil then
        l_2_5(R17_PC131)
        l_2_18 = l_2_6
        -- DECOMPILER ERROR at PC154: Overwrote pending register: R17 in 'AssignReg'

        if not l_2_9(R17_PC131, tostring(l_2_6)) then
          return false
        end
      end
      -- DECOMPILER ERROR at PC166: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC167: Overwrote pending register: R17 in 'AssignReg'

      do
        do
          local l_2_21, l_2_22 = , R14_PC85
          if not pcall(R17_PC131, l_2_0) or type(R19_PC174) ~= "number" or R17_PC131 < 1 or l_2_8 <= R17_PC131 then
            l_2_5(R19_PC174)
            -- DECOMPILER ERROR at PC185: Overwrote pending register: R19 in 'AssignReg'

            l_2_9(R19_PC174, tostring(l_2_6))
            return false
          end
          -- DECOMPILER ERROR at PC193: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC195: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC201: Overwrote pending register: R17 in 'AssignReg'

          if not l_2_9(R17_PC131, tostring(R19_PC174)) then
            l_2_9(R17_PC131, tostring(l_2_6))
            return false
          end
          -- DECOMPILER ERROR at PC213: Confused about usage of register: R15 in 'UnsetPending'

          do return l_2_1 <= l_2_6 - l_2_18 and not nil or l_2_1 <= l_2_6 - nil end
          -- DECOMPILER ERROR at PC219: freeLocal<0 in 'ReleaseLocals'

          -- DECOMPILER ERROR: 1 unprocessed JMP targets
        end
      end
    end
  end
end

Infrastructure_GetSysvolGpoGuid = function(l_3_0)
  -- function num : 0_2
  do
    if not l_3_0:match("^policies\\(.+)$") then
      local l_3_1, l_3_2 = l_3_0:match("^[^\\]+\\policies\\(.+)$")
    end
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

    if not l_3_1 then
      return nil
    end
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    local l_3_3, l_3_4 = , l_3_1:match
    local l_3_5 = l_3_1
    do return l_3_4(l_3_5, "^({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})\\.+$") end
    -- DECOMPILER ERROR at PC16: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

Infrastructure_GetSysvolFilePath = function()
  -- function num : 0_3
  local l_4_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if type(l_4_0) ~= "string" or l_4_0 == "" then
    return nil
  end
  l_4_0 = (string.lower)(l_4_0)
  if l_4_0:sub(1, 8) == "\\device\\" then
    l_4_0 = (MpCommon.PathToWin32Path)(l_4_0)
    if type(l_4_0) ~= "string" or l_4_0 == "" then
      return nil, "LocalFilePathUnavailable"
    end
    l_4_0 = (string.lower)(l_4_0)
  end
  if not l_4_0:match("^[a-z]:\\") or l_4_0:find("\\..\\", 1, true) or l_4_0:find("\\.\\", 1, true) then
    return nil
  end
  local l_4_1 = (sysio.RegOpenKey)("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Netlogon\\Parameters")
  if (l_4_1 and type((sysio.GetRegValueAsString)(l_4_1, "SysVol")) ~= "string") or (sysio.GetRegValueAsString)(l_4_1, "SysVol") == "" then
    return nil, "SysvolRootUnavailable"
  end
  -- DECOMPILER ERROR at PC102: Confused about usage of register: R2 in 'UnsetPending'

  if type((MpCommon.ExpandEnvironmentVariables)((sysio.GetRegValueAsString)(l_4_1, "SysVol"))) ~= "string" or (MpCommon.ExpandEnvironmentVariables)((sysio.GetRegValueAsString)(l_4_1, "SysVol")) == "" then
    return nil, "SysvolRootExpansionFailed"
  end
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R2 in 'UnsetPending'

  if not (((string.lower)((MpCommon.ExpandEnvironmentVariables)((sysio.GetRegValueAsString)(l_4_1, "SysVol")))):gsub("\\+$", "")):match("^[a-z]:\\") then
    return nil, "InvalidSysvolRoot"
  end
  -- DECOMPILER ERROR at PC124: Confused about usage of register: R2 in 'UnsetPending'

  local l_4_3 = nil
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC136: Confused about usage of register: R3 in 'UnsetPending'

  if l_4_0:sub(1, #((string.lower)((MpCommon.ExpandEnvironmentVariables)((sysio.GetRegValueAsString)(l_4_1, "SysVol")))):gsub("\\+$", "") .. "\\") == ((string.lower)((MpCommon.ExpandEnvironmentVariables)((sysio.GetRegValueAsString)(l_4_1, "SysVol")))):gsub("\\+$", "") .. "\\" then
    return l_4_0, nil, l_4_0:sub(#((string.lower)((MpCommon.ExpandEnvironmentVariables)((sysio.GetRegValueAsString)(l_4_1, "SysVol")))):gsub("\\+$", "") .. "\\" + 1)
  end
  local l_4_4 = nil
  do
    do
      if l_4_3:match("^(.-)\\sysvol$") and ((l_4_3:match("^(.-)\\sysvol$")):match("\\sysvol$") or (l_4_3:match("^(.-)\\sysvol$")):match("\\sysvol_dfsr$")) then
        local l_4_5 = nil
        -- DECOMPILER ERROR at PC162: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC167: Confused about usage of register: R5 in 'UnsetPending'

        if l_4_0:sub(1, #l_4_3:match("^(.-)\\sysvol$") .. "\\domain\\") == l_4_3:match("^(.-)\\sysvol$") .. "\\domain\\" then
          return l_4_0, nil, l_4_0:sub(#l_4_3:match("^(.-)\\sysvol$") .. "\\domain\\" + 1)
        end
      end
      do return nil end
      -- DECOMPILER ERROR at PC173: freeLocal<0 in 'ReleaseLocals'

    end
  end
end


