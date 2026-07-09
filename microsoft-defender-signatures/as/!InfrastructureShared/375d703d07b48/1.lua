-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\375d703d07b48\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if #l_0_1 < 50 or #l_0_1 > 450 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 == nil or l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if not (string.find)(l_0_3, "\\explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_4 = GetRollingQueueKeys("IsClickFixCMD")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil or l_1_0 == "" then
    return ""
  end
  l_1_0 = (string.gsub)(l_1_0, "%^", "")
  local l_1_1, l_1_2 = pcall(mp.ContextualExpandEnvironmentVariables, l_1_0)
  if l_1_1 and type(l_1_2) == "string" and l_1_2 ~= "" then
    l_1_0 = l_1_2
  end
  local l_1_3 = string.lower
  local l_1_4 = l_1_0
  do return l_1_3(l_1_4) end
  -- DECOMPILER ERROR at PC33: Confused about usage of register R4 for local variables in 'ReleaseLocals'

end

local l_0_6 = function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end

local l_0_7 = l_0_6(l_0_1)
if l_0_7 == nil or #l_0_7 < 2 then
  return mp.CLEAN
end
local l_0_8 = l_0_5(l_0_1)
do
  if not l_0_6(l_0_8) then
    local l_0_9 = {}
  end
  local l_0_10 = nil
  local l_0_11 = function(l_3_0, l_3_1)
  -- function num : 0_2
  if l_3_0 == nil or l_3_1 == nil or #l_3_0 < 2 or #l_3_0 ~= #l_3_1 then
    return false
  end
  for l_3_5 = 2, #l_3_0 do
    if (string.lower)(l_3_0[l_3_5]) ~= (string.lower)(l_3_1[l_3_5]) then
      return false
    end
  end
  return true
end

  for l_0_15,l_0_16 in ipairs(l_0_4) do
    local l_0_12 = function(l_4_0)
  -- function num : 0_3
  local l_4_1, l_4_7, l_4_8, l_4_9, l_4_10 = nil
  for l_4_5 = 2, #l_4_0 do
    local l_4_2, l_4_14 = nil
    l_4_14 = l_4_0[l_4_13]
    local l_4_6, l_4_15 = nil
    if l_4_14 ~= nil then
      if l_4_2 ~= nil then
        l_4_6 = string
        l_4_6 = l_4_6.len
        l_4_15 = l_4_14
        l_4_6 = l_4_6(l_4_15)
        local l_4_16 = nil
        l_4_15 = string
        l_4_15 = l_4_15.len
        l_4_16 = l_4_2
        local l_4_18 = nil
        l_4_15 = l_4_15(l_4_16)
        local l_4_17 = nil
      end
      if l_4_15 < l_4_6 then
        l_4_2 = l_4_14
      end
    end
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  if l_4_2 ~= nil and (string.len)(l_4_2) >= 20 then
    local l_4_11 = nil
    local l_4_12 = nil
    return (string.lower)(l_4_2)
  end
  do
    do return nil end
    -- DECOMPILER ERROR at PC36: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

    -- DECOMPILER ERROR at PC99: Confused about usage of register: R16 in 'UnsetPending'

    if type(R16_PC99) == "string" and R16_PC99 ~= "" then
      if l_0_11(l_0_6(R16_PC99), l_0_7) then
        return mp.INFECTED
      end
      if l_0_11(l_0_6(l_0_5(R16_PC99)), l_0_10) then
        return mp.INFECTED
      end
      if l_0_6(l_0_5(R16_PC99)) ~= nil then
        local l_0_18 = nil
        if l_0_12(l_0_6(l_0_5(R16_PC99))) ~= nil and (string.find)(l_0_8, l_0_12(l_0_6(l_0_5(R16_PC99))), 1, true) then
          return mp.INFECTED
        end
      end
    end
  end
  return mp.CLEAN
end

