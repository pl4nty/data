-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\TechniqueTracker\1.luac 

-- params : ...
-- function num : 0
validate_research_data = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = 1024
  local l_1_3 = 4
  do
    local l_1_4 = 32
    if l_1_4 < (string.len)(l_1_0) then
      return false
    end
    do return l_1_3 <= (string.len)(l_1_1) and (string.len)(l_1_1) <= l_1_2 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

set_researchdata_fromtable = function(l_2_0, l_2_1)
  -- function num : 0_1
  if l_2_0 == nil then
    return false
  end
  if not l_2_1 then
    l_2_1 = false
  end
  if l_2_1 then
    local l_2_2 = safeJsonSerialize(l_2_0)
    if l_2_2 ~= nil then
      (bm.add_related_string)("TTData", l_2_2, bm.RelatedStringBMReport)
    end
  else
    do
      for l_2_6,l_2_7 in pairs(l_2_0) do
        local l_2_8 = (string.format)("MpInternal_researchdata=%s=%s", l_2_6, tostring(l_2_7))
        ;
        (mp.set_mpattribute)(l_2_8)
      end
      do
        return true
      end
    end
  end
end

StringEndsWith = function(l_3_0, l_3_1)
  -- function num : 0_2
  do return l_3_1 == "" or (string.sub)(l_3_0, -(string.len)(l_3_1)) == l_3_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

StringStartsWith = function(l_4_0, l_4_1)
  -- function num : 0_3
  do return l_4_1 == "" or (string.sub)(l_4_0, 1, (string.len)(l_4_1)) == l_4_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

StringSplit = function(l_5_0, l_5_1)
  -- function num : 0_4
  if l_5_1 == nil then
    l_5_1 = "%s"
  end
  local l_5_2 = {}
  for l_5_6 in (string.gmatch)(l_5_0, "([^" .. l_5_1 .. "]+)") do
    (table.insert)(l_5_2, l_5_6)
  end
  return l_5_2
end

AddTechniqueGlobal = function(l_6_0, l_6_1)
  -- function num : 0_5
  local l_6_2, l_6_3 = IsTechniqueObservedGlobal(l_6_0, true)
  do
    if l_6_2 then
      local l_6_4, l_6_5 = tonumber(l_6_3) + 1
    end
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R4 in 'UnsetPending'

    AppendToRollingQueue("gTechniquesTable", l_6_0, l_6_4, l_6_1, 100, 1)
  end
end

AddTacticGlobal = function(l_7_0, l_7_1)
  -- function num : 0_6
  local l_7_2, l_7_3 = IsTacticObservedGlobal(l_7_0, true)
  do
    if l_7_2 then
      local l_7_4, l_7_5 = tonumber(l_7_3) + 1
    end
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R4 in 'UnsetPending'

    AppendToRollingQueue("gTacticsTable", l_7_0, l_7_4, l_7_1, 100, 1)
  end
end

AddTechniqueForPid = function(l_8_0, l_8_1, l_8_2)
  -- function num : 0_7
  if l_8_0 == nil or l_8_0 == "" or l_8_1 == nil or l_8_1 == "" then
    return 
  end
  if not l_8_2 then
    l_8_2 = 3600
  end
  l_8_0 = GetRealPidForScenario(l_8_0)
  local l_8_3 = IsTechniqueObservedForPid(l_8_0, l_8_1)
  do
    if l_8_3 then
      local l_8_4, l_8_5, l_8_6 = l_8_0 + 1
    else
    end
    AppendToRollingQueue("Tech-" .. l_8_0, l_8_1, 1, l_8_2)
  end
end

AddTacticForPid = function(l_9_0, l_9_1, l_9_2)
  -- function num : 0_8
  if l_9_0 == nil or l_9_0 == "" or l_9_1 == nil or l_9_1 == "" then
    return 
  end
  if not l_9_2 then
    l_9_2 = 3600
  end
  l_9_0 = GetRealPidForScenario(l_9_0)
  local l_9_3 = IsTacticObservedForPid(l_9_0, l_9_1)
  do
    if l_9_3 then
      local l_9_4, l_9_5, l_9_6 = l_9_0 + 1
    else
    end
    AppendToRollingQueue("Tact-" .. l_9_0, l_9_1, 1, l_9_2)
  end
end

AddPidGlobal = function(l_10_0, l_10_1)
  -- function num : 0_9
  l_10_0 = GetRealPidForScenario(l_10_0)
  AppendToRollingQueue("gPidsTable", l_10_0, 1, l_10_1, 500, 1)
end

GetRealPidForScenario = function(l_11_0)
  -- function num : 0_10
  if l_11_0 == nil then
    return l_11_0, l_11_0
  end
  if l_11_0:match("pid:.+,ProcessStart:.+") then
    return l_11_0, l_11_0
  end
  local l_11_1 = nil
  if l_11_0 == "CMDHSTR" then
    local l_11_2, l_11_3 = pcall(mp.GetParentProcInfo)
    if l_11_2 and l_11_3 ~= nil then
      l_11_1 = l_11_3.ppid
    else
      l_11_1 = (mp.GetScannedPPID)()
    end
  else
    do
      if l_11_0 == "BM" then
        local l_11_4, l_11_5 = pcall(bm.get_current_process_startup_info)
        if l_11_4 and l_11_5 ~= nil then
          l_11_1 = l_11_5.ppid
        end
      else
        do
          if l_11_0 == "AMSI" then
            local l_11_6, l_11_7 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
            if l_11_6 and l_11_7 ~= nil then
              l_11_1 = l_11_7
            end
          else
            do
              do
                if l_11_0 == "RTP" then
                  local l_11_8, l_11_9 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESS_PPID)
                  if l_11_8 and l_11_9 ~= nil then
                    l_11_1 = l_11_9
                  end
                end
                if l_11_1 == nil then
                  l_11_1 = l_11_0
                end
                return l_11_1, l_11_0
              end
            end
          end
        end
      end
    end
  end
end

GetTechniquesTableForPid = function(l_12_0)
  -- function num : 0_11
  l_12_0 = GetRealPidForScenario(l_12_0)
  local l_12_1 = GetRollingQueueAsHashTable
  do
    local l_12_3 = "Tech-"
    l_12_3 = l_12_3 .. l_12_0
    local l_12_2 = nil
    do return l_12_1(l_12_3) end
    -- DECOMPILER ERROR at PC10: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

GetTacticsTableForPid = function(l_13_0)
  -- function num : 0_12
  l_13_0 = GetRealPidForScenario(l_13_0)
  local l_13_1 = GetRollingQueueAsHashTable
  do
    local l_13_3 = "Tact-"
    l_13_3 = l_13_3 .. l_13_0
    local l_13_2 = nil
    do return l_13_1(l_13_3) end
    -- DECOMPILER ERROR at PC10: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

GetTechniquesTableGlobal = function()
  -- function num : 0_13
  local l_14_0 = GetRollingQueueAsHashTable
  local l_14_1 = "gTechniquesTable"
  do return l_14_0(l_14_1) end
  -- DECOMPILER ERROR at PC4: Confused about usage of register R1 for local variables in 'ReleaseLocals'

end

GetTacticsTableGlobal = function()
  -- function num : 0_14
  local l_15_0 = GetRollingQueueAsHashTable
  local l_15_1 = "gTacticsTable"
  do return l_15_0(l_15_1) end
  -- DECOMPILER ERROR at PC4: Confused about usage of register R1 for local variables in 'ReleaseLocals'

end

GetPidsTableGlobal = function()
  -- function num : 0_15
  local l_16_0 = GetRollingQueueAsHashTable
  local l_16_1 = "gPidsTable"
  do return l_16_0(l_16_1) end
  -- DECOMPILER ERROR at PC4: Confused about usage of register R1 for local variables in 'ReleaseLocals'

end

GetTechniquesCountGlobal = function()
  -- function num : 0_16
  local l_17_0, l_17_1 = pcall(MpCommon.RollingQueueCount, "gTechniquesTable")
  if l_17_0 and l_17_1 ~= nil then
    return l_17_1
  end
  return 0
end

GetTacticsCountGlobal = function()
  -- function num : 0_17
  local l_18_0, l_18_1 = pcall(MpCommon.RollingQueueCount, "gTacticsTable")
  if l_18_0 and l_18_1 ~= nil then
    return l_18_1
  end
  return 0
end

GetTrackedPidsCountGlobal = function()
  -- function num : 0_18
  local l_19_0, l_19_1 = pcall(MpCommon.RollingQueueCount, "gPidsTable")
  if l_19_0 and l_19_1 ~= nil then
    return l_19_1
  end
  return 0
end

GetTechniquesCountForPid = function(l_20_0)
  -- function num : 0_19
  l_20_0 = GetRealPidForScenario(l_20_0)
  local l_20_1, l_20_2 = pcall(MpCommon.RollingQueueCount, "Tech-" .. l_20_0)
  if l_20_1 and l_20_2 ~= nil then
    return l_20_2
  end
  return 0
end

GetTacticsCountForPid = function(l_21_0)
  -- function num : 0_20
  l_21_0 = GetRealPidForScenario(l_21_0)
  local l_21_1, l_21_2 = pcall(MpCommon.RollingQueueCount, "Tact-" .. l_21_0)
  if l_21_1 and l_21_2 ~= nil then
    return l_21_2
  end
  return 0
end

IsTechniqueObservedGlobal = function(l_22_0, l_22_1)
  -- function num : 0_21
  if not l_22_1 then
    l_22_1 = false
  end
  local l_22_2 = IsKeyInRollingQueue
  local l_22_3 = "gTechniquesTable"
  local l_22_4 = l_22_0
  do
    local l_22_5 = l_22_1
    do return l_22_2(l_22_3, l_22_4, l_22_5) end
    -- DECOMPILER ERROR at PC9: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

IsTacticObservedGlobal = function(l_23_0, l_23_1)
  -- function num : 0_22
  if not l_23_1 then
    l_23_1 = false
  end
  local l_23_2 = IsKeyInRollingQueue
  local l_23_3 = "gTacticsTable"
  local l_23_4 = l_23_0
  do
    local l_23_5 = l_23_1
    do return l_23_2(l_23_3, l_23_4, l_23_5) end
    -- DECOMPILER ERROR at PC9: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

IsPidObservedGlobal = function(l_24_0)
  -- function num : 0_23
  l_24_0 = GetRealPidForScenario(l_24_0)
  local l_24_1 = IsKeyInRollingQueue
  local l_24_2 = "gPidsTable"
  local l_24_3 = l_24_0
  do
    local l_24_4 = true
    do return l_24_1(l_24_2, l_24_3, l_24_4) end
    -- DECOMPILER ERROR at PC10: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

IsTechniqueObservedForPid = function(l_25_0, l_25_1, l_25_2)
  -- function num : 0_24
  if l_25_0 == nil or l_25_0 == "" or l_25_1 == nil or l_25_1 == "" then
    return false, nil
  end
  l_25_0 = GetRealPidForScenario(l_25_0)
  if not l_25_2 then
    l_25_2 = false
  end
  local l_25_3 = IsKeyInRollingQueue
  local l_25_4 = "Tech-" .. l_25_0
  local l_25_5 = l_25_1
  do
    local l_25_6 = l_25_2
    do return l_25_3(l_25_4, l_25_5, l_25_6) end
    -- DECOMPILER ERROR at PC26: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

IsTacticObservedForPid = function(l_26_0, l_26_1, l_26_2)
  -- function num : 0_25
  if l_26_0 == nil or l_26_0 == "" or l_26_1 == nil or l_26_1 == "" then
    return false, nil
  end
  l_26_0 = GetRealPidForScenario(l_26_0)
  if not l_26_2 then
    l_26_2 = false
  end
  local l_26_3 = IsKeyInRollingQueue
  local l_26_4 = "Tact-" .. l_26_0
  local l_26_5 = l_26_1
  do
    local l_26_6 = l_26_2
    do return l_26_3(l_26_4, l_26_5, l_26_6) end
    -- DECOMPILER ERROR at PC26: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

IsPidExcluded = function(l_27_0)
  -- function num : 0_26
  if IsTacticObservedForPid(l_27_0, "ttexclusion") or IsTechniqueObservedForPid(l_27_0, "ttexclusion") then
    return true
  end
  if IsLegacyOrgMachine() then
    return true
  end
  return false
end

GetDetectionThresholdMetReason = function(l_28_0, l_28_1, l_28_2, l_28_3, l_28_4)
  -- function num : 0_27
  local l_28_5 = IsPidObservedGlobal(l_28_0)
  local l_28_6 = false
  local l_28_7 = 0
  if l_28_5 then
    local l_28_8 = GetTechniquesCountGlobal()
    local l_28_9 = GetTacticsCountGlobal()
    local l_28_10 = 0
    local l_28_11 = 0
    local l_28_12 = ""
    local l_28_13 = ""
    local l_28_14 = GetTacticsTableForPid(l_28_0)
    local l_28_15 = GetTechniquesTableForPid(l_28_0)
    if l_28_14 == nil or l_28_15 == nil then
      return false, 0
    end
    for l_28_19,l_28_20 in pairs(l_28_14) do
      if l_28_19 ~= nil then
        l_28_13 = (string.format)("%s%s%s", l_28_13, "|", l_28_19)
      end
      if l_28_20 ~= nil and type(l_28_20) == "number" then
        l_28_11 = l_28_11 + l_28_20
      end
    end
    l_28_13 = (string.lower)(l_28_13)
    for l_28_24,l_28_25 in pairs(l_28_15) do
      if l_28_24 ~= nil then
        l_28_12 = (string.format)("%s%s%s", l_28_12, "|", l_28_24)
      end
      if l_28_25 ~= nil and type(l_28_25) == "number" then
        l_28_10 = l_28_10 + l_28_25
      end
    end
    l_28_12 = (string.lower)(l_28_12)
    if l_28_13:find("ttexclusion", 1, true) or l_28_12:find("ttexclusion", 1, true) or IsLegacyOrgMachine() then
      l_28_7 = (mp.bitor)(l_28_7, 2147483648)
    end
    local l_28_26 = GetTaintLevelHR()
    if l_28_26 == "Medium" or l_28_26 == "High" then
      l_28_7 = (mp.bitor)(l_28_7, 1)
    end
    if GetTaintLevelML() == "High" then
      l_28_7 = (mp.bitor)(l_28_7, 1)
    end
    if l_28_13:find("processinjection_target", 1, true) or l_28_13:find("processhollowing_target", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 2)
    end
    if l_28_13:find("processinjection", 1, true) and l_28_13:find("keylog", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 4)
    end
    if l_28_13:find("indirectcmdexec", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 8)
    end
    if l_28_13:find("processinjection", 1, true) and IsTacticObservedGlobal("processdiscovery") then
      l_28_7 = (mp.bitor)(l_28_7, 16)
    end
    if l_28_13:find("credentialdumping", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 32)
    end
    if l_28_13:find("command_control_l", 1, true) or l_28_13:find("command_control_n", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 1024)
    end
    if l_28_12:find("T1036", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 128)
    end
    if l_28_12:find("T1027.002", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 256)
    end
    if l_28_12:find("T1505.003", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 4096)
    end
    if l_28_13:find("_malware", 1, true) or l_28_12:find("tt-thresholdmet", 1, true) or l_28_13:find("tt-thresholdmet", 1, true) then
      l_28_7 = (mp.bitor)(l_28_7, 2048)
    end
  end
  do
    if l_28_7 ~= 0 then
      l_28_6 = true
      if (mp.bitand)(l_28_7, 2147483648) ~= 0 then
        l_28_6 = false
      end
    end
    return l_28_6, l_28_7
  end
end

IsDetectionThresholdMet = function(l_29_0, l_29_1, l_29_2, l_29_3, l_29_4)
  -- function num : 0_28
  if not l_29_1 then
    l_29_1 = 0
  end
  if not l_29_2 then
    l_29_2 = 0
  end
  if not l_29_3 then
    l_29_3 = 0
  end
  if not l_29_4 then
    l_29_4 = 0
  end
  return GetDetectionThresholdMetReason(l_29_0, l_29_1, l_29_2, l_29_3, l_29_4)
end

GetDetectionThresholdMetLinuxReason = function(l_30_0, l_30_1, l_30_2, l_30_3, l_30_4)
  -- function num : 0_29
  local l_30_5 = 0
  local l_30_6 = true
  local l_30_7 = nil
  local l_30_8 = false
  local l_30_9 = 0
  if l_30_6 then
    local l_30_10 = GetTacticsTableForPid(l_30_0)
    local l_30_11 = GetTechniquesTableForPid(l_30_0)
    if l_30_10 == nil or l_30_11 == nil then
      return false, 0
    end
    local l_30_12 = GetTaintLevelHR()
    if l_30_12 == "Medium" or l_30_12 == "High" then
      l_30_9 = (mp.bitor)(l_30_9, 1)
    end
    local l_30_13 = GetTaintLevelML()
    if l_30_13 == "High" then
      l_30_9 = (mp.bitor)(l_30_9, 1)
    end
    for l_30_17,l_30_18 in pairs(l_30_10) do
      if l_30_17 ~= nil then
        if l_30_7 == nil then
          l_30_7 = l_30_17:lower()
        else
          l_30_7 = l_30_7 .. " | " .. l_30_17:lower()
        end
      end
      if l_30_18 ~= nil then
        l_30_5 = l_30_5 + l_30_18
      end
    end
    if l_30_7 ~= nil then
      if l_30_7:find("impact", 1, true) and l_30_7:find("collection", 1, true) and l_30_7:find("discovery", 1, true) then
        l_30_9 = (mp.bitor)(l_30_9, 2)
      end
      if l_30_7:find("execution", 1, true) and l_30_7:find("persistence", 1, true) then
        l_30_9 = (mp.bitor)(l_30_9, 4)
      end
      if l_30_7:find("collection", 1, true) and l_30_7:find("impact", 1, true) and (l_30_7:find("credentialaccess", 1, true) or l_30_7:find("execution", 1, true)) then
        l_30_9 = (mp.bitor)(l_30_9, 8)
      end
      if l_30_7:find("defenseevasion", 1, true) and l_30_7:find("lateralmovement", 1, true) and l_30_7:find("collection", 1, true) then
        l_30_9 = (mp.bitor)(l_30_9, 16)
      end
      if l_30_7:find("credentialaccess", 1, true) and l_30_7:find("impact", 1, true) and l_30_7:find("collection", 1, true) and l_30_7:find("exfil", 1, true) then
        l_30_9 = (mp.bitor)(l_30_9, 32)
      end
      if l_30_7:find("accountdiscovery", 1, true) and l_30_7:find("lateralmovement", 1, true) and l_30_7:find("remotesystemdiscovery", 1, true) then
        l_30_9 = (mp.bitor)(l_30_9, 64)
      end
      if l_30_7:find("execution", 1, true) and l_30_7:find("impact", 1, true) then
        l_30_9 = (mp.bitor)(l_30_9, 128)
      end
      if (l_30_7:find("collection", 1, true) or l_30_7:find("discovery", 1, true)) and l_30_7:find("exfiltration", 1, true) then
        l_30_9 = (mp.bitor)(l_30_9, 256)
      end
    end
  end
  do
    if l_30_9 ~= 0 then
      l_30_8 = true
    end
    return l_30_8, l_30_9
  end
end

IsDetectionThresholdMetLinux = function(l_31_0, l_31_1, l_31_2, l_31_3, l_31_4)
  -- function num : 0_30
  if not l_31_1 then
    l_31_1 = 0
  end
  if not l_31_2 then
    l_31_2 = 0
  end
  if not l_31_3 then
    l_31_3 = 0
  end
  if not l_31_4 then
    l_31_4 = 0
  end
  return GetDetectionThresholdMetLinuxReason(l_31_0, l_31_1, l_31_2, l_31_3, l_31_4)
