-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\TechniqueTracker\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2, l_1_3 = IsTacticObservedGlobal(l_1_0, true)
  do
    if l_1_2 then
      local l_1_4, l_1_5 = tonumber(l_1_3) + 1
    end
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R4 in 'UnsetPending'

    AppendToRollingQueue("gTacticsTable", l_1_0, l_1_4, l_1_1, 100, 1)
  end
end

local l_0_1 = function()
  -- function num : 0_1
  local l_2_0, l_2_1 = pcall(MpCommon.RollingQueueCount, "gTechniquesTable")
  if l_2_0 and l_2_1 ~= nil then
    return l_2_1
  end
  return 0
end

local l_0_2 = function()
  -- function num : 0_2
  local l_3_0, l_3_1 = pcall(MpCommon.RollingQueueCount, "gTacticsTable")
  if l_3_0 and l_3_1 ~= nil then
    return l_3_1
  end
  return 0
end

local l_0_3 = function(l_4_0)
  -- function num : 0_3
  if l_4_0 == nil then
    return nil
  end
  local l_4_1 = nil
  local l_4_2 = l_4_0:lower()
  if l_4_2 == "cmdhstr" then
    l_4_1 = (mp.GetScannedPPID)()
  else
    if l_4_2 == "bm" then
      local l_4_3, l_4_4 = pcall(bm.get_current_process_startup_info)
      if l_4_3 and l_4_4 ~= nil then
        l_4_1 = l_4_4.ppid
      end
    else
      do
        if l_4_2 == "amsi" then
          local l_4_5, l_4_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
          if l_4_5 and l_4_6 ~= nil then
            l_4_1 = l_4_6
          end
        else
          do
            do
              if l_4_2 == "rtp" then
                local l_4_7, l_4_8 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESS_ID)
                if l_4_7 and l_4_8 ~= nil then
                  l_4_1 = l_4_8
                end
              end
              return l_4_1
            end
          end
        end
      end
    end
  end
end

