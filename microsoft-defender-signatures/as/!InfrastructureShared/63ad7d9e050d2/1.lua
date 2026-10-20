-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\63ad7d9e050d2\1.luac 

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
if (MpCommon.IsSampled)(100, true, true, true) == false and (#l_0_1 < 16 or #l_0_1 > 450) then
  return mp.CLEAN
end
local l_0_5 = nil
if (mp.GetParentProcInfo)() == nil or ((mp.GetParentProcInfo)()).image_path == nil then
  return mp.CLEAN
end
local l_0_6 = nil
local l_0_7 = nil
if (string.match)((string.lower)(((mp.GetParentProcInfo)()).image_path), "([^\\]+)$") ~= "explorer.exe" and (string.match)((string.lower)(((mp.GetParentProcInfo)()).image_path), "([^\\]+)$") ~= "windowsterminal.exe" and (string.match)((string.lower)(((mp.GetParentProcInfo)()).image_path), "([^\\]+)$") ~= "wt.exe" then
  return mp.CLEAN
end
local l_0_8 = nil
if GetRollingQueueKeys("IsClickFixCMD_Malicious") == nil then
  return mp.CLEAN
end
local l_0_9 = nil
local l_0_10 = function(l_1_0)
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

local l_0_11 = nil
if (function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end
)(l_0_1) == nil or #(function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end
)(l_0_1) < 2 then
  return mp.CLEAN
end
do
  if l_0_5 and #l_0_1 < 50 then
    local l_0_12 = nil
    -- DECOMPILER ERROR at PC124: Unhandled construct in 'MakeBoolean' P3

    if ((string.match)(((function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end
)(l_0_1))[1], "[^\\/]+$") ~= "mshta.exe" and (string.match)(((function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end
)(l_0_1))[1], "[^\\/]+$") ~= "mshta") or not (string.match)(l_0_12[2], "^https?://[^/\\%s?#]") then
      return mp.CLEAN
    end
  end
  local l_0_13 = nil
  do
    if not l_0_11(l_0_10(l_0_1)) then
      local l_0_14 = nil
    end
    local l_0_15 = nil
    do
      local l_0_16 = {}
      for l_0_20,l_0_21 in ipairs(l_0_9) do
        local l_0_17, l_0_18 = function(l_3_0, l_3_1)
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
, function(l_4_0)
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

        -- DECOMPILER ERROR at PC141: Confused about usage of register: R18 in 'UnsetPending'

        if type(R18_PC141) == "string" and R18_PC141 ~= "" then
          if l_0_17(l_0_11(R18_PC141), l_0_13) then
            if GetRollingQueueKeyValue("IsClickFixCMD_Malicious", R18_PC141) then
              (mp.set_mpattribute)("MpInternal_researchdata=WCS=" .. tostring(GetRollingQueueKeyValue("IsClickFixCMD_Malicious", R18_PC141)))
            end
            return mp.INFECTED
          end
          if l_0_17(l_0_11(l_0_10(R18_PC141)), l_0_16) then
            if GetRollingQueueKeyValue("IsClickFixCMD_Malicious", R18_PC141) then
              (mp.set_mpattribute)("MpInternal_researchdata=WCS=" .. tostring(GetRollingQueueKeyValue("IsClickFixCMD_Malicious", R18_PC141)))
            end
            return mp.INFECTED
          end
          if l_0_11(l_0_10(R18_PC141)) ~= nil then
            local l_0_24 = nil
            if l_0_18(l_0_11(l_0_10(R18_PC141))) ~= nil and (string.find)(l_0_15, l_0_18(l_0_11(l_0_10(R18_PC141))), 1, true) then
              if l_0_24 then
                (mp.set_mpattribute)("MpInternal_researchdata=WCS=" .. tostring(l_0_24))
              end
              return mp.INFECTED
            end
          end
        end
      end
      do return mp.CLEAN end
      -- DECOMPILER ERROR: 19 unprocessed JMP targets
    end
  end
end