end

GetTaintLevelHR = function()
  -- function num : 0_31
  -- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

  do
    if (MpCommon.GetPersistContextCountNoPath)("TaintedMachine") > 0 then
      if (MpCommon.GetPersistContextCountNoPath)("TaintedMachineHigh") > 0 then
        local l_32_0 = nil
      else
      end
    end
    -- DECOMPILER ERROR at PC28: Overwrote pending register: R0 in 'AssignReg'

    if (MpCommon.GetPersistContextCountNoPath)("TaintedMachineMedium") <= 0 or (MpCommon.GetPersistContextCountNoPath)("TaintedMachineLow") > 0 then
      return "Medium"
    end
  end
end

GetTaintLevelML = function()
  -- function num : 0_32
  -- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

  do
    if (MpCommon.GetPersistContextCountNoPath)("TaintedMachine") > 0 then
      if (MpCommon.GetPersistContextCountNoPath)("TaintedMachineML_High") > 0 then
        local l_33_0 = nil
      else
      end
    end
    -- DECOMPILER ERROR at PC28: Overwrote pending register: R0 in 'AssignReg'

    if (MpCommon.GetPersistContextCountNoPath)("TaintedMachineML_Medium") <= 0 or (MpCommon.GetPersistContextCountNoPath)("TaintedMachineML_Low") > 0 then
      return "Medium"
    end
  end
end

AddPidSpecificTechniqueAndTactic = function(l_34_0, l_34_1, l_34_2, l_34_3)
  -- function num : 0_33
  l_34_0 = GetRealPidForScenario(l_34_0)
  if l_34_0 ~= nil then
    if not l_34_3 then
      l_34_3 = 3600
    end
    AddPidGlobal(l_34_0, l_34_3)
    if l_34_1 ~= nil and l_34_1 ~= "" and l_34_1 ~= "T0000" then
      AddTechniqueForPid(l_34_0, l_34_1, l_34_3)
      AddTechniqueGlobal(l_34_1, l_34_3)
    end
    if l_34_2 ~= nil and l_34_2 ~= "" then
      AddTacticForPid(l_34_0, l_34_2, l_34_3)
      AddTacticGlobal(l_34_2, l_34_3)
    end
  end
end

AddResearchData = function(l_35_0, l_35_1)
  -- function num : 0_34
  l_35_0 = GetRealPidForScenario(l_35_0)
  if not l_35_1 then
    l_35_1 = false
  end
  local l_35_2, l_35_3 = GetDetectionThresholdMetReason(l_35_0)
  local l_35_4 = {}
  l_35_4.ttver = "0003"
  l_35_4.TrackedPid = l_35_0
  l_35_4.IsThresholdMet = tostring(l_35_2)
  l_35_4.ThresholdMetReason = "000" .. tostring(l_35_3)
  l_35_4.PidsCount = "000" .. tostring(GetTrackedPidsCountGlobal())
  do
    if GetRollingQueueKeysAsString("Tech-" .. l_35_0) == nil then
      local l_35_5, l_35_6 = l_35_0 .. " tech table missing"
    end
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R5 in 'UnsetPending'

    l_35_4.TrackedPidTechniques = l_35_5
    do
      if GetRollingQueueKeysAsString("Tact-" .. l_35_0) == nil then
        local l_35_7 = nil
      end
      l_35_4.TrackedPidTactics = l_35_0 .. " tact table missing"
      local l_35_8 = nil
      if GetRollingQueueHashTableAsString("InheritedTech-" .. l_35_0) ~= nil then
        l_35_4.TrackedPidInheritedTechniques = (MpCommon.Base64Encode)(GetRollingQueueHashTableAsString("InheritedTech-" .. l_35_0))
      end
      local l_35_9 = nil
      if GetRollingQueueHashTableAsString("InheritedTact-" .. l_35_0) ~= nil then
        l_35_4.TrackedPidInheritedTactics = (MpCommon.Base64Encode)(GetRollingQueueHashTableAsString("InheritedTact-" .. l_35_0))
      end
      do
        if GetRollingQueueKeysAsString("gTechniquesTable") == nil then
          local l_35_10, l_35_11, l_35_14 = , "gTechniquesTable table missing"
        end
        -- DECOMPILER ERROR at PC82: Confused about usage of register: R9 in 'UnsetPending'

        l_35_4.AllTechniques = l_35_14
        do
          if GetRollingQueueKeysAsString("gTacticsTable") == nil then
            local l_35_12, l_35_15 = nil
          end
          l_35_4.AllTactics = "gTacticsTable table missing"
          if (MpCommon.GetPersistContextCountNoPath)("TaintedMachine") >= 1 then
            l_35_4.IsTainted = "true"
            local l_35_13 = nil
            if (MpCommon.GetPersistContextNoPath)("TaintedMachine") then
              l_35_4.TaintLevel = (table.concat)((MpCommon.GetPersistContextNoPath)("TaintedMachine"), "|")
            end
          else
            do
              l_35_4.IsTainted = "false"
              local l_35_16 = nil
              do
                if GetAtomicCounter("TestMode_fde8") ~= nil then
                  local l_35_17 = nil
                  if GetRollingQueueKeysAsString("SuspAttackServer") ~= nil then
                    l_35_4.AttackMachines = GetRollingQueueKeysAsString("SuspAttackServer")
                  end
                end
                set_researchdata_fromtable(l_35_4, l_35_1)
              end
            end
          end
        end
      end
    end
  end
end

TT_SendBMSigTrigger = function(l_36_0, l_36_1, l_36_2, l_36_3)
  -- function num : 0_35
  if mp.ENGINEBUILD < 19900 then
    return 
  end
  local l_36_4 = GetRealPidForScenario(l_36_0)
  if not l_36_3 then
    l_36_3 = 10
  end
  if l_36_4 and l_36_1 and l_36_2 then
    local l_36_5 = (string.lower)((string.format)("%s|%s|%s", l_36_4, l_36_1, l_36_2))
    if not IsKeyInRollingQueue("tt-sigtriggers", l_36_5, true) then
      local l_36_6 = pcall(MpCommon.BmTriggerSig, l_36_4, l_36_1, l_36_2)
      if l_36_6 then
        AppendToRollingQueue("tt-sigtriggers", l_36_5, "1", l_36_3)
      end
    end
  end
end

TrackPidAndTechnique = function(l_37_0, l_37_1, l_37_2, l_37_3, l_37_4)
  -- function num : 0_36
  if l_37_0 == nil or l_37_0 == "" or l_37_1 == nil or l_37_1 == "" then
    return 
  end
  l_37_0 = GetRealPidForScenario(l_37_0)
  if l_37_3 == nil then
    l_37_3 = 3600
  end
  AddPidSpecificTechniqueAndTactic(l_37_0, l_37_1, l_37_2, l_37_3)
  if not l_37_4 then
    l_37_4 = false
  end
  if not l_37_4 then
    AddResearchData(l_37_0, false)
  end
  if l_37_0:sub(1, 4) == "pid:" then
    TT_SendBMSigTrigger(l_37_0, l_37_1, l_37_2)
  end
end

TrackPidAndMultipleTechniques = function(l_38_0, l_38_1, l_38_2, l_38_3)
  -- function num : 0_37
  if not l_38_0 or l_38_0 == "" or not l_38_1 or type(l_38_1) ~= "table" then
    return 
  end
  for l_38_7,l_38_8 in pairs(l_38_1) do
    if l_38_7 and l_38_8 then
      TrackPidAndTechnique(l_38_0, l_38_7, l_38_8, l_38_2, l_38_3)
    end
  end
end

TrackPidAndTechniqueBM = function(l_39_0, l_39_1, l_39_2, l_39_3, l_39_4)
  -- function num : 0_38
  if l_39_0 == nil or l_39_0 == "" or l_39_1 == nil or l_39_1 == "" then
    return 
  end
  l_39_0 = GetRealPidForScenario(l_39_0)
  if l_39_3 == nil then
    l_39_3 = 3600
  end
  AddPidSpecificTechniqueAndTactic(l_39_0, l_39_1, l_39_2, l_39_3)
  if not l_39_4 then
    l_39_4 = false
  end
  if not l_39_4 then
    AddResearchData(l_39_0, true)
  end
  if l_39_0:sub(1, 4) == "pid:" and l_39_2 ~= nil and l_39_2 ~= "" then
    -- WARNING: undefined locals caused missing assignments!
  end
end

TrackPidAndMultipleTechniquesBM = function(l_40_0, l_40_1, l_40_2, l_40_3)
  -- function num : 0_39
  if not l_40_0 or l_40_0 == "" or not l_40_1 or type(l_40_1) ~= "table" then
    return 
  end
  for l_40_7,l_40_8 in pairs(l_40_1) do
    if l_40_7 and l_40_8 then
      TrackPidAndTechniqueBM(l_40_0, l_40_7, l_40_8, l_40_2, l_40_3)
    end
  end
end

GetProcessPpidByScenario = function(l_41_0)
  -- function num : 0_40
  if l_41_0 == nil then
    return nil
  end
  local l_41_1 = nil
  local l_41_2 = l_41_0:lower()
  if l_41_2 == "cmdhstr" then
    l_41_1 = (mp.GetScannedPPID)()
  else
    if l_41_2 == "bm" then
      local l_41_3, l_41_4 = pcall(bm.get_current_process_startup_info)
      if l_41_3 and l_41_4 ~= nil then
        l_41_1 = l_41_4.ppid
      end
    else
      do
        if l_41_2 == "amsi" then
          local l_41_5, l_41_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
          if l_41_5 and l_41_6 ~= nil then
            l_41_1 = l_41_6
          end
        else
          do
            do
              if l_41_2 == "rtp" then
                local l_41_7, l_41_8 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESS_ID)
                if l_41_7 and l_41_8 ~= nil then
                  l_41_1 = l_41_8
                end
              end
              return l_41_1
            end
          end
        end
      end
    end
  end
end

TrackCustomPersistContextNameByPPID = function(l_42_0, l_42_1, l_42_2, l_42_3)
  -- function num : 0_41
  if l_42_0 == nil or l_42_1 == nil or l_42_2 == nil then
    return nil
  end
  if l_42_1:sub(1, 4) ~= "pid:" then
    l_42_1 = GetProcessPpidByScenario(l_42_1)
  end
  if l_42_1 == nil then
    return nil
  end
  if l_42_0:lower() == "set" then
    if l_42_3 == nil then
      l_42_3 = 3600
    end
    local l_42_7 = MpCommon.AppendPersistContextNoPath
    l_42_7(l_42_1, l_42_2, l_42_3)
    l_42_7 = true
    return l_42_7
  else
    do
      if l_42_0:lower() == "query" then
        local l_42_4 = MpCommon.QueryPersistContextNoPath
        local l_42_5 = l_42_1
        do
          local l_42_6 = l_42_2
          do return l_42_4(l_42_5, l_42_6) end
          -- DECOMPILER ERROR at PC48: Confused about usage of register R5 for local variables in 'ReleaseLocals'

          do return nil end
          -- DECOMPILER ERROR at PC51: Confused about usage of register R4 for local variables in 'ReleaseLocals'

        end
      end
    end
  end
end

normalize_unicode = function(l_43_0)
  -- function num : 0_42
  if l_43_0 == nil then
    return 
  end
  local l_43_1 = false
  local l_43_2 = ""
  for l_43_6 in l_43_0:gmatch(".") do
    local l_43_7 = (string.byte)(l_43_6)
    if l_43_7 == 0 then
      if not l_43_1 then
        l_43_1 = true
      else
        l_43_2 = l_43_2 .. " "
        l_43_1 = false
      end
    else
      if l_43_7 >= 32 and l_43_7 <= 126 then
        l_43_2 = l_43_2 .. l_43_6
        l_43_1 = false
      else
        l_43_1 = false
      end
    end
  end
  return l_43_2
end

appendNotExistingFilePersistContext = function(l_44_0, l_44_1, l_44_2)
  -- function num : 0_43
  if l_44_0 == nil or l_44_1 == nil then
    return false
  end
  if l_44_2 == nil then
    l_44_2 = 0
  end
  if not (MpCommon.QueryPersistContext)(l_44_0, l_44_1) then
    (MpCommon.AppendPersistContext)(l_44_0, l_44_1, l_44_2)
    return true
  end
  return false
end

appendFilePersistContextFromList = function(l_45_0, l_45_1, l_45_2, l_45_3)
  -- function num : 0_44
  if l_45_0 == nil or l_45_1 == nil then
    return false
  end
  if l_45_2 == nil then
    l_45_2 = 0
  end
  local l_45_4 = false
  for l_45_8,l_45_9 in ipairs(l_45_1) do
    if l_45_3 ~= nil and (mp.bitand)(l_45_3, 1) == 1 then
      (MpCommon.AppendPersistContext)(l_45_0, l_45_9, l_45_2)
      l_45_4 = true
    else
      if appendNotExistingFilePersistContext(l_45_0, l_45_9) then
        l_45_4 = true
      end
    end
  end
  return l_45_4
end