local l_0_4 = function(l_5_0)
  -- function num : 0_4
  if l_5_0 == nil or type(l_5_0) ~= "string" or #l_5_0 <= 0 then
    return 
  end
  local l_5_1 = (string.lower)((string.format)("0x%02X_0x%02X", (mp.crc32)(-1, l_5_0, 1, #l_5_0), tostring(#l_5_0)))
  if l_5_1 == nil or #l_5_1 <= 10 then
    return 
  end
  return l_5_1
end

local l_0_5 = function(l_6_0, l_6_1, l_6_2)
  -- function num : 0_5
  if l_6_0 == nil or l_6_0 == "" or l_6_1 == nil or l_6_1 == "" then
    return false, nil
  end
  l_6_0 = GetRealPidForScenario(l_6_0)
  if not l_6_2 then
    l_6_2 = false
  end
  local l_6_3 = IsKeyInRollingQueue
  local l_6_4 = "InheritedTech-" .. l_6_0
  local l_6_5 = l_6_1
  do
    local l_6_6 = l_6_2
    do return l_6_3(l_6_4, l_6_5, l_6_6) end
    -- DECOMPILER ERROR at PC26: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

local l_0_6 = function(l_7_0, l_7_1, l_7_2)
  -- function num : 0_6
  if l_7_0 == nil or l_7_0 == "" or l_7_1 == nil or l_7_1 == "" then
    return false, nil
  end
  l_7_0 = GetRealPidForScenario(l_7_0)
  if not l_7_2 then
    l_7_2 = false
  end
  local l_7_3 = IsKeyInRollingQueue
  local l_7_4 = "InheritedTact-" .. l_7_0
  local l_7_5 = l_7_1
  do
    local l_7_6 = l_7_2
    do return l_7_3(l_7_4, l_7_5, l_7_6) end
    -- DECOMPILER ERROR at PC26: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

local l_0_7 = function(l_8_0, l_8_1, l_8_2, l_8_3)
  -- function num : 0_7
  local l_8_4 = function(l_9_0)
    -- function num : 0_7_0
    if l_9_0 == nil or #l_9_0 <= 3 then
      return 
    end
    local l_9_1 = (string.lower)(l_9_0)
    local l_9_2 = "bm_m"
    if (string.sub)(l_9_1, 1, 1) == "t" then
      return l_9_0
    else
      if (string.sub)(l_9_1, 1, #l_9_2) == l_9_2 then
        local l_9_3 = string.sub
        local l_9_4 = l_9_0
        local l_9_5 = #l_9_2 + 1
        do
          local l_9_6 = #l_9_0
          do return l_9_3(l_9_4, l_9_5, l_9_6) end
          -- DECOMPILER ERROR at PC37: Confused about usage of register R4 for local variables in 'ReleaseLocals'

          do return  end
          -- DECOMPILER ERROR at PC38: Confused about usage of register R3 for local variables in 'ReleaseLocals'

        end
      end
    end
  end

  if l_8_0 == nil or type(l_8_0) ~= "string" or #l_8_0 <= 1 or l_8_1 == nil then
    return 
  end
  if l_8_2 == nil then
    l_8_2 = 0
  end
  local l_8_5 = "CommandLineCustomHash"
  if l_8_3 ~= nil then
    l_8_5 = l_8_3
  end
  local l_8_6 = getCustomStringHash(l_8_0)
  if l_8_6 == nil then
    return 
  end
  local l_8_7 = l_8_5 .. ":" .. l_8_6
  local l_8_8 = false
  if type(l_8_1) == "string" then
    local l_8_9 = l_8_4(l_8_1)
    if l_8_9 ~= nil then
      (MpCommon.AppendPersistContextNoPath)(l_8_7, l_8_9, l_8_2)
      l_8_8 = true
    end
  else
    do
      if type(l_8_1) == "table" then
        for l_8_13,l_8_14 in ipairs(l_8_1) do
          local l_8_15 = l_8_4(l_8_14)
          if l_8_15 ~= nil then
            (MpCommon.AppendPersistContextNoPath)(l_8_7, l_8_15, l_8_2)
            l_8_8 = true
          end
        end
      end
      do
        return l_8_8
      end
    end
  end
end

local l_0_8 = function(l_9_0)
  -- function num : 0_8
  if l_9_0 == nil or #l_9_0 <= 1 then
    return 
  end
  local l_9_1 = {}
  l_9_1.cmd = "%windir%\\system32\\cmd.exe"
  l_9_1.powershell = "%windir%\\system32\\windowspowershell\\v1.0\\powershell.exe"
  l_9_1.wscript = "%windir%\\system32\\wscript.exe"
  l_9_1.cscript = "%windir%\\system32\\cscript.exe"
  l_9_1.mshta = "%windir%\\system32\\mshta.exe"
  l_9_1.wmic = "%windir%\\system32\\wbem\\wmic.exe"
  l_9_1.bitsadmin = "%windir%\\system32\\bitsadmin.exe"
  l_9_1.rundll32 = "%windir%\\system32\\rundll32.exe"
  l_9_1.svchost = "%windir%\\system32\\svchost.exe"
  l_9_1.services = "%windir%\\system32\\services.exe"
  l_9_1.reg = "%windir%\\system32\\reg.exe"
  l_9_1.regsvr32 = "%windir%\\system32\\regsvr32.exe"
  l_9_1.regedit = "%windir%\\regedit.exe"
  l_9_1.schtasks = "%windir%\\system32\\schtasks.exe"
  l_9_1["%comspec%"] = "%windir%\\system32\\cmd.exe"
  if #l_9_0 > 4 and (string.sub)(l_9_0, -4) == ".exe" then
    l_9_0 = (string.sub)(l_9_0, 1, #l_9_0 - 4)
  end
  l_9_0 = (string.lower)(l_9_0)
  local l_9_2 = l_9_1[l_9_0]
  if l_9_2 ~= nil then
    l_9_2 = (mp.ContextualExpandEnvironmentVariables)(l_9_2)
  end
  return l_9_2
end

local l_0_9 = function(l_10_0, l_10_1)
  -- function num : 0_9
  if l_10_0 == nil then
    return 
  end
  local l_10_2 = "CommandLineCustomHash"
  if l_10_1 ~= nil then
    l_10_2 = l_10_1
  end
  local l_10_3 = getCustomStringHash(l_10_0)
  if l_10_3 == nil then
    return 
  end
  local l_10_4 = l_10_2 .. ":" .. l_10_3
  if (MpCommon.GetPersistContextCountNoPath)(l_10_4) >= 1 then
    local l_10_5 = MpCommon.GetPersistContextNoPath
    local l_10_6 = l_10_4
    do return l_10_5(l_10_6) end
    -- DECOMPILER ERROR at PC28: Confused about usage of register R6 for local variables in 'ReleaseLocals'

  end
  do return  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register R5 for local variables in 'ReleaseLocals'

end

local l_0_15 = function(l_11_0, l_11_1, l_11_2, l_11_3)
  -- function num : 0_10 , upvalues : l_0_5
  if l_11_0 == nil or l_11_0 == "" or l_11_1 == nil or l_11_1 == "" or l_11_2 == nil or l_11_2 == "" then
    return 
  end
  if not l_11_3 then
    l_11_3 = 3600
  end
  l_11_0 = GetRealPidForScenario(l_11_0)
  local l_11_4, l_11_5 = l_0_5(l_11_0, l_11_2)
  if l_11_4 then
    l_11_5 = l_11_5 .. "," .. l_11_1
  else
    l_11_5 = l_11_1
  end
  AppendToRollingQueue("InheritedTech-" .. l_11_0, l_11_2, l_11_5, l_11_3)
end

local l_0_16 = function(l_12_0, l_12_1, l_12_2, l_12_3)
  -- function num : 0_11 , upvalues : l_0_6
  if l_12_0 == nil or l_12_0 == "" or l_12_1 == nil or l_12_1 == "" or l_12_2 == nil or l_12_2 == "" then
    return 
  end
  if not l_12_3 then
    l_12_3 = 3600
  end
  l_12_0 = GetRealPidForScenario(l_12_0)
  local l_12_4, l_12_5 = l_0_6(l_12_0, l_12_2)
  if l_12_4 then
    l_12_5 = l_12_5 .. "," .. l_12_1
  else
    l_12_5 = l_12_1
  end
  AppendToRollingQueue("InheritedTact-" .. l_12_0, l_12_2, l_12_5, l_12_3)
end

local l_0_17 = function(l_13_0)
  -- function num : 0_12 , upvalues : l_0_8
  if l_13_0 == nil or #l_13_0 <= 4 or (string.sub)(l_13_0, 1, 2) == "\\\\" or (string.sub)(l_13_0, 2, 3) == ":\\" or (string.find)(l_13_0, " ", 1, true) == nil then
    return l_13_0, false
  end
  local l_13_1 = (string.match)(l_13_0, "^(.-)%s")
  if l_13_1 == nil then
    return l_13_0, false
  end
  local l_13_2 = l_0_8(l_13_1)
  if l_13_2 == nil then
    return l_13_0, false
  end
  local l_13_3 = l_13_2 .. (string.sub)(l_13_0, #l_13_1 + 1, #l_13_0)
  return l_13_3, true
end

local l_0_18 = function(l_14_0, l_14_1, l_14_2, l_14_3, l_14_4, l_14_5)
  -- function num : 0_13 , upvalues : l_0_10, l_0_13
  if type(l_14_2) ~= "number" or l_14_2 <= 0 or l_14_2 > 15 or l_14_0 == nil or l_14_0 == "" or l_14_1 == nil or l_14_1 == "" or l_14_3 ~= nil and type(l_14_3) ~= "table" then
    return 
  end
  if l_14_5 == nil then
    l_14_5 = l_14_0
  end
  local l_14_6 = (mp.GetParentProcInfo)(l_14_0)
  if l_14_6 == nil or l_14_6.image_path == nil then
    return 
  end
  if l_14_3 ~= nil then
    for l_14_10,l_14_11 in ipairs(l_14_3) do
      if (string.find)(l_14_6.image_path, l_14_11, 1, true) then
        return 
      end
    end
  end
  do
    l_0_10(l_14_6.ppid, l_14_5, l_14_1, l_14_4)
    l_0_13(l_14_6.ppid, l_14_1, l_14_2 - 1, l_14_3, l_14_4, l_14_5)
  end
end

do
  local l_0_19 = function(l_15_0, l_15_1, l_15_2, l_15_3, l_15_4, l_15_5)
  -- function num : 0_14 , upvalues : l_0_11, l_0_14
  if type(l_15_2) ~= "number" or l_15_2 <= 0 or l_15_2 > 15 or l_15_0 == nil or l_15_0 == "" or l_15_1 == nil or l_15_1 == "" or l_15_3 ~= nil and type(l_15_3) ~= "table" then
    return 
  end
  if l_15_5 == nil then
    l_15_5 = l_15_0
  end
  local l_15_6 = (mp.GetParentProcInfo)(l_15_0)
  if l_15_6 == nil or l_15_6.image_path == nil then
    return 
  end
  if l_15_3 ~= nil then
    for l_15_10,l_15_11 in ipairs(l_15_3) do
      if (string.find)(l_15_6.image_path, l_15_11, 1, true) then
        return 
      end
    end
  end
  do
    l_0_11(l_15_6.ppid, l_15_5, l_15_1, l_15_4)
    l_0_14(l_15_6.ppid, l_15_1, l_15_2 - 1, l_15_3, l_15_4, l_15_5)
  end
end

  -- DECOMPILER ERROR at PC185: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

