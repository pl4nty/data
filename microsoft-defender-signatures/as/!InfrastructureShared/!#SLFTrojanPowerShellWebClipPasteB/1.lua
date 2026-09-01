-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellWebClipPasteB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 == nil or l_0_1 < 16 or l_0_1 > 3000 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2, l_0_3 = pcall(mp.readfile, 0, l_0_1)
;
(mp.readprotection)(true)
if not l_0_2 or type(l_0_3) ~= "string" or #l_0_3 < 16 then
  return mp.CLEAN
end
local l_0_4 = l_0_3
do
  if (string.find)((string.sub)(l_0_4, 1, 64), (string.char)(0), 1, true) then
    local l_0_5, l_0_6 = pcall(mp.utf16to8, l_0_4)
    if l_0_5 and type(l_0_6) == "string" and #l_0_6 > 0 then
      l_0_4 = l_0_6
    end
  end
  if #l_0_4 < 16 or #l_0_4 > 3000 then
    return mp.CLEAN
  end
  local l_0_7 = (string.lower)((string.gsub)(l_0_4, "[%^`]", ""))
  local l_0_8 = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5 = 1, #l_1_1 do
    if (string.find)(l_1_0, l_1_1[l_1_5], 1, true) ~= nil then
      return true
    end
  end
  return false
end

  local l_0_9 = {}
  -- DECOMPILER ERROR at PC155: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC156: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC171: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC172: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC173: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC178: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC181: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC183: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC184: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC185: Overwrote pending register: R10 in 'AssignReg'

  if not ("iex")("invoke-expression", "invoke-command") then
    return mp.CLEAN
  end
  local l_0_10 = GetRollingQueue("IsClickFixCMD")
  if l_0_10 == nil or type(l_0_10) ~= "table" or #l_0_10 == 0 then
    return mp.CLEAN
  end
  local l_0_11 = function(l_2_0)
  -- function num : 0_1
  if l_2_0 == nil or l_2_0 == "" then
    return ""
  end
  l_2_0 = (string.gsub)(l_2_0, "%^", "")
  l_2_0 = (string.gsub)(l_2_0, "`", "")
  do
    if (string.find)(l_2_0, "%", 1, true) then
      local l_2_1, l_2_2 = pcall(mp.ContextualExpandEnvironmentVariables, l_2_0)
      if l_2_1 and type(l_2_2) == "string" and l_2_2 ~= "" then
        l_2_0 = l_2_2
      end
    end
    l_2_0 = (string.lower)(l_2_0)
    l_2_0 = (string.gsub)(l_2_0, "%s+", " ")
    l_2_0 = (string.gsub)(l_2_0, "^ ", "")
    l_2_0 = (string.gsub)(l_2_0, " $", "")
    return l_2_0
  end
end

  local l_0_12 = function(l_3_0)
  -- function num : 0_2
  local l_3_1, l_3_6, l_3_7, l_3_8, l_3_9, l_3_10, l_3_11, l_3_12, l_3_13 = nil
  for l_3_5 in (string.gmatch)(l_3_0, "%S+") do
    local l_3_2 = nil
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC12: Confused about usage of register: R5 in 'UnsetPending'

    if l_3_2 == nil or #l_3_2 < #l_3_9 then
      l_3_2 = l_3_9
    end
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  if l_3_2 == nil or #l_3_2 < 24 then
    return nil
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  if #l_3_2 >= 32 then
    return l_3_2
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  if (string.find)(l_3_2, "://", 1, true) then
    return l_3_2
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  if (string.find)(l_3_2, "\\", 1, true) then
    return l_3_2
  end
  return nil
end

  -- DECOMPILER ERROR at PC210: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC211: Overwrote pending register: R12 in 'AssignReg'

  local l_0_13 = ("invoke-item")("iwr")
  if #l_0_13 < 16 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC219: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC219: Overwrote pending register: R13 in 'AssignReg'

  local l_0_14, l_0_15, l_0_16 = nil, "invoke-webrequest", "irm"
  -- DECOMPILER ERROR at PC220: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC221: Overwrote pending register: R16 in 'AssignReg'

  for l_0_20,l_0_21 in ("invoke-restmethod")("downloadstring") do
    -- DECOMPILER ERROR at PC224: Overwrote pending register: R20 in 'AssignReg'

    local l_0_22 = "webclient"
    -- DECOMPILER ERROR at PC225: Overwrote pending register: R21 in 'AssignReg'

    -- DECOMPILER ERROR at PC226: Overwrote pending register: R22 in 'AssignReg'

    if ("new-object net.")("new-object system.net") == "string" and #l_0_22 >= 16 then
      local l_0_23 = l_0_11(l_0_22)
      -- DECOMPILER ERROR at PC241: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC242: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC243: Overwrote pending register: R25 in 'AssignReg'

      if #l_0_23 >= 24 and (string.find)("start-bitstransfer", "start-process", "start-job", true) then
        break
      end
      -- DECOMPILER ERROR at PC268: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC269: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC270: Overwrote pending register: R12 in 'AssignReg'

      if #l_0_13 >= 24 and (string.find)(l_0_23, l_0_13, 1, true) then
        break
      end
      do
        do
          local l_0_24 = l_0_12(l_0_23)
          -- DECOMPILER ERROR at PC288: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC289: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC290: Overwrote pending register: R12 in 'AssignReg'

          if l_0_24 ~= nil and (string.find)(l_0_13, l_0_24, 1, true) then
            break
          end
          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if l_0_14 == nil then
    return mp.CLEAN
  end
  local l_0_25 = nil
  local l_0_26, l_0_27 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_26 and type(l_0_27) == "string" then
    local l_0_28 = set_research_data
    local l_0_29 = "WebClipPaste_B"
    local l_0_30 = tostring(l_0_16)
    local l_0_31 = "||"
    local l_0_32 = tostring
    local l_0_34 = "||"
    do
      -- DECOMPILER ERROR at PC336: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC337: Overwrote pending register: R29 in 'AssignReg'

      l_0_28(l_0_29, l_0_30, l_0_31)
      -- DECOMPILER ERROR at PC343: Overwrote pending register: R18 in 'AssignReg'

      do return l_0_28 end
      -- DECOMPILER ERROR at PC345: freeLocal<0 in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

