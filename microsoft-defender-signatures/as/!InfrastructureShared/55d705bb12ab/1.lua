-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55d705bb12ab\1.luac 

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
local l_0_2 = GetRollingQueueKeys("IsClickFixCMD_Malicious")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = function(l_1_0)
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

local l_0_4 = function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_2 = pcall(MpCommon.CommandLineToArgv, l_2_0)
  if not l_2_1 or type(l_2_2) ~= "table" then
    return nil
  end
  return l_2_2
end

local l_0_5 = l_0_4(l_0_1)
if l_0_5 == nil or #l_0_5 < 2 then
  return mp.CLEAN
end
local l_0_6 = l_0_3(l_0_1)
do
  if not l_0_4(l_0_6) then
    local l_0_7 = {}
  end
  local l_0_8 = nil
  local l_0_9 = function(l_3_0, l_3_1)
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

  local l_0_10 = function(l_4_0)
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

  do
    local l_0_12 = {monster = true, cfd = true, top = true, club = true, online = true}
    for l_0_16,l_0_17 in ipairs(l_0_2) do
      local l_0_13, l_0_14 = function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_11
  if type(l_5_0) ~= "string" then
    return false
  end
  do
    local l_5_1 = (string.match)((string.lower)(l_5_0), "^https?://[%w%.%-]+%.([a-z]+)/%?")
    do return l_5_1 ~= nil and l_0_11[l_5_1] == true end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end
, nil
      -- DECOMPILER ERROR at PC72: Confused about usage of register: R17 in 'UnsetPending'

      if type(R17_PC72) == "string" and R17_PC72 ~= "" and l_0_13(GetRollingQueueKeyValue("IsClickFixCMD_Malicious", R17_PC72)) then
        if l_0_9(l_0_4(R17_PC72), l_0_5) then
          l_0_14 = GetRollingQueueKeyValue("IsClickFixCMD_Malicious", R17_PC72)
          break
        end
        if l_0_9(l_0_4(l_0_3(R17_PC72)), l_0_8) then
          l_0_14 = GetRollingQueueKeyValue("IsClickFixCMD_Malicious", R17_PC72)
          break
        end
        if l_0_4(l_0_3(R17_PC72)) ~= nil then
          local l_0_20 = nil
          if l_0_10(l_0_4(l_0_3(R17_PC72))) ~= nil and (string.find)(l_0_6, l_0_10(l_0_4(l_0_3(R17_PC72))), 1, true) then
            do
              do
                l_0_14 = l_0_20
                do break end
                -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    -- DECOMPILER ERROR at PC130: Confused about usage of register: R12 in 'UnsetPending'

    if l_0_14 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (mp.set_mpattribute)("MpInternal_researchdata=WCS=" .. l_0_14)
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC144: freeLocal<0 in 'ReleaseLocals'

  end
end

