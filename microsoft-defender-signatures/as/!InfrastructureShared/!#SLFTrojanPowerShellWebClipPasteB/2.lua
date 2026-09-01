-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellWebClipPasteB\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 == nil or l_0_1 < 16 or l_0_1 > 8192 then
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
  if #l_0_4 < 16 or #l_0_4 > 8192 then
    return mp.CLEAN
  end
  local l_0_7 = (string.lower)(l_0_4)
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC132: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC133: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R9 in 'AssignReg'

  if not ("iex")("invoke-expression", "invoke-command") then
    return mp.CLEAN
  end
  local l_0_9 = GetRollingQueue("IsClickFixCMD")
  if l_0_9 == nil or type(l_0_9) ~= "table" or #l_0_9 == 0 then
    return mp.CLEAN
  end
  local l_0_10 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil or l_1_0 == "" then
    return ""
  end
  l_1_0 = (string.gsub)(l_1_0, "%^", "")
  l_1_0 = (string.gsub)(l_1_0, "`", "")
  do
    if (string.find)(l_1_0, "%", 1, true) then
      local l_1_1, l_1_2 = pcall(mp.ContextualExpandEnvironmentVariables, l_1_0)
      if l_1_1 and type(l_1_2) == "string" and l_1_2 ~= "" then
        l_1_0 = l_1_2
      end
    end
    l_1_0 = (string.lower)(l_1_0)
    l_1_0 = (string.gsub)(l_1_0, "%s+", " ")
    l_1_0 = (string.gsub)(l_1_0, "^ ", "")
    l_1_0 = (string.gsub)(l_1_0, " $", "")
    return l_1_0
  end
end

  local l_0_11 = function(l_2_0)
  -- function num : 0_1
  local l_2_1, l_2_6, l_2_7, l_2_8, l_2_9, l_2_10, l_2_11, l_2_12, l_2_13 = nil
  for l_2_5 in (string.gmatch)(l_2_0, "%S+") do
    local l_2_2 = nil
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC12: Confused about usage of register: R5 in 'UnsetPending'

    if l_2_2 == nil or #l_2_2 < #l_2_9 then
      l_2_2 = l_2_9
    end
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  if l_2_2 == nil or #l_2_2 < 24 then
    return nil
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  if #l_2_2 >= 32 then
    return l_2_2
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  if (string.find)(l_2_2, "://", 1, true) then
    return l_2_2
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  if (string.find)(l_2_2, "\\", 1, true) then
    return l_2_2
  end
  return nil
end

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R11 in 'AssignReg'

  local l_0_12 = ("iwr")("invoke-webrequest")
  if #l_0_12 < 16 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC169: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R12 in 'AssignReg'

  local l_0_13, l_0_14, l_0_15 = nil, "irm", "invoke-restmethod"
  -- DECOMPILER ERROR at PC170: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC171: Overwrote pending register: R15 in 'AssignReg'

  for l_0_19,l_0_20 in ("downloadstring")("downloadfile") do
    -- DECOMPILER ERROR at PC174: Overwrote pending register: R19 in 'AssignReg'

    local l_0_21 = "-encodedcommand"
    -- DECOMPILER ERROR at PC175: Overwrote pending register: R20 in 'AssignReg'

    -- DECOMPILER ERROR at PC176: Overwrote pending register: R21 in 'AssignReg'

    if ("-enc ")("-usebasicparsing") == "string" and #l_0_21 >= 16 then
      local l_0_22 = l_0_10(l_0_21)
      -- DECOMPILER ERROR at PC191: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC192: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC193: Overwrote pending register: R24 in 'AssignReg'

      if #l_0_22 >= 24 and (string.find)("start-bitstransfer", "start-process", "bitsadmin", true) then
        break
      end
      -- DECOMPILER ERROR at PC218: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC219: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC220: Overwrote pending register: R11 in 'AssignReg'

      if #l_0_12 >= 24 and (string.find)(l_0_22, l_0_12, 1, true) then
        break
      end
      do
        do
          local l_0_23 = l_0_11(l_0_22)
          -- DECOMPILER ERROR at PC238: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC239: Overwrote pending register: R12 in 'AssignReg'

          -- DECOMPILER ERROR at PC240: Overwrote pending register: R11 in 'AssignReg'

          if l_0_23 ~= nil and (string.find)(l_0_12, l_0_23, 1, true) then
            break
          end
          -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC242: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if l_0_13 == nil then
    return mp.CLEAN
  end
  local l_0_24 = nil
  local l_0_25, l_0_26 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_25 and type(l_0_26) == "string" then
    local l_0_27 = set_research_data
    local l_0_28 = "WebClipPaste_B"
    local l_0_29 = tostring(l_0_15)
    local l_0_30 = "||"
    local l_0_31 = tostring
    local l_0_33 = "||"
    do
      -- DECOMPILER ERROR at PC286: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC287: Overwrote pending register: R28 in 'AssignReg'

      l_0_27(l_0_28, l_0_29, l_0_30)
      -- DECOMPILER ERROR at PC293: Overwrote pending register: R17 in 'AssignReg'

      do return l_0_27 end
      -- DECOMPILER ERROR at PC295: freeLocal<0 in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