generateCustomStringHash = function(l_46_0)
  -- function num : 0_45
  if l_46_0 == nil or type(l_46_0) ~= "string" or #l_46_0 <= 0 then
    return 
  end
  local l_46_1 = (string.lower)((string.format)("0x%02X_0x%02X", (mp.crc32)(-1, l_46_0, 1, #l_46_0), tostring(#l_46_0)))
  if l_46_1 == nil or #l_46_1 <= 10 then
    return 
  end
  return l_46_1
end

getCustomStringHash = function(l_47_0)
  -- function num : 0_46
  if l_47_0 == nil or type(l_47_0) ~= "string" or #l_47_0 <= 0 then
    return 
  end
  local l_47_1 = (string.lower)(l_47_0)
  l_47_1 = (string.gsub)(l_47_1, "\"", "")
  l_47_1 = (string.gsub)(l_47_1, " ", "")
  return generateCustomStringHash(l_47_1), l_47_1
end

checkFileLastWriteTime = function(l_48_0, l_48_1)
  -- function num : 0_47
  if l_48_0 == nil and #l_48_0 <= 4 then
    return 
  end
  l_48_0 = (MpCommon.PathToWin32Path)(l_48_0)
  if not (sysio.IsFileExists)(l_48_0) then
    return 
  end
  local l_48_2 = (sysio.GetFileLastWriteTime)(l_48_0)
  if not ((sysio.GetLastResult)()).Success or l_48_2 == 0 then
    return 
  end
  local l_48_3 = l_48_2 / 10000000 - 11644473600
  local l_48_4 = (MpCommon.GetCurrentTimeT)()
  local l_48_5 = l_48_4 - l_48_3
  do
    if l_48_1 ~= nil then
      local l_48_6 = false
      if l_48_4 < l_48_3 or l_48_1 < l_48_5 then
        l_48_6 = true
      end
      return l_48_6, l_48_5, l_48_3, l_48_2, l_48_4
    end
    return l_48_5, l_48_3, l_48_2, l_48_4
  end
end

IsTacticObservedForParents = function(l_49_0, l_49_1, l_49_2, l_49_3)
  -- function num : 0_48
  if type(l_49_2) ~= "number" or l_49_2 <= 0 or l_49_2 > 15 or l_49_0 == nil or l_49_0 == "" or l_49_1 == nil or l_49_1 == "" then
    return false, nil
  end
  local l_49_4 = (mp.GetParentProcInfo)(l_49_0)
  if l_49_4 ~= nil then
    local l_49_5, l_49_6 = IsTacticObservedForPid(l_49_4.ppid, l_49_1, l_49_3)
    if l_49_5 then
      return l_49_5, l_49_6
    else
      local l_49_7 = IsTacticObservedForParents
      local l_49_8 = l_49_4.ppid
      local l_49_9 = l_49_1
      local l_49_10 = l_49_2 - 1
      do
        local l_49_11 = l_49_3
        do return l_49_7(l_49_8, l_49_9, l_49_10, l_49_11) end
        -- DECOMPILER ERROR at PC44: Confused about usage of register R8 for local variables in 'ReleaseLocals'

        l_49_5 = false
        l_49_6 = nil
        do return l_49_5, l_49_6 end
        -- DECOMPILER ERROR at PC48: Confused about usage of register R7 for local variables in 'ReleaseLocals'

      end
    end
  end
end

IsTechniqueObservedForParents = function(l_50_0, l_50_1, l_50_2, l_50_3)
  -- function num : 0_49
  if type(l_50_2) ~= "number" or l_50_2 <= 0 or l_50_2 > 15 or l_50_0 == nil or l_50_0 == "" or l_50_1 == nil or l_50_1 == "" then
    return false, nil
  end
  local l_50_4 = (mp.GetParentProcInfo)(l_50_0)
  if l_50_4 ~= nil then
    local l_50_5, l_50_6 = IsTechniqueObservedForPid(l_50_4.ppid, l_50_1, l_50_3)
    if l_50_5 then
      return l_50_5, l_50_6
    else
      local l_50_7 = IsTechniqueObservedForParents
      local l_50_8 = l_50_4.ppid
      local l_50_9 = l_50_1
      local l_50_10 = l_50_2 - 1
      do
        local l_50_11 = l_50_3
        do return l_50_7(l_50_8, l_50_9, l_50_10, l_50_11) end
        -- DECOMPILER ERROR at PC44: Confused about usage of register R8 for local variables in 'ReleaseLocals'

        l_50_5 = false
        l_50_6 = nil
        do return l_50_5, l_50_6 end
        -- DECOMPILER ERROR at PC48: Confused about usage of register R7 for local variables in 'ReleaseLocals'

      end
    end
  end
end

expandRelativePath = function(l_51_0, l_51_1)
  -- function num : 0_50
  if l_51_0 == nil or #l_51_0 <= 4 or l_51_1 == nil or #l_51_1 <= 2 then
    return 
  end
  if (string.sub)(l_51_0, 1, 3) ~= "..\\" then
    return 
  end
  local l_51_2, l_51_3 = (string.gsub)(l_51_0, "%.%.\\", "")
  if l_51_3 == nil or l_51_3 == 0 then
    return 
  end
  local l_51_4, l_51_5 = (string.gsub)(l_51_1, "\\", "")
  if l_51_5 == nil or l_51_5 == 0 then
    return 
  end
  l_51_5 = l_51_5 + 1
  do
    if l_51_5 - l_51_3 <= 0 then
      local l_51_6 = 1
    end
    local l_51_7 = nil
    if (string.gmatch)(l_51_1, "[^\\]+") == nil then
      return 
    end
    local l_51_8 = nil
    local l_51_9 = 1
    for l_51_13 in l_51_8 do
      local l_51_10 = ""
      -- DECOMPILER ERROR at PC61: Confused about usage of register: R13 in 'UnsetPending'

      l_51_10 = l_51_10 .. R13_PC61 .. "\\"
      if l_51_7 <= l_51_9 then
        break
      end
      l_51_9 = l_51_9 + 1
    end
    do
      -- DECOMPILER ERROR at PC70: Confused about usage of register: R9 in 'UnsetPending'

      if l_51_10 == "" then
        return 
      end
      -- DECOMPILER ERROR at PC73: Confused about usage of register: R9 in 'UnsetPending'

      return l_51_10 .. l_51_2
    end
  end
end

IsInheritedTechniqueObservedForPid = function(l_52_0, l_52_1, l_52_2)
  -- function num : 0_51
  if l_52_0 == nil or l_52_0 == "" or l_52_1 == nil or l_52_1 == "" then
    return false, nil
  end
  l_52_0 = GetRealPidForScenario(l_52_0)
  if not l_52_2 then
    l_52_2 = false
  end
  local l_52_3 = IsKeyInRollingQueue
  local l_52_4 = "InheritedTech-" .. l_52_0
  local l_52_5 = l_52_1
  do
    local l_52_6 = l_52_2
    do return l_52_3(l_52_4, l_52_5, l_52_6) end
    -- DECOMPILER ERROR at PC26: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

IsInheritedTacticObservedForPid = function(l_53_0, l_53_1, l_53_2)
  -- function num : 0_52
  if l_53_0 == nil or l_53_0 == "" or l_53_1 == nil or l_53_1 == "" then
    return false, nil
  end
  l_53_0 = GetRealPidForScenario(l_53_0)
  if not l_53_2 then
    l_53_2 = false
  end
  local l_53_3 = IsKeyInRollingQueue
  local l_53_4 = "InheritedTact-" .. l_53_0
  local l_53_5 = l_53_1
  do
    local l_53_6 = l_53_2
    do return l_53_3(l_53_4, l_53_5, l_53_6) end
    -- DECOMPILER ERROR at PC26: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

AddInheritedTechniqueForPid = function(l_54_0, l_54_1, l_54_2, l_54_3)
  -- function num : 0_53
  if l_54_0 == nil or l_54_0 == "" or l_54_1 == nil or l_54_1 == "" or l_54_2 == nil or l_54_2 == "" then
    return 
  end
  if not l_54_3 then
    l_54_3 = 3600
  end
  l_54_0 = GetRealPidForScenario(l_54_0)
  local l_54_4, l_54_5 = IsInheritedTechniqueObservedForPid(l_54_0, l_54_2)
  if l_54_4 then
    l_54_5 = l_54_5 .. "," .. l_54_1
  else
    l_54_5 = l_54_1
  end
  AppendToRollingQueue("InheritedTech-" .. l_54_0, l_54_2, l_54_5, l_54_3)
end

AddInheritedTacticForPid = function(l_55_0, l_55_1, l_55_2, l_55_3)
  -- function num : 0_54
  if l_55_0 == nil or l_55_0 == "" or l_55_1 == nil or l_55_1 == "" or l_55_2 == nil or l_55_2 == "" then
    return 
  end
  if not l_55_3 then
    l_55_3 = 3600
  end
  l_55_0 = GetRealPidForScenario(l_55_0)
  local l_55_4, l_55_5 = IsInheritedTacticObservedForPid(l_55_0, l_55_2)
  if l_55_4 then
    l_55_5 = l_55_5 .. "," .. l_55_1
  else
    l_55_5 = l_55_1
  end
  AppendToRollingQueue("InheritedTact-" .. l_55_0, l_55_2, l_55_5, l_55_3)
end

AddInheritedTechniqueAndTacticToTargetPpid = function(l_56_0, l_56_1, l_56_2, l_56_3, l_56_4)
  -- function num : 0_55
  if l_56_0 == nil or l_56_0 == "" or l_56_1 == nil or l_56_1 == "" then
    return 
  end
  l_56_0 = GetRealPidForScenario(l_56_0)
  if not l_56_4 then
    l_56_4 = 3600
  end
  if l_56_2 ~= nil and l_56_2 ~= "" then
    AddInheritedTechniqueForPid(l_56_0, l_56_1, l_56_2, l_56_4)
  end
  if l_56_3 ~= nil and l_56_3 ~= "" then
    AddInheritedTacticForPid(l_56_0, l_56_1, l_56_3, l_56_4)
  end
end

AddTechniqueObservedToParents = function(l_57_0, l_57_1, l_57_2, l_57_3, l_57_4, l_57_5)
  -- function num : 0_56
  if type(l_57_2) ~= "number" or l_57_2 <= 0 or l_57_2 > 15 or l_57_0 == nil or l_57_0 == "" or l_57_1 == nil or l_57_1 == "" or l_57_3 ~= nil and type(l_57_3) ~= "table" then
    return 
  end
  if l_57_5 == nil then
    l_57_5 = l_57_0
  end
  local l_57_6 = (mp.GetParentProcInfo)(l_57_0)
  if l_57_6 == nil or l_57_6.image_path == nil then
    return 
  end
  if l_57_3 ~= nil then
    for l_57_10,l_57_11 in ipairs(l_57_3) do
      if (string.find)(l_57_6.image_path, l_57_11, 1, true) then
        return 
      end
    end
  end
  do
    AddInheritedTechniqueForPid(l_57_6.ppid, l_57_5, l_57_1, l_57_4)
    AddTechniqueObservedToParents(l_57_6.ppid, l_57_1, l_57_2 - 1, l_57_3, l_57_4, l_57_5)
  end
end

AddTacticsObservedToParents = function(l_58_0, l_58_1, l_58_2, l_58_3, l_58_4, l_58_5)
  -- function num : 0_57
  if type(l_58_2) ~= "number" or l_58_2 <= 0 or l_58_2 > 15 or l_58_0 == nil or l_58_0 == "" or l_58_1 == nil or l_58_1 == "" or l_58_3 ~= nil and type(l_58_3) ~= "table" then
    return 
  end
  if l_58_5 == nil then
    l_58_5 = l_58_0
  end
  local l_58_6 = (mp.GetParentProcInfo)(l_58_0)
  if l_58_6 == nil or l_58_6.image_path == nil then
    return 
  end
  if l_58_3 ~= nil then
    for l_58_10,l_58_11 in ipairs(l_58_3) do
      if (string.find)(l_58_6.image_path, l_58_11, 1, true) then
        return 
      end
    end
  end
  do
    AddInheritedTacticForPid(l_58_6.ppid, l_58_5, l_58_1, l_58_4)
    AddTacticsObservedToParents(l_58_6.ppid, l_58_1, l_58_2 - 1, l_58_3, l_58_4, l_58_5)
  end
end

AddTechniqueAndTacticToParents = function(l_59_0, l_59_1, l_59_2, l_59_3, l_59_4, l_59_5)
  -- function num : 0_58
  if l_59_0 == nil then
    return 
  end
  if not l_59_5 then
    l_59_5 = 3600
  end
  if l_59_1 ~= nil and l_59_1 ~= "" then
    AddTechniqueObservedToParents(l_59_0, l_59_1, l_59_3, l_59_4, l_59_5, l_59_0)
  end
  if l_59_2 ~= nil and l_59_2 ~= "" then
    AddTacticsObservedToParents(l_59_0, l_59_2, l_59_3, l_59_4, l_59_5, l_59_0)
  end
end

TrackFileAndTechnique = function(l_60_0, l_60_1, l_60_2, l_60_3)
  -- function num : 0_59
  ValidateAddTechniqueInput = function(l_61_0, l_61_1, l_61_2)
    -- function num : 0_59_0
    if l_61_0 == nil or l_61_1 == nil or l_61_2 == nil then
      return 
    end
    local l_61_3 = "BM_M"
    local l_61_4 = nil
    if (string.sub)(l_61_1, 1, #l_61_3) == l_61_3 then
      l_61_4 = l_61_1
    else
      if (string.match)(l_61_1, "^[tT][0-9][0-9][0-9][0-9]") then
        l_61_4 = l_61_3 .. l_61_1
      end
    end
    if l_61_4 ~= nil then
      (MpCommon.AppendPersistContext)(l_61_0, l_61_4, l_61_2)
    end
    return l_61_4
  end

  if l_60_0 == nil or type(l_60_0) ~= "string" or #l_60_0 <= 4 then
    return 
  end
  if l_60_1 == nil then
    return 
  end
  if l_60_2 == nil then
    l_60_2 = 0
  end
  local l_60_4 = "FilePersistContextToMpAttribute.A"
  if l_60_3 ~= nil then
    l_60_4 = l_60_3
  end
  local l_60_5 = "BM_M"
  local l_60_6 = nil
  -- DECOMPILER ERROR at PC37: Unhandled construct in 'MakeBoolean' P1

  if type(l_60_1) == "string" and ValidateAddTechniqueInput(l_60_0, l_60_1, l_60_2) ~= nil then
    l_60_6 = true
  end
  if type(l_60_1) == "table" then
    for l_60_10,l_60_11 in ipairs(l_60_1) do
      if ValidateAddTechniqueInput(l_60_0, l_60_11, l_60_2) ~= nil then
        l_60_6 = true
      end
    end
  else
    do
      do return  end
      if l_60_6 then
        (MpCommon.AppendPersistContext)(l_60_0, l_60_4, l_60_2)
      end
      return l_60_6
    end
  end
end

checkParentProcessNameFromListByPPID = function(l_61_0, l_61_1)
  -- function num : 0_60
  if l_61_0 == nil or l_61_1 == nil then
    return 
  end
  if l_61_0:sub(1, 4) ~= "pid:" then
    l_61_0 = GetProcessPpidByScenario(l_61_0)
  end
  local l_61_2 = (mp.GetParentProcInfo)(l_61_0)
  if l_61_2 == nil then
    return 
  end
  local l_61_3 = (string.lower)(l_61_2.image_path)
  local l_61_4 = (string.match)(l_61_3, "([^\\]+)$")
  local l_61_5 = false
  -- DECOMPILER ERROR at PC40: Unhandled construct in 'MakeBoolean' P1

  if type(l_61_1) == "table" and l_61_1[l_61_4] ~= nil then
    l_61_5 = true
  end
  if type(l_61_1) == "string" and (string.find)(l_61_1, l_61_4, 1, true) ~= nil then
    l_61_5 = true
  end
  return l_61_5, l_61_4
end

checkParentProcessNameFromListByPPIDRecursive = function(l_62_0, l_62_1, l_62_2)
  -- function num : 0_61
  if l_62_2 < 1 or l_62_0 == nil or l_62_1 == nil then
    return 
  end
  if l_62_0:sub(1, 4) ~= "pid:" then
    l_62_0 = GetProcessPpidByScenario(l_62_0)
  end
  local l_62_3 = (mp.GetParentProcInfo)(l_62_0)
  if l_62_3 == nil then
    return 
  end
  local l_62_4 = {}
  -- DECOMPILER ERROR at PC26: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC27: Overwrote pending register: R5 in 'AssignReg'

  local l_62_5 = l_62_3
  for l_62_9 = 1, l_62_2 - 1 do
    l_62_5 = (mp.GetParentProcInfo)(l_62_5.ppid)
    if l_62_5 == nil then
      break
    end
    ;
    (table.insert)(l_62_4, l_62_5)
  end
  do
    local l_62_10 = false
    local l_62_11 = ""
    for l_62_15,l_62_16 in ipairs(l_62_4) do
      local l_62_17 = (string.lower)(l_62_16.image_path)
      local l_62_18 = (string.match)(l_62_17, "([^\\]+)$")
      -- DECOMPILER ERROR at PC69: Unhandled construct in 'MakeBoolean' P1

      if type(l_62_1) == "table" and l_62_1[l_62_18] ~= nil then
        l_62_10 = true
        l_62_11 = l_62_11 .. ";" .. l_62_18
      end
      if type(l_62_1) == "string" and (string.find)(l_62_1, l_62_18, 1, true) ~= nil then
        l_62_10 = true
        l_62_11 = l_62_11 .. ";" .. l_62_18
      end
    end
    return l_62_10, l_62_11
  end
end

IsLegacyOrgMachine = function()
  -- function num : 0_62
  local l_63_0 = {}
  l_63_0["9e8f722b-3aa1-4069-ab9f-fc8485ca4af9"] = true
  l_63_0["e333e141-0df0-4d49-8334-ce4a3d2b51cf"] = true
  l_63_0["a97898e3-0e7b-4c74-9c71-cf807c8a9eea"] = true
  l_63_0["ebc2ebcb-43e4-4f76-8c75-2be36bdead88"] = true
  l_63_0["fff415a5-d876-4e19-af91-a430fb7df00a"] = true
  l_63_0["0b20fcfe-9850-4391-aff0-75075c0dbb1a"] = true
  l_63_0["3b7984a2-ac4f-44ab-aefb-e0673362ee6a"] = true
  l_63_0["0b11e29f-70a9-4c86-8858-55b9f37e3020"] = true
  l_63_0["194c1c9f-90d1-40c8-9ba5-7fa5a43617f9"] = true
  l_63_0["c1ed41b8-316f-4206-8655-2039a416ecf1"] = true
  l_63_0["831aa694-4c12-49b5-9949-a4976dc1d67d"] = true
  l_63_0["43a876e1-c5f3-4bcb-be8f-a0e405839830"] = true
  l_63_0["93576e31-5469-4e26-a549-3a18220dc565"] = true
  l_63_0["f3b27d4b-1c32-4f7a-b947-7a67617a319f"] = true
  l_63_0["331f9d38-ce30-4a30-94c1-f70ab226d869"] = true
  l_63_0["19361904-3386-43a8-961b-e86764aea86b"] = true
  l_63_0["b49066f2-d2ca-44c6-a197-b75bb646b99f"] = true
  l_63_0["66da7d04-65b9-4832-9cc1-5e9c5af5327c"] = true
  l_63_0["4529e5c0-f3aa-4be7-a530-9ab6a3735062"] = true
  l_63_0["0a7b537b-2304-49bf-b124-14194e13737b"] = true
  l_63_0["23dc6e7f-39ea-45a4-a5b5-86d4223d3042"] = true
  l_63_0["e0413d41-3502-4db1-9039-c88af24ead06"] = true
  l_63_0["4574428d-d2dc-47e6-ae9f-9e24438c82e7"] = true
  l_63_0["e17a58f3-7283-464c-a452-eb64ad83ec97"] = true
  l_63_0["68521817-d140-4b74-a14f-eed29027e376"] = true
  l_63_0["072b5815-bdf9-4765-bc12-6d049ae4efff"] = true
  l_63_0["bcb207b2-cc60-4212-9043-d12afadb0fbc"] = true
  l_63_0["49892dca-c126-4dac-95e7-f5757cccc16a"] = true
  l_63_0["74e61dec-e6ab-4d90-91b1-ba372a703e06"] = true
  l_63_0["2257c4e1-c3b0-439a-9119-fb2d0552bb43"] = true
  l_63_0["3676a7b6-192c-4f13-a3ec-b0afab8f8d2b"] = true
  l_63_0["fb85f5cc-d3fa-4d69-b25f-38f49233ef37"] = true
  l_63_0["665a0743-4170-4383-b6ba-28935c57d01b"] = true
  l_63_0["5ee978e9-163e-4d1e-b53a-61a36ba2b18a"] = true
  l_63_0["7f050e73-5a3d-4813-85af-82422a793fad"] = true
  l_63_0["9cc53ef5-7b0f-4aad-879c-8c7928b10dbe"] = true
  l_63_0["94deb9b0-3515-48d3-8f59-0f596d5bb090"] = true
  l_63_0["56dcd088-5605-4d08-b572-a504cf4dae65"] = true
  l_63_0["174fa9ca-e8dd-4ae6-bcd8-8cb2f2204f95"] = true
  l_63_0["932f5304-5c67-4d54-b103-b78bf287a2c3"] = true
  l_63_0["a58b13d8-a8f3-4b11-b655-2d93970f6374"] = true
  l_63_0["e53d4363-125e-4fdb-9135-f4bd0b35568e"] = true
  l_63_0["d7c7c745-195f-4223-9c7a-99fb420fd000"] = true
  l_63_0["5027d848-972a-4730-90b8-c684eff2122c"] = true
  l_63_0["45575928-30c1-4b72-8bf9-0d19cc13e52c"] = true
  l_63_0["50da504b-557b-4e97-beab-4c91dfb8c56d"] = true
  l_63_0["0267a949-b82d-4347-b173-660c76e30da6"] = true
  l_63_0["64032f4d-626a-4a92-ae42-d693ef078591"] = true
  l_63_0["4a7a5002-cd9d-4b70-ad48-f8c53f86145b"] = true
  l_63_0["8645a59d-7655-442b-9c39-bffe1294f8cb"] = true
  l_63_0["ba8974ba-9b35-4ad0-8413-8ac01f765545"] = true
  l_63_0["336876bb-1a0d-43f5-bf32-ce406f723b5e"] = true
  l_63_0["02504642-40b7-40dd-bb23-d393ce4cc043"] = true
  l_63_0["6d73cb3c-f9ca-4fd1-a357-695eb0fb8d5b"] = true
  l_63_0["68c53d9c-8e07-4f7e-9b50-2b70499b95d0"] = true
  l_63_0["d9390c80-4dad-4cc5-80c6-5da2bd33d673"] = true
  l_63_0["4338bd78-8653-4e6f-b8cf-893b6b5dca63"] = true
  l_63_0["238b89a1-be2f-4939-91dd-173c76c18095"] = true
  l_63_0["0112e007-42b5-4355-ac50-01f8b6f60daa"] = true
  l_63_0["6d4e7515-41ef-43fc-96f8-27e2fd492a19"] = true
  l_63_0["f2c2c063-9ed1-4f73-a624-1d8fca3ee19e"] = true
  l_63_0["b7f116fa-c0c0-4e37-aa6d-64790ea61007"] = true
  l_63_0["109420d0-e127-480e-aad0-20bb832d9709"] = true
  l_63_0["e2882248-03d6-4da2-87f7-da8967cf4672"] = true
  l_63_0["d06d867f-fbea-4112-aec2-a437ff86bbfd"] = true
  l_63_0["0ca80520-ab29-4a0a-86ae-e4f834611541"] = true
  l_63_0["209400ca-9614-45e3-a14b-070d8d339b9e"] = true
  l_63_0["26496fc8-a570-42b7-be89-a82840a08cbb"] = true
  l_63_0["0b23e19e-541d-4cb3-89f4-419bc9c593a6"] = true
  l_63_0["d0dc6b38-53fa-4bc6-949f-6d9dbe2d0024"] = true
  l_63_0["6b763308-b0e7-415e-b1d6-4ed29c8d0155"] = true
  l_63_0["864d05f5-3f47-4fb0-aecd-3d75ccd0de94"] = true
  l_63_0["7b5315ed-6572-462d-8284-189038da8165"] = true
  l_63_0["c7d04a61-5996-49a0-ae1b-f057623509c3"] = true
  l_63_0["952d5943-138b-4d48-a5f3-078526a57c5d"] = true
  l_63_0["c2cc1990-5094-4e7e-ab4f-65af1c52df24"] = true
  l_63_0["aea7413a-28a8-48ef-a443-4c5c27161cb9"] = true
  l_63_0["0831a921-cf12-4ecf-a3a2-0aeaba8ed268"] = true
  l_63_0["f74b2f70-3ee6-4410-aca1-fa7f6696907a"] = true
  l_63_0["fcfb1e78-be1a-45a2-b166-1e6c088ab4df"] = true
  l_63_0["9d0004e6-2aeb-46ed-ac66-42719249fbfd"] = true
  l_63_0["9e7cdd29-13c8-42c6-b852-6ad49cb47be6"] = true
  l_63_0["7978aa21-cbb0-431f-8048-b6fe6a372187"] = true
  l_63_0["51401eaf-db7b-410e-9830-aaf6170095d1"] = true
  l_63_0["e8869022-0cda-47b4-98a0-2e481fa8bb39"] = true
  l_63_0["9e2558e3-1b29-4bb1-9aa9-00f0bbf7df7a"] = true
  l_63_0["229ff4d6-9334-4f5b-a766-b89c5cd7493a"] = true
  l_63_0["48aa7ccc-e241-4c9c-8c74-2f60aac9f1af"] = true
  l_63_0["e6d6bc19-a278-42e4-a2c9-de0dc3107cb1"] = true
  l_63_0["e338937b-e3b8-4023-b9df-48372faa73b1"] = true
  l_63_0["efa9c680-5281-4eeb-8760-fbe4a02c1cdf"] = true
  l_63_0["a36f0250-09a4-4a6e-afc8-146c8d0f2523"] = true
  l_63_0["2fb7ef2c-b321-471f-8f3f-def24ce84c96"] = true
  l_63_0["8c450d96-3c8c-4fd7-b212-b194b86aeb0b"] = true
  l_63_0["6aafad28-3462-4c54-9fa2-05525d654885"] = true
  l_63_0["d7d1b4c2-d239-42be-aff7-f77bf22bc50a"] = true
  l_63_0["84da20cd-3dad-4d27-b1a1-e4c2da9fe3de"] = true
  l_63_0["d8c1a97c-1989-47f1-bad7-f61fc9fec10f"] = true
  l_63_0["17c4f810-b36a-4b9b-b522-6ffa44933865"] = true
  l_63_0["bf4cd6de-a593-46de-8705-e89a98a1a51b"] = true
  l_63_0["c14ea10d-54bf-42d7-848c-cc9c895f8a0c"] = true
  l_63_0["26b0eb5d-5020-4a63-b60f-16cabf0b5f50"] = true
  l_63_0["f42f4b2b-f13a-4c8b-881a-6f1ffb1aa266"] = true
  l_63_0["f11c8ce9-2021-4261-b39b-a1b99ca660d4"] = true
  l_63_0["cdd251fe-9ff1-4da0-82f8-b2f559040782"] = true
  l_63_0["0eb1e5d9-3dd3-4038-833e-834da63e8625"] = true
  l_63_0["692555dd-b6cc-468f-9b4e-951f039ad383"] = true
  l_63_0["06c1f48d-d514-415e-b385-713d1283a52d"] = true
  l_63_0["1fa3fe7c-5db3-4537-9622-d1636572a18d"] = true
  l_63_0["f16bd8a4-0f46-4633-aaae-048665ff9d56"] = true
  l_63_0["207f432c-cb0c-483d-b407-2769b035f309"] = true
  l_63_0["760925bc-cf36-40b7-bb44-c784fd7220c7"] = true
  l_63_0["7742aae5-2519-4ec1-98e5-56c231438f79"] = true
  l_63_0["629c1926-47fd-4a94-b2db-1f69647460ff"] = true
  l_63_0["2a0e6866-eb55-4558-a3e6-9946ac41f870"] = true
  l_63_0["29a97a64-bd43-4ce6-aaea-3982b1542e93"] = true
  l_63_0["1e3b04c1-46c0-43e2-b456-d02c67cbfb6b"] = true
  l_63_0["72c339fc-1375-4814-a4e3-f7fb7e8c8cf1"] = true
  l_63_0["6b2d7646-e0df-42db-b5ee-4e228e0d6488"] = true
  l_63_0["863e9bf6-e7c5-47e6-a63e-f94ef9f6ebe0"] = true
  l_63_0["a62a1460-a7bd-4d81-87e4-f459245de4ad"] = true
  l_63_0["bb58c89e-34d4-48eb-b965-8990bfab8d0f"] = true
  l_63_0["fd0c1195-045d-48bf-92fc-0f241e525c3d"] = true
  l_63_0["717551f8-5e59-45fe-aebe-eb3abd64cfec"] = true
  l_63_0["7d32b9ed-c15f-486b-95bb-125216f5f7e7"] = true
  l_63_0["a1984def-d4e6-476f-895f-6a6837704502"] = true
  l_63_0["7eaf2863-7a12-4d95-8674-96407f926580"] = true
  l_63_0["e89ae3b9-fa0c-43b2-b94a-61910e07d57d"] = true
  l_63_0["583ad211-3e4b-4b8d-a903-9ef1cdfd8ff7"] = true
  l_63_0["d9a18c49-7d30-4a5a-b58d-a0d124625781"] = true
  l_63_0["df391576-f230-45b2-8d4f-03c3bacfabdd"] = true
  l_63_0["52709bd7-7299-41a7-8b26-a0f6f80e1828"] = true
  l_63_0["d884ee3c-20ae-4fee-b7be-719717882a61"] = true
  l_63_0["89ece62e-abcc-49f3-9493-2e960aeddf09"] = true
  l_63_0["7682190b-f1a4-494b-8bce-8854ab1f30ed"] = true
  l_63_0["24a2479a-cecb-4c12-b83d-d5d6bc7d5c9a"] = true
  l_63_0["7b003a1e-32d8-4d0c-b89e-b3f830ef9298"] = true
  l_63_0["d33f1674-ec6e-4d30-9580-0f3a7fe9192d"] = true
  l_63_0["482e5bc7-e3a3-470d-90df-5ae60e66de63"] = true
  l_63_0["2fd18d75-7637-46c5-a38a-6fa157c323cd"] = true
  l_63_0["dd03a6fe-556b-4162-aba3-1b967b71505c"] = true
  l_63_0["a449ec79-829f-4a14-8ed4-c46d20cf7e98"] = true
  l_63_0["73194067-7f1f-4f59-9a91-c513f9674595"] = true
  l_63_0["142c86bb-2ee0-417d-8ebd-798e1b9168f1"] = true
  l_63_0["bcdb10c5-56eb-47f4-a6b5-6c4b2dbeb995"] = true
  l_63_0["557ac93d-2be7-43a5-a6a4-c58541c95d17"] = true
  l_63_0["8eaddf99-40ac-499c-96bf-3f88d9729ed8"] = true
  l_63_0["772b3e06-dce8-4c91-b82a-eb416497d1de"] = true
  l_63_0["cc391f9b-f27c-41cb-ba4f-15e91c636b19"] = true
  l_63_0["01fe0665-1ce5-4583-bafe-f2bf8a6a73d0"] = true
  l_63_0["d5d90bec-2758-42d0-bf56-02d956bf135c"] = true
  l_63_0["1bf8c75c-9326-4e7e-9dd3-5c1892c0ffc3"] = true
  l_63_0["b0272ed6-629f-42e9-bef5-3b879cf44196"] = true
  l_63_0["40a6c58e-df9e-46a2-b702-2f0e11c8470b"] = true
  l_63_0["c0bd6124-45c1-4996-924c-46167a59a818"] = true
  l_63_0["d3e3a858-f780-4d2c-b8e8-22d79d916ec1"] = true
  l_63_0["4ade8f48-1ef2-47f8-b554-daacc40fd518"] = true
  l_63_0["e3186a6e-fb5c-43b4-b5be-3d1ee0ebf674"] = true
  l_63_0["c2773dc2-bddd-44a8-b797-e12e0e64cb8e"] = true
  l_63_0["9022e75e-dfe8-4dcb-bd7a-df2a8168ac8d"] = true
  l_63_0["277894f2-d95f-41b8-b7ac-9b9bc223031c"] = true
  l_63_0["1b9d508b-eb79-4d91-9f66-dadb514ab39c"] = true
  l_63_0["03812f4b-e4df-4e71-a7e9-02e02301c4b1"] = true
  l_63_0["922ad644-d59b-4338-a818-0d6314a78536"] = true
  l_63_0["f626ea2f-6a93-4850-bfa7-9018adb65582"] = true
  l_63_0["86486b45-9fab-4b60-8ff6-d5477783a825"] = true
  l_63_0["53e28208-6aac-4f9b-8d60-f4a9e05c8774"] = true
  l_63_0["4cbb9f77-ea9f-41a0-b52a-960ac2dc5f01"] = true
  l_63_0["c85a1588-d8b9-4c80-83a0-d6a87be9b712"] = true
  l_63_0["ac94ef0a-20cd-43aa-8924-6bd156ecd6f0"] = true
  l_63_0["27823e87-5194-40fa-a692-e3aefa2faa16"] = true
  l_63_0["83d70c4c-fcb9-4de9-9880-2c34b95f0439"] = true
  l_63_0["187d8278-def1-4813-8a1d-3614e9fcdbb4"] = true
  l_63_0["e2741811-7cad-4941-a6d6-a090d7a11253"] = true
  l_63_0["a9e4e1ae-044e-4b18-85ba-b1e40d43b511"] = true
  l_63_0["f576af69-ad0b-4fef-ba5f-33a21773df43"] = true
  l_63_0["8081f7dc-c79d-415d-8a14-dda42304d1a4"] = true
  l_63_0["d148c7f3-45f0-4a78-8647-b46b2cac7b64"] = true
  l_63_0["02781b2f-3388-4de3-ac1e-34d8a69b4b9d"] = true
  l_63_0["a10a291b-4384-4161-98de-81e52f69df88"] = true
  l_63_0["c31b3172-0a24-439d-9289-19a636ca8084"] = true
  l_63_0["e5b09fc4-d1d9-42ff-a826-91792c600b87"] = true
  l_63_0["f011ea84-bfc4-4e3a-b313-2eb3519586ec"] = true
  l_63_0["d79e04ae-7499-4740-8bfa-a871fae7f415"] = true
  l_63_0["0a22f1df-85ef-4b8e-ad38-641b33651e9d"] = true
  l_63_0["fa9b0987-a412-4c68-9624-0909df6ee8c1"] = true
  l_63_0["5df1c174-1f0f-4a02-b449-e1fc85d2370a"] = true
  l_63_0["ec1154b2-d473-41a0-b914-d27b2bf64ac8"] = true
  l_63_0["de8ad6e8-f9f2-45f4-b7dd-be2fda319016"] = true
  l_63_0["e9cf8e43-27d7-47a9-a79d-2e04141762a7"] = true
  l_63_0["50b7f255-6811-4f15-80ac-ffbab20c5878"] = true
  l_63_0["551a8a43-bd4f-4ee0-82ac-0a3336533959"] = true
  l_63_0["ae71b458-f29f-4887-9204-d01d649088bb"] = true
  l_63_0["ecb93044-1c56-489a-a5cd-7a5acfbf53d5"] = true
  l_63_0["5a324dde-dcb5-4e3a-b2c1-1fdc6c60d48e"] = true
  l_63_0["a6454b24-1b9a-4dc0-974b-c3fe4bf71f2a"] = true
  l_63_0["b001a172-4636-4058-82a4-88803b90eb08"] = true
  l_63_0["67bad259-d464-44e7-b65c-83905665dd84"] = true
  l_63_0["2a4e6c81-1a1e-4bee-9c8a-a7ac7b9e8d9e"] = true
  l_63_0["457cf4d7-3847-4e71-9140-436a62db100c"] = true
  l_63_0["b9d143cb-d802-43bb-a820-9790c501e286"] = true
  l_63_0["07aebed2-fa9b-4da3-bde1-a4e53168030f"] = true
  l_63_0["88598bde-cc7f-42cd-b32d-5423c5faf3ba"] = true
  l_63_0["c7ec637c-878a-4f01-8c2c-b5cd6da7b836"] = true
  l_63_0["1f14b09f-9477-4311-8aa0-4b103e996cdb"] = true
  l_63_0["88409457-5141-4c6a-9654-386e5f9dfc7a"] = true
  l_63_0["d45a1e7f-069a-44ce-863d-996b3afc8a32"] = true
  l_63_0["b609c345-933c-4cfd-9dbf-4923a6e25f73"] = true
  l_63_0["cf12250b-0606-4ccb-886a-0938c73de778"] = true
  l_63_0["f3588a11-f071-4990-91be-1f99e816f9b6"] = true
  l_63_0["b423ea88-8ed1-4b93-a7bd-04d80eb90ee1"] = true
  l_63_0["73604805-290b-4930-b64d-c10694aca30c"] = true
  l_63_0["da31a007-6033-43a1-bbc4-566981c87dbd"] = true
  l_63_0["6c88703a-ff48-419b-a8f0-42effae4881b"] = true
  l_63_0["81ffcd20-4c13-4353-94d6-885c1c96f4a1"] = true
  l_63_0["a3906bc6-a3b6-4e49-bd0f-c0bff3e648e8"] = true
  l_63_0["95034fa2-fe1f-489d-8ecc-827deb470cec"] = true
  l_63_0["34f75caf-f95c-4149-bb5c-091730d4ade3"] = true
  l_63_0["68420a91-f498-481c-9dc1-f957f15fcc65"] = true
  l_63_0["efa6410a-b0a6-40be-9b26-69e397f22dd4"] = true
  l_63_0["73e3f0fb-cebd-4d0d-b0a3-b82bcd7d7684"] = true
  l_63_0["1ef3488a-db57-4847-abb5-a5b3aee8f942"] = true
  l_63_0["367f773d-1bd7-4b11-9e2d-14248dce10e7"] = true
  l_63_0["0ac1bd10-462e-43ba-9740-f12e7ba862ce"] = true
  l_63_0["0ca6e27d-1eff-4640-af51-f60da7b266e0"] = true
  l_63_0["e0c79e35-7c39-49f6-8650-edcc69aaba61"] = true
  l_63_0["078d14d5-bba0-4c1e-86ea-fe726b17aa59"] = true
  l_63_0["de48c3c7-1162-479d-b727-b9a7a1f27ebb"] = true
  l_63_0["9f9ad922-1c9b-4b26-a2a7-b8fe2ce243b1"] = true
  l_63_0["fa21229b-8de2-4e42-8176-23518d5fee8e"] = true
  l_63_0["00767538-3aeb-47f5-b21e-068eaa2d3585"] = true
  l_63_0["cda6a59a-bdd7-4269-a89a-cfe0cc035844"] = true
  l_63_0["e0f54a9a-e7c7-4139-a528-7e616a808425"] = true
  l_63_0["1cbdbd86-9676-4a69-8266-75550389e512"] = true
  l_63_0["5240d2ad-529b-4ff2-be61-24c22e2dc223"] = true
  l_63_0["9508acec-64bb-4c8b-b777-e4623ed552c4"] = true
  l_63_0["2baef0fb-732b-48be-8b05-8378c32b3863"] = true
  l_63_0["ec086568-3b10-43b7-acf7-4a2822fc8663"] = true
  l_63_0["c9093900-b1d3-42c7-808b-5b7e0da66ca4"] = true
  l_63_0["a3830578-0653-45ea-9095-97da11450d60"] = true
  l_63_0["5ad249ba-02d7-4358-8475-a9c880d5ac2e"] = true
  l_63_0["7c219fe2-6478-45bc-b1b3-5c6e782bdb91"] = true
  l_63_0["3930f511-4397-44c1-aa4e-35bfc85b3412"] = true
  l_63_0["9c692ae1-ba89-46b4-9917-6d9a4cbb12b3"] = true
  l_63_0["f562fd84-a462-4425-a835-761be8c9d403"] = true
  l_63_0["abae58f7-d355-46e7-9be3-c37a9b70bb5a"] = true
  l_63_0["e18a8e9d-0168-4175-9f80-8886b3cd1316"] = true
  l_63_0["083d3fb1-ce12-4ba4-ae1d-8efd37e2c0f4"] = true
  l_63_0["5e25bb3b-ef5e-4757-97ca-7187daf43243"] = true
  l_63_0["49739652-cc07-49c3-8b31-0c7eb0d0f4dc"] = true
  l_63_0["add9e0a6-9239-4ceb-ac67-c7e9358f58e3"] = true
  l_63_0["dd8fc33b-7a0f-4243-a4fa-5df4600bfcb6"] = true
  l_63_0["d60f87ec-db7d-4372-bc31-c770b7382f93"] = true
  l_63_0["f35d5ad5-45af-41b0-9d28-0f73e845187b"] = true
  l_63_0["1cf3c410-ef90-4f2d-b20d-a56b16de0e83"] = true
  local l_63_1 = "090b3ee2-3ac6-46b9-ba96-7a3b8a81cd1f"
  l_63_0[l_63_1] = true
  l_63_1 = "cfca059b-1611-4471-b00e-6670b6cc60ca"
  l_63_0[l_63_1] = true
  l_63_1 = "c677c28d-2c94-49ef-a250-5099ed00cea8"
  l_63_0[l_63_1] = true
  l_63_1 = "7d8df643-d167-4f22-bb7b-512e3fdbb275"
  l_63_0[l_63_1] = true
  l_63_1 = "46449c61-d6a2-45fa-8851-5fa8a46d5ed2"
  l_63_0[l_63_1] = true
  l_63_1 = "40222833-e511-47af-9324-40c4531ba777"
  l_63_0[l_63_1] = true
  l_63_1 = "6d219195-ecf9-401b-9892-3568b7ee1833"
  l_63_0[l_63_1] = true
  l_63_1 = "27d074db-bf2f-4c3d-a19d-498603494a51"
  l_63_0[l_63_1] = true
  l_63_1 = "e0c103d7-e635-4e0e-b800-9b31892842f4"
  l_63_0[l_63_1] = true
  l_63_1 = "e9323610-6354-4b09-a4aa-2307494bba43"
  l_63_0[l_63_1] = true
  l_63_1 = "0e2eb614-0a43-4328-9264-41c261c891b6"
  l_63_0[l_63_1] = true
  l_63_1 = versioning
  l_63_1 = l_63_1.GetOrgID
  l_63_1 = l_63_1()
  local l_63_2 = false
  if l_63_1 ~= nil and l_63_0[l_63_1] == true then
    l_63_2 = true
  end
  return l_63_2, l_63_1
end

isLolbinFilename = function(l_64_0)
  -- function num : 0_63
  local l_64_1 = {}
  l_64_1["cmd.exe"] = true
  l_64_1["powershell.exe"] = true
  l_64_1["wscript.exe"] = true
  l_64_1["cscript.exe"] = true
  l_64_1["mshta.exe"] = true
  l_64_1["wmic.exe"] = true
  l_64_1["bitsadmin.exe"] = true
  local l_64_2 = (string.match)(l_64_0, "([^\\]+)$")
  local l_64_3 = false
  if l_64_1[l_64_2] then
    l_64_3 = true
  end
  return l_64_3, l_64_2
end

isLolbinFile = function(l_65_0)
  -- function num : 0_64
  do
    local l_65_1 = {}
    -- DECOMPILER ERROR at PC17: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC18: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

    for l_65_5,l_65_6 in ("\\system32\\cmd.exe")("\\system32\\windowspowershell\\v1.0\\powershell.exe") do
      -- DECOMPILER ERROR at PC22: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC24: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC25: Overwrote pending register: R9 in 'AssignReg'

      if (("\\system32\\wbem\\wmic.exe").sub)("\\system32\\bitsadmin.exe", -"\\system32\\mshta.exe") == l_65_6 then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

TrackCommandLineAndTechniqueMain = function(l_66_0, l_66_1, l_66_2, l_66_3)
  -- function num : 0_65
  validateTechnique = function(l_67_0)
    -- function num : 0_65_0
    if l_67_0 == nil or #l_67_0 <= 3 then
      return 
    end
    local l_67_1 = (string.lower)(l_67_0)
    local l_67_2 = "bm_m"
    if (string.sub)(l_67_1, 1, 1) == "t" then
      return l_67_0
    else
      if (string.sub)(l_67_1, 1, #l_67_2) == l_67_2 then
        local l_67_3 = string.sub
        local l_67_4 = l_67_0
        local l_67_5 = #l_67_2 + 1
        do
          local l_67_6 = #l_67_0
          do return l_67_3(l_67_4, l_67_5, l_67_6) end
          -- DECOMPILER ERROR at PC37: Confused about usage of register R4 for local variables in 'ReleaseLocals'

          do return  end
          -- DECOMPILER ERROR at PC38: Confused about usage of register R3 for local variables in 'ReleaseLocals'

        end
      end
    end
  end

  if l_66_0 == nil or type(l_66_0) ~= "string" or #l_66_0 <= 1 or l_66_1 == nil then
    return 
  end
  if l_66_2 == nil then
    l_66_2 = 0
  end
  local l_66_4 = "CommandLineCustomHash"
  if l_66_3 ~= nil then
    l_66_4 = l_66_3
  end
  local l_66_5 = getCustomStringHash(l_66_0)
  if l_66_5 == nil then
    return 
  end
  local l_66_6 = l_66_4 .. ":" .. l_66_5
  local l_66_7 = false
  if type(l_66_1) == "string" then
    local l_66_8 = validateTechnique(l_66_1)
    if l_66_8 ~= nil then
      (MpCommon.AppendPersistContextNoPath)(l_66_6, l_66_8, l_66_2)
      l_66_7 = true
    end
  else
    do
      if type(l_66_1) == "table" then
        for l_66_12,l_66_13 in ipairs(l_66_1) do
          local l_66_14 = validateTechnique(l_66_13)
          if l_66_14 ~= nil then
            (MpCommon.AppendPersistContextNoPath)(l_66_6, l_66_14, l_66_2)
            l_66_7 = true
          end
        end
      end
      do
        return l_66_7
      end
    end
  end
end

TrackCommandLineAndTechnique = function(l_67_0, l_67_1, l_67_2, l_67_3, l_67_4)
  -- function num : 0_66
  if l_67_0 == nil or type(l_67_0) ~= "string" or #l_67_0 <= 1 or l_67_1 == nil then
    return 
  end
  if l_67_4 == nil then
    l_67_4 = true
  end
  local l_67_5, l_67_6 = nil, nil
  l_67_5 = TrackCommandLineAndTechniqueMain(l_67_0, l_67_1, l_67_2, l_67_3)
  if l_67_5 == true then
    TrackCommandLineAndTechniqueMain(l_67_0, "T0000:track_cmdline", l_67_2, l_67_3)
  end
  local l_67_7, l_67_8 = resolve_mainbinary_from_commandline(l_67_0)
  if l_67_4 == true and l_67_8 == true then
    l_67_6 = TrackCommandLineAndTechniqueMain(l_67_7, l_67_1, l_67_2, l_67_3)
    if l_67_6 == true then
      TrackCommandLineAndTechniqueMain(l_67_7, "T0000:track_cmdline", l_67_2, l_67_3)
    end
  end
  return l_67_5, l_67_6
end

resolve_command_fullpath = function(l_68_0)
  -- function num : 0_67
  if l_68_0 == nil or #l_68_0 <= 1 then
    return 
  end
  local l_68_1 = {}
  l_68_1.cmd = "%windir%\\system32\\cmd.exe"
  l_68_1.powershell = "%windir%\\system32\\windowspowershell\\v1.0\\powershell.exe"
  l_68_1.wscript = "%windir%\\system32\\wscript.exe"
  l_68_1.cscript = "%windir%\\system32\\cscript.exe"
  l_68_1.mshta = "%windir%\\system32\\mshta.exe"
  l_68_1.wmic = "%windir%\\system32\\wbem\\wmic.exe"
  l_68_1.bitsadmin = "%windir%\\system32\\bitsadmin.exe"
  l_68_1.rundll32 = "%windir%\\system32\\rundll32.exe"
  l_68_1.svchost = "%windir%\\system32\\svchost.exe"
  l_68_1.services = "%windir%\\system32\\services.exe"
  l_68_1.reg = "%windir%\\system32\\reg.exe"
  l_68_1.regsvr32 = "%windir%\\system32\\regsvr32.exe"
  l_68_1.regedit = "%windir%\\regedit.exe"
  l_68_1.schtasks = "%windir%\\system32\\schtasks.exe"
  l_68_1["%comspec%"] = "%windir%\\system32\\cmd.exe"
  if #l_68_0 > 4 and (string.sub)(l_68_0, -4) == ".exe" then
    l_68_0 = (string.sub)(l_68_0, 1, #l_68_0 - 4)
  end
  l_68_0 = (string.lower)(l_68_0)
  local l_68_2 = l_68_1[l_68_0]
  if l_68_2 ~= nil then
    l_68_2 = (mp.ContextualExpandEnvironmentVariables)(l_68_2)
  end
  return l_68_2
end

resolve_mainbinary_from_commandline = function(l_69_0)
  -- function num : 0_68
  if l_69_0 == nil or #l_69_0 <= 4 or (string.sub)(l_69_0, 1, 2) == "\\\\" or (string.sub)(l_69_0, 2, 3) == ":\\" or (string.find)(l_69_0, " ", 1, true) == nil then
    return l_69_0, false
  end
  local l_69_1 = (string.match)(l_69_0, "^(.-)%s")
  if l_69_1 == nil then
    return l_69_0, false
  end
  local l_69_2 = resolve_command_fullpath(l_69_1)
  if l_69_2 == nil then
    return l_69_0, false
  end
  local l_69_3 = l_69_2 .. (string.sub)(l_69_0, #l_69_1 + 1, #l_69_0)
  return l_69_3, true
end

GetTechniquesFromTrackedCommandLine = function(l_70_0, l_70_1)
  -- function num : 0_69
  if l_70_0 == nil then
    return 
  end
  local l_70_2 = "CommandLineCustomHash"
  if l_70_1 ~= nil then
    l_70_2 = l_70_1
  end
  local l_70_3 = getCustomStringHash(l_70_0)
  if l_70_3 == nil then
    return 
  end
  local l_70_4 = l_70_2 .. ":" .. l_70_3
  if (MpCommon.GetPersistContextCountNoPath)(l_70_4) >= 1 then
    local l_70_5 = MpCommon.GetPersistContextNoPath
    local l_70_6 = l_70_4
    do return l_70_5(l_70_6) end
    -- DECOMPILER ERROR at PC28: Confused about usage of register R6 for local variables in 'ReleaseLocals'

  end
  do return  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register R5 for local variables in 'ReleaseLocals'

end

IsCommandLineTracked = function(l_71_0, l_71_1, l_71_2)
  -- function num : 0_70
  if l_71_0 == nil then
    return 
  end
  if l_71_2 == nil then
    l_71_2 = true
  end
  local l_71_3 = GetTechniquesFromTrackedCommandLine(l_71_0, l_71_1)
  if l_71_3 ~= nil then
    return true, l_71_3, l_71_0
  end
  local l_71_4, l_71_5 = resolve_mainbinary_from_commandline(l_71_0)
  do
    if l_71_2 == true and l_71_5 == true then
      local l_71_6 = GetTechniquesFromTrackedCommandLine(l_71_4, l_71_1)
      if l_71_6 ~= nil then
        return true, l_71_6, l_71_4
      end
    end
    return false
  end
end

IsCommandLineTrackedForTechnique = function(l_72_0, l_72_1, l_72_2, l_72_3)
  -- function num : 0_71
  FindStringInTable = function(l_73_0, l_73_1)
    -- function num : 0_71_0
    if l_73_0 == nil or l_73_1 == nil or type(l_73_1) ~= "table" then
      return 
    end
    local l_73_2 = (string.lower)(l_73_0)
    for l_73_6,l_73_7 in ipairs(l_73_1) do
      local l_73_8 = (string.lower)(l_73_7)
      if (string.find)(l_73_8, l_73_2, 1, true) then
        return true, l_73_7
      end
    end
    return false
  end

  if l_72_0 == nil or l_72_1 == nil then
    return 
  end
  if l_72_3 == nil then
    l_72_3 = true
  end
  local l_72_4 = GetTechniquesFromTrackedCommandLine(l_72_0, l_72_2)
  do
    if l_72_4 ~= nil then
      local l_72_5, l_72_6 = FindStringInTable(l_72_1, l_72_4)
      if l_72_5 == true then
        return true, l_72_6, l_72_0
      end
    end
    local l_72_7, l_72_8 = resolve_mainbinary_from_commandline(l_72_0)
    if l_72_3 == true and l_72_8 == true then
      local l_72_9 = GetTechniquesFromTrackedCommandLine(l_72_7, l_72_2)
      if l_72_9 ~= nil then
        local l_72_10, l_72_11 = FindStringInTable(l_72_1, l_72_9)
        if l_72_10 == true then
          return true, l_72_11, l_72_7
        end
      end
    end
    do
      return false
    end
  end
end

table_distinct_values = function(l_73_0)
  -- function num : 0_72
  if l_73_0 == nil or #l_73_0 == nil or #l_73_0 <= 1 then
    return l_73_0
  end
  local l_73_1 = {}
  ;
  (table.sort)(l_73_0)
  for l_73_5,l_73_6 in ipairs(l_73_0) do
    if l_73_6 ~= l_73_0[l_73_5 + 1] then
      (table.insert)(l_73_1, l_73_6)
    end
  end
  return l_73_1
end

get_filepaths_from_string = function(l_74_0, l_74_1, l_74_2)
  -- function num : 0_73
  if l_74_0 == nil or type(l_74_0) ~= "string" or #l_74_0 <= 3 then
    return 
  end
  l_74_0 = (string.lower)(l_74_0)
  local l_74_3 = (mp.GetExecutablesFromCommandLine)(l_74_0)
  if l_74_3 == nil or type(l_74_3) ~= "table" then
    l_74_3 = {}
  end
  local l_74_4 = (string.gmatch)(l_74_0, "(.:\\.-%.[a-z]+)")
  for l_74_8 in l_74_4 do
    (table.insert)(l_74_3, l_74_8)
  end
  local l_74_9 = (string.gmatch)(l_74_0, "(%%.-%.[a-z]+)")
  for l_74_13 in l_74_9 do
    local l_74_14, l_74_15 = pcall(mp.ContextualExpandEnvironmentVariables, l_74_13)
    if not l_74_14 then
      l_74_15 = (MpCommon.ExpandEnvironmentVariables)(l_74_13)
    end
    if l_74_15 ~= nil then
      (table.insert)(l_74_3, l_74_15)
    end
  end
  if (string.find)(l_74_0, "cmd.exe", 1, true) and (string.find)(l_74_0, " /d ", 1, true) then
    if not l_74_0:match("/d%s+\"([^\"]+)\"") then
      l_74_1 = l_74_0:match("/d%s+([^%s\"]+)")
    end
    l_74_1 = l_74_1:gsub("[\"\']", "")
  else
    if (string.find)(l_74_0, "powershell.exe", 1, true) and (string.find)(l_74_0, " -workingdirectory ", 1, true) then
      if not l_74_0:match("%-workingdirectory%s+\"([^\"]+)\"") then
        l_74_1 = l_74_0:match("%-workingdirectory%s+([^%s]+)")
      end
      l_74_1 = l_74_1:gsub("[\"\']", "")
    end
  end
  local l_74_16 = false
  local l_74_17 = false
  if l_74_1 ~= nil and #l_74_1 > 3 then
    l_74_16 = true
    if (string.find)(l_74_1, "%", 1, true) then
      l_74_1 = (MpCommon.ExpandEnvironmentVariables)(l_74_1)
    end
    l_74_17 = (string.sub)(l_74_1, -1) == "\\"
  end
  if (string.find)(l_74_0, "node.exe .", 1, true) or (string.find)(l_74_0, "node .", 1, true) or (string.find)(l_74_0, "node", 1, true) and ((string.find)(l_74_0, " -argumentlist \'.\'", 1, true) or (string.find)(l_74_0, " -argumentlist \".\"", 1, true)) then
    l_74_0 = l_74_0 .. " index.js "
  end
  local l_74_18 = (string.gmatch)(l_74_0, "[\'\"%s,]?([^\"\'%s,]-%.%a+)[%\"\'%s,]?")
  do
    local l_74_19 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
    for l_74_23 in l_74_18 do
      if (string.find)(l_74_23, "\\", 1, true) == nil then
        if l_74_2 ~= true then
          local l_74_24 = l_74_19 .. "\\system32\\" .. l_74_23
          ;
          (table.insert)(l_74_3, l_74_24)
          local l_74_25 = l_74_19 .. "\\" .. l_74_23
          ;
          (table.insert)(l_74_3, l_74_25)
          local l_74_26 = l_74_19 .. "\\system32\\wbem\\" .. l_74_23
          ;
          (table.insert)(l_74_3, l_74_26)
          local l_74_27 = l_74_19 .. "\\system32\\windowspowershell\\v1.0\\" .. l_74_23
          ;
          (table.insert)(l_74_3, l_74_27)
          local l_74_28 = l_74_19 .. "\\syswow64\\" .. l_74_23
          ;
          (table.insert)(l_74_3, l_74_28)
        end
        if l_74_16 == true then
          if l_74_17 == true then
            local l_74_29 = l_74_1 .. l_74_23
            ;
            (table.insert)(l_74_3, l_74_29)
          else
            local l_74_30 = l_74_1 .. "\\" .. l_74_23
            ;
            (table.insert)(l_74_3, l_74_30)
          end
        end
      end
    end
    do return l_74_3 end
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end

IsProcNameInParentProcessTree = function(l_75_0, l_75_1, l_75_2)
  -- function num : 0_74
  if l_75_0 == nil or l_75_1 == nil then
    return 
  end
  local l_75_3 = l_75_0
  if l_75_0:sub(1, 4) ~= "pid:" then
    l_75_0 = GetProcessPpidByScenario(l_75_0)
  end
  if l_75_0 == nil then
    return nil
  end
  if l_75_2 == nil then
    l_75_2 = 5
  end
  local l_75_4 = l_75_0
  for l_75_8 = 1, l_75_2 do
    local l_75_9 = (mp.GetParentProcInfo)(l_75_4)
    if l_75_8 == 1 and (string.lower)(l_75_3) == "cmdhstr" then
      l_75_9 = (mp.GetParentProcInfo)()
    end
    if l_75_9 == nil then
      break
    end
    l_75_4 = l_75_9.ppid
    if l_75_4 == nil then
      break
    end
    if l_75_9.image_path ~= nil then
      local l_75_10 = (string.lower)(l_75_9.image_path)
      -- DECOMPILER ERROR at PC76: Unhandled construct in 'MakeBoolean' P1

      if type(l_75_1) == "string" and (string.sub)(l_75_10, -#l_75_1) == l_75_1 then
        return true, l_75_4, l_75_10, l_75_1, l_75_8
      end
    end
    if type(l_75_1) == "table" then
      for l_75_14,l_75_15 in ipairs(l_75_1) do
        if (string.sub)(l_75_10, -#l_75_15) == l_75_15 then
          return true, l_75_4, l_75_10, l_75_15, l_75_8
        end
      end
    end
  end
  do
    do return false end
    -- DECOMPILER ERROR at PC106: Confused about usage of register R6 for local variables in 'ReleaseLocals'

  end
end

IsExcludedHostCheck = function(l_76_0)
  -- function num : 0_75
  if l_76_0 == nil or l_76_0 == "" then
    return true
  end
  l_76_0 = l_76_0:lower()
  local l_76_1 = {}
  l_76_1["encrypted-tbn0.gstatic.com"] = true
  l_76_1["img.freepik.com"] = true
  l_76_1["api.engage.cloud.microsoft"] = true
  l_76_1["image.shutterstock.com"] = true
  l_76_1["cdn-icons-png.flaticon.com"] = true
  l_76_1["loop.cloud.microsoft"] = true
  l_76_1[";lanmanredirector"] = true
  l_76_1["login.microsoftonline.com"] = true
  l_76_1["login.live.com"] = true
  l_76_1["about:internet"] = true
  l_76_1["google.com"] = true
  return l_76_1[l_76_0]
end

TrackAttackerServer = function(l_77_0, l_77_1)
  -- function num : 0_76
  if not l_77_1 then
    l_77_1 = 3600
  end
  local l_77_2 = ExtractPartsFromUri(l_77_0)
  if l_77_2.host and l_77_2.host ~= "" then
    if GetRollingQueueKeyValue("SuspAttackServer", l_77_2.host) == nil then
      local l_77_3 = tostring(l_77_2.path)
    else
      do
        -- DECOMPILER ERROR at PC23: Confused about usage of register: R3 in 'UnsetPending'

        do
          local l_77_4, l_77_5 = l_77_3 .. "|" .. tostring(l_77_2.path)
          -- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

          AppendToRollingQueue("SuspAttackServer", l_77_2.host, l_77_4, 3600)
        end
      end
    end
  end
end

IsHostAttackServerCloudChk = function(l_78_0, l_78_1, l_78_2, l_78_3, l_78_4)
  -- function num : 0_77
  if not l_78_0 then
    return false
  end
  local l_78_5 = ExtractPartsFromUri(l_78_0)
  if l_78_5.host and l_78_5.host ~= "" then
    l_78_0 = l_78_5.host
  end
  if IsKeyInRollingQueue("CleanHostCache", l_78_0) then
    return false
  end
  if IsExcludedHostCheck(l_78_0) then
    return false
  end
  local l_78_6 = IsKeyInRollingQueue("SuspAttackServer", l_78_5.host, false)
  if l_78_6 then
    return l_78_6
  end
  local l_78_7 = {}
  l_78_7.SIG_CONTEXT = "ATTACKSERVER"
  l_78_7.TAG = "NOLOOKUP"
  if l_78_1 ~= nil and l_78_1 ~= "" then
    l_78_7.CONTENT_SOURCE = l_78_1
  end
  if l_78_2 ~= nil and l_78_2 ~= "" then
    l_78_7.PROCESS_CONTEXT = l_78_2
  end
  if l_78_3 ~= nil and l_78_3 ~= "" then
    l_78_7.PROCESS_CMDLINE = l_78_3
  end
  if l_78_4 ~= nil and l_78_4 ~= "" then
    l_78_7.SCENARIO = l_78_4
  end
  local l_78_8 = SafeGetUrlReputation
  local l_78_9 = {}
  -- DECOMPILER ERROR at PC63: No list found for R9 , SetList fails

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R10 in 'AssignReg'

  l_78_8 = l_78_8(l_78_9, l_78_0, false, 2000)
  l_78_9 = l_78_8.urls
  l_78_9 = l_78_9[l_78_0]
  if l_78_9 then
    l_78_9 = l_78_8.urls
    l_78_9 = l_78_9[l_78_0]
    l_78_9 = l_78_9.determination
    if l_78_9 == 2 then
      l_78_9 = TrackAttackerServer
      l_78_9(l_78_0)
      l_78_9 = true
      return l_78_9
    else
      l_78_9 = AppendToRollingQueue
      l_78_9("CleanHostCache", l_78_0, true, 36000)
    end
    l_78_9 = false
    return l_78_9
  end
end

IsHostAttackServer = function(l_79_0, l_79_1)
  -- function num : 0_78
  local l_79_2 = false
  if not l_79_1 then
    l_79_1 = false
  end
  local l_79_3 = ExtractPartsFromUri(l_79_0)
  if l_79_3.host and l_79_3.host ~= "" then
    if not l_79_1 then
      l_79_1 = false
    end
    if IsExcludedHostCheck(l_79_3.host) then
      return false
    end
    l_79_2 = IsKeyInRollingQueue("SuspAttackServer", l_79_3.host, l_79_1)
    return l_79_2
  end
  return false
end

IsDiscoveryCollectionThresholdMetLinux = function(l_80_0)
  -- function num : 0_79
  if l_80_0 == nil then
    return false
  end
  do
    if ((((((((((((((IsTechniqueObservedForPid(l_80_0, "T1057") or IsTacticObservedForPid(l_80_0, "Discovery_Process")) and IsTechniqueObservedForPid(l_80_0, "T1552")) or IsTacticObservedForPid(l_80_0, "CredentialAccess")) and IsTechniqueObservedForPid(l_80_0, "T1083")) or IsTacticObservedForPid(l_80_0, "Discovery_FileAndDirectoryDiscovery")) and IsTechniqueObservedForPid(l_80_0, "T1074")) or IsTacticObservedForPid(l_80_0, "Collection_DataStaged")) and IsTechniqueObservedForPid(l_80_0, "T1049")) or IsTacticObservedForPid(l_80_0, "Discovery_NetworkConnectionsDiscovery")) and IsTechniqueObservedForPid(l_80_0, "T1033")) or IsTacticObservedForPid(l_80_0, "Discovery_SystemOwnerUserDiscovery")) and IsTechniqueObservedForPid(l_80_0, "T1518")) or IsTacticObservedForPid(l_80_0, "Discovery_SoftwareDiscovery")) and IsTechniqueObservedForPid(l_80_0, "T1082")) or IsTacticObservedForPid(l_80_0, "Discovery_SystemInfoDiscovery") then
      local l_80_1 = 0 + 15 + 16 + 15 + 15 + 15 + 8 + 8 + 8
    end
    -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC113: Confused about usage of register: R1 in 'UnsetPending'

    if 45 <= l_80_1 and l_80_1 <= 100 then
      return true
    end
    return false
  end
end

IsDetectionThresholdMetLinuxWrapper = function(l_81_0, l_81_1, l_81_2, l_81_3, l_81_4)
  -- function num : 0_80
  local l_81_5 = 0
  local l_81_6 = true
  local l_81_7 = nil
  if IsDetectionThresholdMetLinux(l_81_0) then
    return true
  end
  if l_81_6 then
    local l_81_8 = GetTacticsTableForPid(l_81_0)
    local l_81_9 = GetTechniquesTableForPid(l_81_0)
    if l_81_8 == nil or l_81_9 == nil then
      return false
    end
    for l_81_13,l_81_14 in pairs(l_81_8) do
      if l_81_13 ~= nil then
        if l_81_7 == nil then
          l_81_7 = l_81_13:lower()
        else
          l_81_7 = l_81_7 .. " | " .. l_81_13:lower()
        end
      end
      if l_81_14 ~= nil then
        l_81_5 = l_81_5 + l_81_14
      end
    end
    if l_81_7 ~= nil then
      if l_81_7:find("collection", 1, true) and l_81_7:find("discovery", 1, true) and l_81_7:find("exfiltration", 1, true) then
        return true
      end
      if (l_81_7:find("initialaccess", 1, true) or l_81_7:find("collection", 1, true) or l_81_7:find("discovery", 1, true) or l_81_7:find("execution", 1, true) or l_81_7:find("credentialaccess", 1, true) or l_81_7:find("defenseevasion", 1, true) or l_81_7:find("lateralmovement", 1, true) or l_81_7:find("privilegeescalation", 1, true)) and l_81_7:find("persistence", 1, true) and (l_81_7:find("exfiltration", 1, true) or l_81_7:find("commandandcontrol", 1, true)) then
        return true
      end
      if ((not l_81_7:find("collection", 1, true) and not l_81_7:find("discovery", 1, true) and not l_81_7:find("execution", 1, true)) or (not l_81_7:find("credentialaccess", 1, true) and not l_81_7:find("defenseevasion", 1, true) and not l_81_7:find("lateralmovement", 1, true)) or (l_81_7:find("persistence", 1, true) or l_81_7:find("exfiltration", 1, true) or l_81_7:find("commandandcontrol", 1, true))) then
        return true
      end
      if (l_81_7:find("initialaccess", 1, true) or l_81_7:find("collection", 1, true) or l_81_7:find("discovery", 1, true) or l_81_7:find("execution", 1, true) or l_81_7:find("credentialaccess", 1, true) or l_81_7:find("defenseevasion", 1, true) or l_81_7:find("lateralmovement", 1, true) or l_81_7:find("privilegeescalation", 1, true)) and l_81_7:find("exfiltration", 1, true) and l_81_7:find("commandandcontrol", 1, true) then
        return true
      end
    end
    do
      do
        if ((((((((((not l_81_7:find("initialaccess", 1, true) or l_81_7:find("execution", 1, true)) and not l_81_7:find("persistence", 1, true)) or l_81_7:find("privilegeescalation", 1, true)) and not l_81_7:find("defenseevasion", 1, true)) or l_81_7:find("credentialaccess", 1, true)) and not l_81_7:find("discovery", 1, true)) or l_81_7:find("lateralmovement", 1, true)) and not l_81_7:find("collection", 1, true)) or l_81_7:find("commandandcontrol", 1, true)) and not l_81_7:find("exfiltration", 1, true)) or l_81_7:find("impact", 1, true) then
          local l_81_15 = 0 + 1 + 1 + 2 + 1 + 1 + 1 + 1 + 2 + 1 + 2 + 2 + 2
        end
        -- DECOMPILER ERROR at PC386: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC388: Confused about usage of register: R10 in 'UnsetPending'

        if 4 <= l_81_15 and l_81_15 <= 17 then
          return true
        end
        return false
      end
    end
  end
end

TT_SendTechniqueIntents = function(l_82_0)
  -- function num : 0_81
  TT_SendBMSigTrigger(l_82_0, "send_ttdata", "send_ttdata", 30)
end

TT_IsProdCriticalService = function(l_83_0)
  -- function num : 0_82
  if l_83_0:find("veeam.backup", 1, true) or l_83_0:find("backupexec", 1, true) or l_83_0:find("netbackup", 1, true) then
    return true
  end
  if l_83_0:find("msexchange", 1, true) or l_83_0:find("microsoft.exchange", 1, true) or l_83_0:find("acronis", 1, true) then
    return true
  end
  if l_83_0:find("veeamenterprise", 1, true) or l_83_0:find("oracle", 1, true) or l_83_0:find("sqlagent", 1, true) then
    return true
  end
  local l_83_1 = {}
  l_83_1.acronisagent = true
  l_83_1.acrsch2svc = true
  l_83_1.avpsus = true
  l_83_1["bmr boot service"] = true
  l_83_1["bmr mtftp service"] = true
  l_83_1.caarcupdatesvc = true
  l_83_1.casad2dwebsvc = true
  l_83_1.ccevtmgr = true
  l_83_1.ccsetmgr = true
  l_83_1.defwatch = true
  l_83_1.dns = true
  l_83_1.dnssvc = true
  l_83_1.eventlog = true
  l_83_1.gxblr = true
  l_83_1.gxcimgr = true
  l_83_1.gxcvd = true
  l_83_1.gxfwd = true
  l_83_1.gxvss = true
  l_83_1.intuit = true
  l_83_1["intuit.quickbooks.fcs"] = true
  l_83_1.mcafeedlpagentservice = true
  l_83_1.memtas = true
  l_83_1.mepocs = true
  l_83_1.mfewc = true
  l_83_1.mpssvc = true
  l_83_1["msdtc.exe"] = true
  l_83_1.msdtc = true
  l_83_1["msexchange transport logsearch"] = true
  l_83_1.msexchangeantispamupdate = true
  l_83_1.msexchangecompliance = true
  l_83_1.msexchangedagmgmt = true
  l_83_1.msexchangedelivery = true
  l_83_1.msexchangediagnostics = true
  l_83_1.msexchangeedgesync = true
  l_83_1.msexchangefastsearch = true
  l_83_1.msexchangefrontendtransport = true
  l_83_1.msexchangehm = true
  l_83_1.msexchangehmrecovery = true
  l_83_1.msexchangeimap4 = true
  l_83_1.msexchangeimap4be = true
  l_83_1.msexchangeis = true
  l_83_1.msexchangemailboxassistants = true
  l_83_1.msexchangemailboxreplication = true
  l_83_1.msexchangenotificationsbroker = true
  l_83_1.msexchangepop3 = true
  l_83_1.msexchangepop3be = true
  l_83_1.msexchangerepl = true
  l_83_1.msexchangerpc = true
  l_83_1.msexchangeservicehost = true
  l_83_1.msexchangesubmission = true
  l_83_1.msexchangethrottling = true
  l_83_1.msexchangetransport = true
  l_83_1.msexchangeum = true
  l_83_1.msexchangeumcr = true
  l_83_1.msmpeng = true
  l_83_1.mssense = true
  l_83_1.mspub = true
  l_83_1.mssqlserver = true
  l_83_1.mssqlsvc = true
  l_83_1.mysql = true
  l_83_1.mysql80 = true
  l_83_1.pdvfsservice = true
  l_83_1.perfhost = true
  l_83_1.pop3svc = true
  l_83_1.profsvc = true
  l_83_1.qbcfmonitorservice = true
  l_83_1.qbfcservice = true
  l_83_1.qbidpservice = true
  l_83_1.rtvscan = true
  l_83_1.samss = true
  l_83_1["sacsvr.exe"] = true
  l_83_1.savroam = true
  l_83_1["savservice.exe"] = true
  l_83_1.sdrsvc = true
  l_83_1.sense = true
  l_83_1.sophos = true
  l_83_1.sql = true
  l_83_1["sqlagent.exe"] = true
  l_83_1["sqlbrowser.exe"] = true
  l_83_1.sqlbrowser = true
  l_83_1["sqlceip.exe"] = true
  l_83_1.sqlserveragent = true
  l_83_1["sqlservr.exe"] = true
  l_83_1.sqltelemetry = true
  l_83_1["sqlwriter.exe"] = true
  l_83_1.sqlwriter = true
  l_83_1.stc_raw_agent = true
  l_83_1.usermanager = true
  l_83_1.vboxdrv = true
  l_83_1.vds = true
  l_83_1["veeam.guest.interaction.proxy.exe"] = true
  l_83_1.veeam = true
  l_83_1.veeamcatalogsvc = true
  l_83_1.veeamcloudsvc = true
  l_83_1.veeamdeploymentservice = true
  l_83_1["veeamdeploymentsvc.exe"] = true
  l_83_1.veeamdeploysvc = true
  l_83_1["veeamfilesysvsssvc.exe"] = true
  l_83_1["veeamnfssvc.exe"] = true
  l_83_1.veeamnfssvc = true
  l_83_1["veeamtransportsvc.exe"] = true
  l_83_1.veeamtransportsvc = true
  l_83_1.vmcompute = true
  l_83_1.vmms = true
  l_83_1["vmwp.exe"] = true
  l_83_1.vsnapvss = true
  l_83_1.vss = true
  l_83_1.vsssvc = true
  l_83_1.webthreatdefsvc = true
  l_83_1.wecsvc = true
  l_83_1.wer = true
  l_83_1.wersvc = true
  l_83_1.windefend = true
  l_83_1.w3svc = true
  l_83_1["w3wp.exe"] = true
  l_83_1.yoobackup = true
  l_83_1.yooit = true
  if l_83_1[l_83_0] then
    return true
  end
  return false
end

Has_NetworkLogonSuccess = function(l_84_0)
  -- function num : 0_83
  if not l_84_0 then
    l_84_0 = false
  end
  local l_84_1 = GetRollingQueue("has_networklogonsuccess")
  if not l_84_1 then
    return false
  end
  if l_84_0 then
    local l_84_2 = safeJsonSerialize(l_84_1)
    if l_84_2 ~= nil then
      l_84_2 = (MpCommon.Base64Encode)(l_84_2)
      ;
      (bm.add_related_string)("NetworkLogonSuccess", l_84_2, bm.RelatedStringBMReport)
    end
  else
    do
      do
        local l_84_3 = safeJsonSerialize(l_84_1)
        if l_84_3 ~= nil then
          l_84_3 = (MpCommon.Base64Encode)(l_84_3)
          set_research_data("NetworkLogonSuccess", l_84_3, false)
        end
        return true
      end
    end
  end
end

isLolBasFilename = function(l_85_0, l_85_1)
  -- function num : 0_84
  if l_85_0 == nil or #l_85_0 <= 5 then
    return 
  end
  l_85_0 = (string.lower)(l_85_0)
  local l_85_2 = {}
  l_85_2["addinutil.exe"] = "binaries"
  l_85_2["appinstaller.exe"] = "binaries"
  l_85_2["aspnet_compiler.exe"] = "binaries"
  l_85_2["at.exe"] = "binaries"
  l_85_2["atbroker.exe"] = "binaries"
  l_85_2["bash.exe"] = "binaries"
  l_85_2["bitsadmin.exe"] = "binaries"
  l_85_2["certoc.exe"] = "binaries"
  l_85_2["certreq.exe"] = "binaries"
  l_85_2["certutil.exe"] = "binaries"
  l_85_2["cmd.exe"] = "binaries"
  l_85_2["cmdkey.exe"] = "binaries"
  l_85_2["cmdl32.exe"] = "binaries"
  l_85_2["cmstp.exe"] = "binaries"
  l_85_2["colorcpl.exe"] = "binaries"
  l_85_2["computerdefaults.exe"] = "binaries"
  l_85_2["configsecuritypolicy.exe"] = "binaries"
  l_85_2["conhost.exe"] = "binaries"
  l_85_2["control.exe"] = "binaries"
  l_85_2["csc.exe"] = "binaries"
  l_85_2["cscript.exe"] = "binaries"
  l_85_2["customshellhost.exe"] = "binaries"
  l_85_2["datasvcutil.exe"] = "binaries"
  l_85_2["desktopimgdownldr.exe"] = "binaries"
  l_85_2["devicecredentialdeployment.exe"] = "binaries"
  l_85_2["dfsvc.exe"] = "binaries"
  l_85_2["diantz.exe"] = "binaries"
  l_85_2["diskshadow.exe"] = "binaries"
  l_85_2["dnscmd.exe"] = "binaries"
  l_85_2["esentutl.exe"] = "binaries"
  l_85_2["eventvwr.exe"] = "binaries"
  l_85_2["expand.exe"] = "binaries"
  l_85_2["explorer.exe"] = "binaries"
  l_85_2["extexport.exe"] = "binaries"
  l_85_2["extrac32.exe"] = "binaries"
  l_85_2["findstr.exe"] = "binaries"
  l_85_2["finger.exe"] = "binaries"
  l_85_2["fltmc.exe"] = "binaries"
  l_85_2["forfiles.exe"] = "binaries"
  l_85_2["fsutil.exe"] = "binaries"
  l_85_2["ftp.exe"] = "binaries"
  l_85_2["gpscript.exe"] = "binaries"
  l_85_2["hh.exe"] = "binaries"
  l_85_2["imewdbld.exe"] = "binaries"
  l_85_2["ie4uinit.exe"] = "binaries"
  l_85_2["iediagcmd.exe"] = "binaries"
  l_85_2["ieexec.exe"] = "binaries"
  l_85_2["ilasm.exe"] = "binaries"
  l_85_2["infdefaultinstall.exe"] = "binaries"
  l_85_2["installutil.exe"] = "binaries"
  l_85_2["jsc.exe"] = "binaries"
  l_85_2["ldifde.exe"] = "binaries"
  l_85_2["makecab.exe"] = "binaries"
  l_85_2["mavinject.exe"] = "binaries"
  l_85_2["microsoft.workflow.compiler.exe"] = "binaries"
  l_85_2["mmc.exe"] = "binaries"
  l_85_2["mpcmdrun.exe"] = "binaries"
  l_85_2["msbuild.exe"] = "binaries"
  l_85_2["msconfig.exe"] = "binaries"
  l_85_2["msdt.exe"] = "binaries"
  l_85_2["msedge.exe"] = "binaries"
  l_85_2["mshta.exe"] = "binaries"
  l_85_2["msiexec.exe"] = "binaries"
  l_85_2["netsh.exe"] = "binaries"
  l_85_2["ngen.exe"] = "binaries"
  l_85_2["odbcconf.exe"] = "binaries"
  l_85_2["offlinescannershell.exe"] = "binaries"
  l_85_2["onedrivestandaloneupdater.exe"] = "binaries"
  l_85_2["pcalua.exe"] = "binaries"
  l_85_2["pcwrun.exe"] = "binaries"
  l_85_2["pktmon.exe"] = "binaries"
  l_85_2["pnputil.exe"] = "binaries"
  l_85_2["presentationhost.exe"] = "binaries"
  l_85_2["print.exe"] = "binaries"
  l_85_2["printbrm.exe"] = "binaries"
  l_85_2["provlaunch.exe"] = "binaries"
  l_85_2["psr.exe"] = "binaries"
  l_85_2["rasautou.exe"] = "binaries"
  l_85_2["rdrleakdiag.exe"] = "binaries"
  l_85_2["reg.exe"] = "binaries"
  l_85_2["regasm.exe"] = "binaries"
  l_85_2["regedit.exe"] = "binaries"
  l_85_2["regini.exe"] = "binaries"
  l_85_2["register-cimprovider.exe"] = "binaries"
  l_85_2["regsvcs.exe"] = "binaries"
  l_85_2["regsvr32.exe"] = "binaries"
  l_85_2["replace.exe"] = "binaries"
  l_85_2["rpcping.exe"] = "binaries"
  l_85_2["rundll32.exe"] = "binaries"
  l_85_2["runexehelper.exe"] = "binaries"
  l_85_2["runonce.exe"] = "binaries"
  l_85_2["runscripthelper.exe"] = "binaries"
  l_85_2["sc.exe"] = "binaries"
  l_85_2["schtasks.exe"] = "binaries"
  l_85_2["scriptrunner.exe"] = "binaries"
  l_85_2["setres.exe"] = "binaries"
  l_85_2["settingsynchost.exe"] = "binaries"
  l_85_2["ssh.exe"] = "binaries"
  l_85_2["stordiag.exe"] = "binaries"
  l_85_2["syncappvpublishingserver.exe"] = "binaries"
  l_85_2["tar.exe"] = "binaries"
  l_85_2["ttdinject.exe"] = "binaries"
  l_85_2["tttracer.exe"] = "binaries"
  l_85_2["unregmp2.exe"] = "binaries"
  l_85_2["vbc.exe"] = "binaries"
  l_85_2["verclsid.exe"] = "binaries"
  l_85_2["wab.exe"] = "binaries"
  l_85_2["wbadmin.exe"] = "binaries"
  l_85_2["winget.exe"] = "binaries"
  l_85_2["wlrmdr.exe"] = "binaries"
  l_85_2["wmic.exe"] = "binaries"
  l_85_2["workfolders.exe"] = "binaries"
  l_85_2["wscript.exe"] = "binaries"
  l_85_2["wsreset.exe"] = "binaries"
  l_85_2["wuauclt.exe"] = "binaries"
  l_85_2["xwizard.exe"] = "binaries"
  l_85_2["msedge_proxy.exe"] = "binaries"
  l_85_2["msedgewebview2.exe"] = "binaries"
  l_85_2["wt.exe"] = "binaries"
  l_85_2["advpack.dll"] = "libraries"
  l_85_2["desk.cpl"] = "libraries"
  l_85_2["dfshim.dll"] = "libraries"
  l_85_2["ieadvpack.dll"] = "libraries"
  l_85_2["ieframe.dll"] = "libraries"
  l_85_2["mshtml.dll"] = "libraries"
  l_85_2["pcwutl.dll"] = "libraries"
  l_85_2["scrobj.dll"] = "libraries"
  l_85_2["setupapi.dll"] = "libraries"
  l_85_2["shdocvw.dll"] = "libraries"
  l_85_2["shell32.dll"] = "libraries"
  l_85_2["shimgvw.dll"] = "libraries"
  l_85_2["syssetup.dll"] = "libraries"
  l_85_2["url.dll"] = "libraries"
  l_85_2["zipfldr.dll"] = "libraries"
  l_85_2["comsvcs.dll"] = "libraries"
  l_85_2["acccheckconsole.exe"] = "othermsbinaries"
  l_85_2["adplus.exe"] = "othermsbinaries"
  l_85_2["agentexecutor.exe"] = "othermsbinaries"
  l_85_2["appcert.exe"] = "othermsbinaries"
  l_85_2["appvlp.exe"] = "othermsbinaries"
  l_85_2["bginfo.exe"] = "othermsbinaries"
  l_85_2["cdb.exe"] = "othermsbinaries"
  l_85_2["coregen.exe"] = "othermsbinaries"
  l_85_2["createdump.exe"] = "othermsbinaries"
  l_85_2["csi.exe"] = "othermsbinaries"
  l_85_2["defaultpack.exe"] = "othermsbinaries"
  l_85_2["devinit.exe"] = "othermsbinaries"
  l_85_2["devtoolslauncher.exe"] = "othermsbinaries"
  l_85_2["dnx.exe"] = "othermsbinaries"
  l_85_2["dotnet.exe"] = "othermsbinaries"
  l_85_2["dsdbutil.exe"] = "othermsbinaries"
  l_85_2["dtutil.exe"] = "othermsbinaries"
  l_85_2["dump64.exe"] = "othermsbinaries"
  l_85_2["dumpminitool.exe"] = "othermsbinaries"
  l_85_2["dxcap.exe"] = "othermsbinaries"
  l_85_2["excel.exe"] = "othermsbinaries"
  l_85_2["fsi.exe"] = "othermsbinaries"
  l_85_2["fsianycpu.exe"] = "othermsbinaries"
  l_85_2["mftrace.exe"] = "othermsbinaries"
  l_85_2["microsoft.nodejstools.pressanykey.exe"] = "othermsbinaries"
  l_85_2["msaccess.exe"] = "othermsbinaries"
  l_85_2["msdeploy.exe"] = "othermsbinaries"
  l_85_2["msohtmed.exe"] = "othermsbinaries"
  l_85_2["mspub.exe"] = "othermsbinaries"
  l_85_2["msxsl.exe"] = "othermsbinaries"
  l_85_2["ntdsutil.exe"] = "othermsbinaries"
  l_85_2["openconsole.exe"] = "othermsbinaries"
  l_85_2["powerpnt.exe"] = "othermsbinaries"
  l_85_2["procdump.exe"] = "othermsbinaries"
  l_85_2["protocolhandler.exe"] = "othermsbinaries"
  l_85_2["rcsi.exe"] = "othermsbinaries"
  l_85_2["remote.exe"] = "othermsbinaries"
  l_85_2["sqldumper.exe"] = "othermsbinaries"
  l_85_2["sqlps.exe"] = "othermsbinaries"
  l_85_2["sqltoolsps.exe"] = "othermsbinaries"
  l_85_2["squirrel.exe"] = "othermsbinaries"
  l_85_2["te.exe"] = "othermsbinaries"
  l_85_2["teams.exe"] = "othermsbinaries"
  l_85_2["testwindowremoteagent.exe"] = "othermsbinaries"
  l_85_2["tracker.exe"] = "othermsbinaries"
  l_85_2["update.exe"] = "othermsbinaries"
  l_85_2["vsdiagnostics.exe"] = "othermsbinaries"
  l_85_2["vsiisexelauncher.exe"] = "othermsbinaries"
  l_85_2["visio.exe"] = "othermsbinaries"
  l_85_2["visualuiaverifynative.exe"] = "othermsbinaries"
  l_85_2["vslaunchbrowser.exe"] = "othermsbinaries"
  l_85_2["vshadow.exe"] = "othermsbinaries"
  l_85_2["vsjitdebugger.exe"] = "othermsbinaries"
  l_85_2["wfc.exe"] = "othermsbinaries"
  l_85_2["winproj.exe"] = "othermsbinaries"
  l_85_2["winword.exe"] = "othermsbinaries"
  l_85_2["wsl.exe"] = "othermsbinaries"
  l_85_2["devtunnel.exe"] = "othermsbinaries"
  l_85_2["vsls-agent.exe"] = "othermsbinaries"
  l_85_2["vstest.console.exe"] = "othermsbinaries"
  l_85_2["winfile.exe"] = "othermsbinaries"
  l_85_2["xsd.exe"] = "othermsbinaries"
  l_85_2["cl_loadassembly.ps1"] = "scripts"
  l_85_2["cl_mutexverifiers.ps1"] = "scripts"
  l_85_2["cl_invocation.ps1"] = "scripts"
  l_85_2["launch-vsdevshell.ps1"] = "scripts"
  l_85_2["manage-bde.wsf"] = "scripts"
  l_85_2["pubprn.vbs"] = "scripts"
  l_85_2["syncappvpublishingserver.vbs"] = "scripts"
  l_85_2["utilityfunctions.ps1"] = "scripts"
  l_85_2["winrm.vbs"] = "scripts"
  l_85_2["pester.bat"] = "scripts"
  local l_85_3 = l_85_2[l_85_0]
  if l_85_3 == nil then
    return false
  end
  if l_85_1 == nil then
    return true, l_85_3
  end
  l_85_1 = (string.lower)(l_85_1)
  if l_85_1 == l_85_3 then
    return true
  end
  return false
end

getOrgIdScrubbed = function()
  -- function num : 0_85
  local l_86_0 = (versioning.GetOrgID)()
  if l_86_0 ~= nil and #l_86_0 > 20 then
    return "PII_" .. (string.lower)(l_86_0)
  end
  return 
end

isDefenderPath = function(l_87_0)
  -- function num : 0_86
  if l_87_0 == nil then
    return 
  end
  local l_87_1 = normalize_path(l_87_0)
  if l_87_1 == nil then
    return 
  end
  l_87_1 = (string.lower)(l_87_1)
  do
    local l_87_2 = {}
    -- DECOMPILER ERROR at PC20: No list found for R2 , SetList fails

    -- DECOMPILER ERROR at PC21: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC22: Overwrote pending register: R4 in 'AssignReg'

    for l_87_6,l_87_7 in ("c:\\programdata\\microsoft\\windows defender")("c:\\program files\\windows defender") do
      if (string.find)(l_87_1, l_87_7, 1, true) then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

isFilenameInSideLoadIndicators = function(l_88_0)
  -- function num : 0_87
  if l_88_0 == nil or #l_88_0 <= 2 then
    return 
  end
  local l_88_1 = {}
  l_88_1["goopdate.dll"] = mp.INFECTED
  l_88_1["mpsvc.dll"] = mp.INFECTED
  l_88_1["mpclient.dll"] = mp.INFECTED
  l_88_1["mpgear.dll"] = mp.INFECTED
  l_88_1["iphlpapi.dll"] = mp.INFECTED
  l_88_1["libcef.dll"] = mp.INFECTED
  l_88_1["activeds.dll"] = mp.INFECTED
  l_88_1["qclite.dll"] = mp.INFECTED
  l_88_1["msimg32.dll"] = mp.INFECTED
  l_88_1["aclmgr.dll"] = mp.INFECTED
  l_88_1["rcdll.dll"] = mp.INFECTED
  l_88_1["iscsiexe.dll"] = mp.INFECTED
  l_88_1["iviewers.dll"] = mp.INFECTED
  l_88_1["mscoree.dll"] = mp.INFECTED
  l_88_1["version.dll"] = mp.INFECTED
  l_88_1["cryptsp.dll"] = mp.INFECTED
  l_88_1["msvcp140.dll"] = mp.INFECTED
  l_88_1["d3dx9_43.dll"] = mp.INFECTED
  l_88_1["atom.dll"] = mp.INFECTED
  l_88_1["foxsdku32w.dll"] = mp.INFECTED
  l_88_1["anydatarecoverysdk.dll"] = mp.INFECTED
  l_88_1["libiomp5md.dll"] = mp.INFECTED
  l_88_1["vcomp110.dll"] = mp.INFECTED
  l_88_1["cmdres.dll"] = mp.INFECTED
  l_88_1["vcl120.bpl"] = mp.INFECTED
  l_88_1["msedgeupdate.dll"] = mp.INFECTED
  l_88_1["msedge_elf.dll"] = mp.INFECTED
  l_88_1["chrome_elf.dll"] = mp.INFECTED
  l_88_1["midlrtmd.dll"] = mp.INFECTED
  l_88_1["duser.dll"] = mp.INFECTED
  l_88_1["dllsafecheck.dll"] = mp.INFECTED
  l_88_1["userenv.dll"] = mp.INFECTED
  l_88_1["k7sysmn1.dll"] = mp.INFECTED
  l_88_1["cryptbase.dll"] = mp.INFECTED
  l_88_1["ncrypt.dll"] = mp.INFECTED
  l_88_1["edputil.dll"] = mp.INFECTED
  l_88_1["dbgeng.dll"] = mp.INFECTED
  l_88_1["faultrep.dll"] = mp.INFECTED
  l_88_1["wsock32.dll"] = mp.INFECTED
  l_88_1["wintthp.dll"] = mp.INFECTED
  l_88_1["dismcore.dll"] = mp.INFECTED
  l_88_1["hccutils.dll"] = mp.INFECTED
  l_88_1["x32bridge.dll"] = mp.INFECTED
  l_88_1["wdsync.dll"] = mp.INFECTED
  l_88_1["wdlocal.dll"] = mp.INFECTED
  l_88_1["cnqmutil.dll"] = mp.INFECTED
  l_88_1["hd-common.dll"] = mp.INFECTED
  l_88_1["imobiehelper.dll"] = mp.INFECTED
  l_88_1["toolsbag.dll"] = mp.INFECTED
  l_88_1["mvvm.dll"] = mp.INFECTED
  l_88_1["textshaping.dll"] = mp.INFECTED
  l_88_1["mcvsocfg.dll"] = mp.INFECTED
  l_88_1["netapi32.dll"] = mp.INFECTED
  l_88_1["dsrole.dll"] = mp.INFECTED
  l_88_1["sspicli.dll"] = mp.INFECTED
  l_88_1["msftedit.dll"] = mp.INFECTED
  l_88_1["format.dll"] = mp.INFECTED
  l_88_1["webview2loader.dll"] = mp.INFECTED
  l_88_1["winmm.dll"] = mp.INFECTED
  l_88_1["brmod104.dll"] = mp.INFECTED
  l_88_1["facesdk.dll"] = mp.INFECTED
  l_88_1["dokan1.dll"] = mp.INFECTED
  l_88_1["vdfvm17.dll"] = mp.INFECTED
  l_88_1["dvusb.dll"] = mp.INFECTED
  l_88_1["drivespan.dll"] = mp.INFECTED
  l_88_1["gswdll32.dll"] = mp.INFECTED
  l_88_1["vivaldi_elf.dll"] = mp.INFECTED
  l_88_1["protectwow64.dll"] = mp.INFECTED
  l_88_1["ceiinfolog.dll"] = mp.INFECTED
  l_88_1["waveedit.dll"] = mp.INFECTED
  l_88_1["mpamedia.dll"] = mp.INFECTED
  l_88_1["coreclr.dll"] = mp.INFECTED
  l_88_1["scanimageui.dll"] = mp.INFECTED
  l_88_1["hpcustpartui.dll"] = mp.INFECTED
  l_88_1["vina-cav3.dll"] = mp.INFECTED
  l_88_1["mozglue.dll"] = mp.INFECTED
  l_88_1["ccl80u.dll"] = mp.INFECTED
  l_88_1["corefoundation.dll"] = mp.INFECTED
  l_88_1["wtsapi32.dll"] = mp.INFECTED
  l_88_1["ualapi.dll"] = mp.INFECTED
  l_88_1["propsys.dll"] = mp.INFECTED
  l_88_1["profapi.dll"] = mp.INFECTED
  l_88_1["winmde.dll"] = mp.INFECTED
  l_88_1["colorui.dll"] = mp.INFECTED
  l_88_1["dui70.dll"] = mp.INFECTED
  l_88_1["mi.dll"] = mp.INFECTED
  l_88_1["winhttp.dll"] = mp.INFECTED
  l_88_1["esent.dll"] = mp.INFECTED
  l_88_1["wbemcomm.dll"] = mp.INFECTED
  l_88_1["sxshared.dll"] = mp.INFECTED
  l_88_1["winsync.dll"] = mp.INFECTED
  l_88_1["ncobjapi.dll"] = mp.INFECTED
  l_88_1["wlbsctrl.dll"] = mp.INFECTED
  l_88_1["wmiclnt.dll"] = mp.INFECTED
  l_88_1["vcruntime140.dll"] = mp.INFECTED
  l_88_1["wwlib.dll"] = mp.INFECTED
  l_88_1["vgauth.dll"] = mp.INFECTED
  l_88_1["secur32.dll"] = mp.INFECTED
  l_88_1["hpqhvsei.dll"] = mp.INFECTED
  l_88_1["tosbtkbd.dll"] = mp.INFECTED
  l_88_1["delevator64.dll"] = mp.INFECTED
  l_88_1["vixdisklib.dll"] = mp.INFECTED
  l_88_1["sbiedll.dll"] = mp.INFECTED
  l_88_1["d3d8.dll"] = mp.INFECTED
  l_88_1["sensapi.dll"] = mp.INFECTED
  l_88_1["dxgi.dll"] = mp.INFECTED
  l_88_1["fszwd.dat"] = mp.INFECTED
  l_88_1["radcui.dll"] = mp.INFECTED
  l_88_1["nethost.dll"] = mp.INFECTED
  l_88_1["printui.dll"] = mp.INFECTED
  l_88_1["wscapi.dll"] = mp.INFECTED
  l_88_1["wininet.dll"] = mp.INFECTED
  l_88_1["clink_dll_x86.dll"] = mp.INFECTED
  l_88_1["ahni2t.dll"] = mp.INFECTED
  l_88_1["safestore64.dll"] = mp.INFECTED
  l_88_1["wchook.dkll"] = mp.INFECTED
  l_88_1["libcurl.dll"] = mp.INFECTED
  l_88_1["mspgimme.dll"] = mp.INFECTED
  l_88_1["oledlg.dll"] = mp.INFECTED
  l_88_1["systemsettings.dll"] = mp.INFECTED
  l_88_1["printdialog.dll"] = mp.INFECTED
  l_88_1["iumbase.dll"] = mp.INFECTED
  l_88_1["avcodec-61.dll"] = mp.INFECTED
  l_88_1["heif.dll"] = mp.INFECTED
  l_88_1["libde265.dll"] = mp.INFECTED
  l_88_1["xmllite.dll"] = mp.INFECTED
  l_88_1["uevmonitor.dll"] = mp.INFECTED
  l_88_1["cnmpaui.dll"] = mp.INFECTED
  l_88_1["sentinelagentcore.dll"] = mp.INFECTED
  l_88_1["log.dll"] = mp.INFECTED
  l_88_1["appvisvsubsystems64.dll"] = mp.INFECTED
  l_88_1["windowscodecs.dll"] = mp.INFECTED
  l_88_1["python310.dll"] = mp.INFECTED
  l_88_1["sqlite.dll"] = mp.LOWFI
  l_88_1["sqlite3.dll"] = mp.LOWFI
  l_88_1["glib-2.0.dll"] = mp.LOWFI
  l_88_1["crashrpt1403.dll"] = mp.LOWFI
  l_88_1["ffmpeg.dll"] = mp.LOWFI
  l_88_1["libvlc.dll"] = mp.LOWFI
  l_88_1["jli.dll"] = mp.LOWFI
  l_88_1["asus_wmi.dll"] = mp.LOWFI
  l_88_1["wptsextensions.dll"] = mp.LOWFI
  l_88_1["soldier.dll"] = mp.LOWFI
  return l_88_1[l_88_0]
end

isCommonScheduledTaskCommand = function(l_89_0)
  -- function num : 0_88
  if l_89_0 == nil or #l_89_0 <= 5 then
    return 
  end
  l_89_0 = (string.lower)(l_89_0)
  local l_89_1 = {}
  local l_89_2 = {}
  -- DECOMPILER ERROR at PC15: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R4 in 'AssignReg'

  l_89_1["C:\\Windows\\System32\\gpupdate.exe"], l_89_2 = l_89_2, {" /ua /installsource scheduler", " /c"}
  l_89_1["C:\\Windows\\System32\\taskhostw.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\wermgr.exe"], l_89_2 = l_89_2, {" -upload"}
  l_89_1["\\Google\\GoogleUpdater\\"], l_89_2 = l_89_2, {" --wake --system"}
  l_89_1["\\Microsoft Intune Management Extension\\ClientCertCheck.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\wsqmcons.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\appidcertstorecheck.exe"], l_89_2 = l_89_2, {}
  l_89_1["\\Common Files\\microsoft shared\\ClickToRun\\officesvcmgr.exe"], l_89_2 = l_89_2, {" /checkin"}
  l_89_1["C:\\Windows\\System32\\UsoClient.exe"], l_89_2 = l_89_2, {" ReportPolicies", " StartScan", " StartWork"}
  l_89_1["\\Common Files\\microsoft shared\\ClickToRun\\OfficeC2RClient.exe"], l_89_2 = l_89_2, {" /frequentupdate SCHEDULEDTASK ", " /WatchService"}
  l_89_1["\\Common Files\\Adobe\\ARM\\1.0\\AdobeARM.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\raserver.exe"], l_89_2 = l_89_2, {" /offerraupdate"}
  l_89_1["\\Microsoft Office\\root\\Office16\\SDXHelper.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\rundll32.exe"], l_89_2 = l_89_2, {" C:\\WINDOWS\\system32\\PcaSvc.dll,PcaPatchSdbTask", " C:\\WINDOWS\\system32\\Windows.StateRepositoryClient.dll,StateRepositoryDoMaintenanceTasks", " C:\\WINDOWS\\system32\\CapabilityAccessManager.dll,CapabilityAccessManagerDoStoreMaintenance", " Startupscan.dll,SusRunTask"}
  l_89_1["C:\\Windows\\System32\\dsregcmd.exe"], l_89_2 = l_89_2, {" $(Arg0) $(Arg1) $(Arg2)"}
  l_89_1["C:\\Windows\\System32\\AppHostRegistrationVerifier.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\sc.exe"], l_89_2 = l_89_2, {" start InventorySvc", " start pushtoinstall registration", " start w32time task_started", " start wuauserv", " start pushtoinstall login"}
  l_89_1["\\appdata\\local\\microsoft\\onedrive\\onedrivestandaloneupdater.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\UCPDMgr.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\DeviceCensus.exe"], l_89_2 = l_89_2, {" SystemCxt", " UserCxt"}
  l_89_1["C:\\Windows\\System32\\dstokenclean.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\appidpolicyconverter.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\DiskSnapshot.exe"], l_89_2 = l_89_2, {" -z"}
  l_89_1["C:\\Windows\\System32\\Speech_OneCore\\common\\SpeechModelDownload.exe"], l_89_2 = l_89_2, {}
  l_89_1["\\Windows Autopatch Client Broker\\ClientBroker\\ClientBroker.exe"], l_89_2 = l_89_2, {" poll"}
  l_89_1["C:\\Windows\\System32\\dmclient.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\ClipRenew.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\ProgramData\\Microsoft\\Windows Defender\\Platform\\"], l_89_2 = l_89_2, {" -IdleTask -TaskName WdVerification", " -IdleTask -TaskName WdCacheMaintenance", " -IdleTask -TaskName WdCleanup"}
  l_89_1["C:\\Windows\\System32\\UIEOrchestrator.exe"], l_89_2 = l_89_2, {" /SendHeartbeat"}
  l_89_1["C:\\Windows\\System32\\hvsievaluator.exe"], l_89_2 = l_89_2, {" CSP"}
  l_89_1["\\Microsoft Intune Management Extension\\ClientHealthEval.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\CCM\\CcmEval.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\cmd.exe"], l_89_2 = l_89_2, {"windowsdefenderatponboardingscript.cmd", "defenderatponboarding.cmd", "\\Utility\\GPODATA\\"}
  l_89_1["C:\\Windows\\System32\\cleanmgr.exe"], l_89_2 = l_89_2, {" /autocleanstoragesense /d C:"}
  l_89_1["\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX64\\Microsoft Shared\\Office16\\opushutil.exe"], l_89_2 = l_89_2, {" /pushregistration"}
  l_89_1["\\Microsoft OneDrive\\OneDriveStandaloneUpdater.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\Microsoft.Data.UsageAndQualityInsights.MaintenanceTask.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\MusNotification.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\lpremove.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\LocationNotificationWindows.exe"], l_89_2 = l_89_2, {}
  l_89_1["\\RUXIM\\PLUGScheduler.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\UCConfigTask.exe"], l_89_2 = l_89_2, {}
  l_89_1["C:\\Windows\\System32\\msfeedssync.exe"], l_89_2 = l_89_2, {" sync"}
  l_89_1["C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"], l_89_2 = l_89_2, {"\\Cloud\\DSREGCMD\' ; $DPath = $RPath.Replace(\'HKEY_LOCAL_MACHINE\',\'HKLM:\') ; Remove-Item -Path $DPath -Recurse -EA 0 ; $pattern = \' *[A-z]+ : [A-z0-9\\{\\}]+ *\' ; $dsregcmd = dsregcmd /status ", "\\Cloud\\Intune\' ; $DPath = $RPath.Replace(\'HKEY_LOCAL_MACHINE\',\'HKLM:\') ; Remove-ItemProperty -Path $DPath -Name \'*\' -EA 0 ; $QPath = \'HKLM:\\SOFTWARE\\Microsoft\\Enrollments\'"}
  l_89_1["C:\\Windows\\System32\\SrTasks.exe"], l_89_2 = l_89_2, {" ExecuteScheduledSPPCreation"}
  l_89_1["\\util\\ServiceExecution.exe"], l_89_2 = l_89_2, {"http://localhost/WebAPI/Utilities/support/DefenderDatUpdate"}
  l_89_1["C:\\Windows\\System32\\dxgiadaptercache.exe"], l_89_2 = l_89_2, {}
  l_89_1["\\Bin\\EpicHyperdriveTempDataCleanup.exe"], l_89_2 = l_89_2, {}
  l_89_1["\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX64\\Microsoft Shared\\Office16\\ActionsServer\\ActionsServer.exe"], l_89_2 = l_89_2, {" wacheck"}
  l_89_1["C:\\Windows\\System32\\CompatTelRunner.exe"], l_89_2 = l_89_2, {}
  l_89_1["\\ScheduleEventAction.exe"], l_89_2 = l_89_2, {" GenericMessagingAddin_Pulsation"}
  l_89_1["C:\\Windows\\System32\\provtool.exe"], l_89_2 = l_89_2, {"/turn 5 /source LogonIdleTask"}
  l_89_1["\\Thycotic\\Agents\\Agent\\TaskExecutor.exe"], l_89_2 = l_89_2, {" /ItemId:db9484d4-5488-4a63-98a1-368bd3b988e8 /DelayForMax:7200"}
  l_89_1["C:\\Windows\\System32\\wscript.exe"], l_89_2 = l_89_2, {"C:\\Windows\\Packagelogs\\AADBrokerPlugIn_Remediation\\"}
  l_89_1["\\ManageEngine\\UEMS_Agent\\bin\\dcagentupgrader.exe"], l_89_2 = l_89_2, {" Task"}
  l_89_2 = pairs
  l_89_2 = l_89_2(l_89_1)
  for l_89_6,i_2 in l_89_2 do
    if l_89_5 ~= nil and (string.find)(l_89_0, (string.lower)(l_89_5), 1, true) then
      if #l_89_6 == 0 then
        return true
      else
        for l_89_10,l_89_11 in ipairs(l_89_6) do
          if l_89_11 ~= nil and (string.find)(l_89_0, (string.lower)(l_89_11), 1, true) then
            return true
          end
        end
        return false
      end
    end
  end
  do return false end
  -- DECOMPILER ERROR at PC254: Confused about usage of register R2 for local variables in 'ReleaseLocals'

end

isCommonScheduledTaskFile = function(l_90_0)
  -- function num : 0_89
  if l_90_0 == nil or #l_90_0 <= 5 then
    return 
  end
  l_90_0 = (string.lower)(l_90_0)
  if StringEndsWith(l_90_0, "defenderatponboardingscript.cmd") or StringEndsWith(l_90_0, "defenderatponboarding.cmd") or StringEndsWith(l_90_0, "\\programdata\\airwatch\\cache\\disable_netbios.ps1") or StringEndsWith(l_90_0, "\\windows\\ise\\ise_add_profile.bat") or StringEndsWith(l_90_0, "\\temp\\clientcert.ps1") or StringEndsWith(l_90_0, "\\program files\\wpdf\\scripts\\tsuserex.dll") or StringEndsWith(l_90_0, "\\windows\\disable-usbhubsleep.ps1") or StringEndsWith(l_90_0, "\\windows\\logs\\defender-onboard-startupscript.ps1") or StringEndsWith(l_90_0, "\\vf\\vf-removechat.ps1") or StringEndsWith(l_90_0, "w11migration\\dot1svc.ps1") or StringEndsWith(l_90_0, "\\pcdiag_m365\\run.ps1") or StringEndsWith(l_90_0, "\\support\\utils\\session\\bat\\unlockevent.bat") or StringEndsWith(l_90_0, "\\yvapps\\unlock.bat") or StringEndsWith(l_90_0, "\\anima-scripts\\delete_logs.bat") or StringEndsWith(l_90_0, "\\package-deploy\\enabledefender.cmd") or StringEndsWith(l_90_0, "\\temp\\lansweeper\\install.cmd") or StringEndsWith(l_90_0, "\\it\\lockscreen\\lockscreen.ps1") or StringEndsWith(l_90_0, "\\wdf\\cfr.ps1") then
    return true
  end
  local l_90_1 = {}
  -- DECOMPILER ERROR at PC124: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC126: Overwrote pending register: R3 in 'AssignReg'

  for l_90_5,l_90_6 in ("windowsdefenderatponboardingpackage")("windowsdefenderatponboardingscript") do
    if (string.find)(l_90_0, l_90_6, 1, true) then
      return true
    end
  end
  do
    local l_90_7, l_90_8, l_90_9 = (string.match)(l_90_0, "([^\\]+)$") or l_90_0
    -- DECOMPILER ERROR at PC150: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC152: Confused about usage of register: R2 in 'UnsetPending'

    if l_90_7 == nil or #l_90_7 <= 4 then
      return 
    end
    local l_90_10 = nil
    if ({["ws1_health_utility.ps1"] = true, ["configmgrclienthealth.ps1"] = true, ["enable-hybridazureadscheduletasks.ps1"] = true, ["psappdeploytoolkit-executeasuser.vbs"] = true, ["mdm_dsmcheck.ps1"] = true, ["noahbu.cmd"] = true, ["pslogcleanup.ps1"] = true, ["uemslogcollector.exe"] = true, ["map-paw-share.ps1"] = true, ["deploy-osicfromgpo.ps1"] = true, ["configmgrclienthealth.exe"] = true, ["sccm_client_install_v2.4.ps1"] = true, ["lock.bat"] = true, ["rungpresultreport.vbs"] = true, ["bitsadmin_change_to_no_proxy.bat"] = true, ["devicecomplianceonboardingscript.cmd"] = true, ["smime_auto_installation.vbs"] = true, ["manage.dla.ps1"] = true, ["invoke-mdesetup.ps1"] = true, ["enable-bitlocker.ps1"] = true, ["backup-log_v0.33.ps1"] = true, ["migrate-client.cmd"] = true, ["zd_nimda_cockpit_pw.ps1"] = true, ["dnswinsconfig.exe"] = true, ["setmcafeecustomprops.ps1"] = true, ["enableinheritance_final.ps1"] = true, ["vf-wdatp_registry.xml"] = true, ["windowsdefenderatponboardingscript.cmd"] = true, ["runtoasthidden.cmd"] = true, ["citrixvda_modreg.bat"] = true, ["win32agentipc.exe"] = true, ["set-ahcbitlockersequence.ps1"] = true, ["wudu.vbs"] = true, ["sccmclienteval_new.ps1"] = true, ["outlooksmime.vbs"] = true, ["get-newteamsversion.ps1"] = true, ["java_deployment.ps1"] = true, ["pxs_bvalidation.ps1"] = true, ["saverecoverykey.ps1"] = true, ["check-gpo.ps1"] = true, ["lockevent.bat"] = true, ["gporunpsscriptsilent.vbs"] = true, ["removelocalprofiles.ps1"] = true, ["configmgrstartup.vbs"] = true, ["clean-usertemp.ps1"] = true, ["ubsremoteassistendtasks.ps1"] = true, ["rac.exe"] = true, ["firstlaunch_teams.ps1"] = true, ["cer_automation.bat"] = true, ["launchdeployapps.vbs"] = true, ["intunescript-imageinformation-user.ps1"] = true, ["configupdater.ps1"] = true, ["addskypemeetingsplugintofirewall.ps1"] = true, ["users_fw.ps1"] = true, ["get-usersession-logoff-old-v1.ps1"] = true, ["user_logging_final.ps1"] = true, ["optumscriptswitchupdate.bat"] = true, ["reboot_check_updated.ps1"] = true, ["pcm-ucheck.ps1"] = true, ["remove-intunecurrentenrollment.ps1"] = true, ["browsercacheremoval.bat"] = true, ["workstationmanager-privilegerevocation.ps1"] = true, ["discovery-windows.exe"] = true, ["chama_ps1_configpatch.vbs"] = true, ["wudu_rollback.vbs"] = true, ["mugshotv2.bat"] = true, ["802.1x_authentication_settings.xml"] = true, ["docusnapscript-run.ps1"] = true, ["auditposte.exe"] = true, ["launchpsscript.vbs"] = true, ["itunes_stop.vbs"] = true, ["updatecertificat.ps1"] = true, ["windowsdefenderatplocalonboardingscript.cmd"] = true, ["n5start.ps1"] = true, ["winget-upgrade.ps1"] = true, ["dateprofile.ps1"] = true, ["setwin10smoptions.cmd"] = true, ["qualyscloudagentinstallation.bat"] = true, ["deployirtk.cmd"] = true, ["helios_it_zd_inventarisierung_ocs.ps1"] = true, ["monitor-nexthinkservice.ps1"] = true, ["readingrjpolicy.ps1"] = true, ["mdm_edgeupdatehelper.ps1"] = true, ["unlockevent.bat"] = true, ["corporatebranding.bat"] = true, ["vf-mde-enable.ps1"] = true, ["migrate-user.vbs"] = true, ["iemode_update.bat"] = true, ["configmgrstartup_schedtask.wsf"] = true, ["uploadappjson.ps1"] = true, ["ecm-nl-live.js"] = true, ["1096notify.ps1"] = true, ["idleuserlogoff-8hours.ps1"] = true, ["zscaler_audit.ps1"] = true, ["disable-windowsfirewalllocalsmbrules.ps1"] = true, ["update_win_features.bat"] = true, ["chrome_bku_install.exe"] = true, ["lockscreensaver.exe"] = true, ["hivenightmarefix.ps1"] = true, ["automatic_pagefile_tuning.ps1"] = true, ["xmlchecker.ps1"] = true, ["cleanup.ps1"] = true, ["lockscreenbranding.ps1"] = true, ["print_disable.bat"] = true, ["sp_poshacme_renewal.ps1"] = true, ["healthcheckmdatp.ps1"] = true, ["delprof_adm.log"] = true, ["526-get-mcgtcpconnections.ps1"] = true, ["createczlocadmin.ps1"] = true, ["karmakvpnping.cmd"] = true, ["configbackgroundsync.ps1"] = true, ["push-ordrepattributes.ps1"] = true, ["mbamcheckstatus.vbs"] = true, ["get_csv_certificate.vbs"] = true, ["scheduleclientshutdowncommand.ps1"] = true, ["wwan_info_to_reg.ps1"] = true, ["removelocalwinrm.ps1"] = true, ["casvc-install.exe"] = true, ["checkmecm.bat"] = true, ["clear-printerdefaults.vbs"] = true, ["rebootlogging.ps1"] = true, ["nettoyagearchiveslogsec.ps1"] = true, ["wfdv_printers_local.vbs"] = true, ["alwaysonvpn_device.ps1"] = true, ["hwinventory.ps1"] = true, ["appdatafirewallrules.ps1"] = true, ["eyextensioninstallforcelist.exe"] = true, ["chrome_bku_tray.exe"] = true, ["sp_removejob.cmd"] = true, ["startupevent.bat"] = true, ["installskysea.vbe"] = true, ["skyseasetup.bat"] = true, ["AuditCopyCATsForAppVapps-ng.ps1"] = true, ["QuickAssistRemoval.ps1"] = true, ["java8uninstall.ps1"] = true, ["dsregcmd-leave.log"] = true, ["getPcInfo.ps1"] = true, ["prelude_fake_disk_mount.txt"] = true, ["eyofficetargetedsettings.exe"] = true, ["sp_audit_poshacme_certs_v2.ps1"] = true, ["auditcopycatsforappvapps-ng.ps1"] = true, ["quickassistremoval.ps1"] = true, ["acrlogin.log"] = true, ["set-script.ps1"] = true, ["random_reboot.ps1"] = true, ["wfdv_meditech_local.vbs"] = true, ["setpermissions.cmd"] = true, ["print_enable.bat"] = true, ["onboarding.bat"] = true, ["disable_netbios.ps1"] = true, ["uninstall_solarwinds_client_components.ps1"] = true, ["defaultimappregistrysettings.ps1"] = true, ["runhidden.vbs"] = true, ["pulizia.bat"] = true, ["qaw.proxcardcredprov.log"] = true, ["!!flash-uninstall-anddeletefiles.bat"] = true, ["backrunarg.vbs"] = true, ["controlproxy.ps1"] = true, ["pcut_upgrade.ps1"] = true, ["gp.vbs"] = true, ["audio_driver_remove.bat"] = true, ["eas delete.ps1"] = true, ["rebootwithdelay.vbs"] = true, ["sophoscentral-disinstalla-agent.ps1"] = true, ["checknetworkandteams_dnsdomain.ps1"] = true, ["disableflightmode.ps1"] = true, ["cpdloginscript.bat"] = true, ["dash-file-dist_bootstrapper.ps1"] = true, ["loghealthcentrally.ps1"] = true, ["retail-biosmanagement.ps1"] = true, ["bitlocker-enrollment.cmd"] = true, ["ciphersuite.ps1"] = true, ["onboard-device.cmd"] = true, ["set-disabledomaincreds.ps1"] = true, ["mdeonboardingwin10-11.cmd"] = true, ["exsynclauncher.vbs"] = true, ["windows-os-mmg_services_hostfile_update.bat"] = true, ["registerdns.ps1"] = true, ["cyberhavenmanager.exe"] = true, ["heartbeat.vbs"] = true, ["flex_sched_runinventory.bat"] = true, ["installagentscript.vbs"] = true, ["launchedgechromels.vbs"] = true, ["kiosk_reboot.vbs"] = true, ["sccm_metered_fix.ps1"] = true, ["desktop.ini"] = true, ["appxpackage_removal.vbs"] = true, ["gpo-scheduledtask-islhd-filesync.bat"] = true, ["fixunquotedserviceuninstall.ps1"] = true, ["invoke-setdevicetimestamp.ps1"] = true, ["deploymma2019.cmd"] = true, ["print_delete.bat"] = true, ["deleteprofiles-90days.ps1"] = true, ["loginreporttosql.exe"] = true, ["autosetup.vbe"] = true, ["mappadischi.vbs"] = true, ["set-processmitigation.ps1"] = true, ["cra_wifi_ecaw.cmd"] = true, ["windowsdefenderatp-gpo-onboarding.cmd"] = true, ["onedrivepcmover_scheduledtask.vbs"] = true, ["sendteamslogs.ps1"] = true, ["analyze-my-home-drive.vbs"] = true, ["install-eduroam-wlan-profile-8021xteapauthcheck.ps1"] = true, ["checkreboot.ps1"] = true, ["report.vbs"] = true, ["logonalert_win11.vbs"] = true, ["hide-console.vbs"] = true, ["regcmdstarthidden.exe"] = true, ["mappadischi.exe"] = true, ["karmakfusionbranchserver.ps1"] = true, ["delete_old_archived_winevent_logs.ps1"] = true, ["rem_everyone.ps1"] = true, ["selfscan.exe"] = true, ["updatewlapps-system.ps1"] = true})[l_90_10] ~= nil then
      return true
    end
    return false
  end
end

getCommandLineType = function(l_91_0)
  -- function num : 0_90
  if not l_91_0 or #l_91_0 <= 3 then
    return nil, nil
  end
  local l_91_1 = l_91_0:lower()
  local l_91_2 = {}
  local l_91_3 = {}
  l_91_3.key = "node.exe"
  l_91_3.type = "nodejs"
  l_91_3.gentype = "script"
  local l_91_4 = {}
  l_91_4.key = "node "
  l_91_4.type = "nodejs"
  l_91_4.gentype = "script"
  local l_91_5 = {}
  l_91_5.key = "wscript"
  l_91_5.type = "wsh"
  l_91_5.gentype = "script"
  local l_91_6 = {}
  l_91_6.key = "cscript"
  l_91_6.type = "wsh"
  l_91_6.gentype = "script"
  local l_91_7 = {}
  l_91_7.key = "mshta"
  l_91_7.type = "mshta"
  l_91_7.gentype = "script"
  local l_91_8 = {}
  l_91_8.key = "python.exe"
  l_91_8.type = "python"
  l_91_8.gentype = "script"
  local l_91_9 = {}
  l_91_9.key = "python "
  l_91_9.type = "python"
  l_91_9.gentype = "script"
  local l_91_10 = {}
  l_91_10.key = "java.exe"
  l_91_10.type = "java"
  l_91_10.gentype = "script"
  local l_91_11 = {}
  l_91_11.key = "java "
  l_91_11.type = "java"
  l_91_11.gentype = "script"
  local l_91_12 = {}
  l_91_12.key = "rundll32"
  l_91_12.type = "rundll32"
  l_91_12.gentype = "dll_loader"
  local l_91_13 = {}
  l_91_13.key = "regsvr32"
  l_91_13.type = "regsvr32"
  l_91_13.gentype = "dll_loader"
  local l_91_14 = {}
  l_91_14.key = "curl"
  l_91_14.type = "curl"
  l_91_14.gentype = "downloader"
  local l_91_15 = {}
  l_91_15.key = "wget"
  l_91_15.type = "wget"
  l_91_15.gentype = "downloader"
  local l_91_16 = {}
  l_91_16.key = "certutil"
  l_91_16.type = "certutil"
  l_91_16.gentype = "downloader"
  local l_91_17 = {}
  l_91_17.key = "msiexec"
  l_91_17.type = "msi"
  l_91_17.gentype = "script"
  local l_91_18 = {}
  l_91_18.key = "powershell_ise"
  l_91_18.type = "powershell"
  l_91_18.gentype = "script"
  local l_91_19 = {}
  l_91_19.key = "pwsh"
  l_91_19.type = "powershell"
  l_91_19.gentype = "script"
  local l_91_20 = {}
  l_91_20.key = "powershell"
  l_91_20.type = "powershell"
  l_91_20.gentype = "script"
  local l_91_21 = {}
  l_91_21.key = "wmic"
  l_91_21.type = "wmic"
  l_91_21.gentype = "wmi"
  local l_91_22 = {}
  l_91_22.key = "cmd.exe"
  l_91_22.type = "cmd"
  l_91_22.gentype = "shell"
  do
    local l_91_23 = {}
    l_91_23.key = "cmd "
    l_91_23.type = "cmd"
    l_91_23.gentype = "shell"
    -- DECOMPILER ERROR at PC94: No list found for R2 , SetList fails

    l_91_3 = 1
    l_91_4 = #l_91_2
    l_91_5 = 1
    for l_91_6 = l_91_3, l_91_4, l_91_5 do
      l_91_7 = l_91_2[l_91_6]
      l_91_8, l_91_9 = l_91_1:find, l_91_1
      l_91_10 = l_91_7.key
      l_91_11 = 1
      l_91_12 = true
      l_91_8 = l_91_8(l_91_9, l_91_10, l_91_11, l_91_12)
      if l_91_8 then
        l_91_8 = l_91_7.type
        l_91_9 = l_91_7.gentype
        return l_91_8, l_91_9
      end
    end
    do return nil, nil end
    -- DECOMPILER ERROR at PC113: Confused about usage of register R6 for local variables in 'ReleaseLocals'

  end
end


