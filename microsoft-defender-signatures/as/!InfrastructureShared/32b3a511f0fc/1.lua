-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3a511f0fc\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).utf8p1
if not (sysio.IsFileExists)(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (sysio.GetFileSize)(l_0_0)
if l_0_1 == nil or l_0_1 < 10 or l_0_1 > 5120000 then
  return mp.CLEAN
end
local l_0_2 = table.concat
local l_0_3 = {}
-- DECOMPILER ERROR at PC54: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC55: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R3 in 'AssignReg'

local l_0_4 = {}
-- DECOMPILER ERROR at PC60: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC61: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC64: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC65: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC66: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC67: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC68: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC71: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC72: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC75: Overwrote pending register: R4 in 'AssignReg'

local l_0_5 = {}
-- DECOMPILER ERROR at PC77: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC79: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC80: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC81: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC82: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC83: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC84: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC85: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC90: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC91: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC94: Overwrote pending register: R5 in 'AssignReg'

local l_0_6 = {}
-- DECOMPILER ERROR at PC96: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC97: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC98: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC99: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC100: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC101: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC102: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC103: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC104: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC105: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC106: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC107: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC108: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC111: Overwrote pending register: R6 in 'AssignReg'

local l_0_7 = nil
-- DECOMPILER ERROR at PC116: Overwrote pending register: R8 in 'AssignReg'

if not l_0_6 then
  return ("GROUP_CONCAT(json_extract(tool.value, \'$.name\'), \', \') AS tool_names").CLEAN
end
local l_0_8 = {}
-- DECOMPILER ERROR at PC120: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC122: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC123: Overwrote pending register: R11 in 'AssignReg'

local l_0_9, l_0_10 = (("FROM ItemTable t").query)("JOIN json_each(json_extract(t.value, \'$.serverTools\')) AS s", "LEFT JOIN json_each(json_extract(s.value, \'$[1].tools\')) AS tool")
-- DECOMPILER ERROR at PC128: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC136: Overwrote pending register: R13 in 'AssignReg'

if l_0_9 and next("WHERE t.key = \'mcpToolCache\'") then
  local l_0_11, l_0_12 = (sqlite.query)(l_0_6, "GROUP BY config_key, server_name;")
  -- DECOMPILER ERROR at PC141: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC149: Overwrote pending register: R15 in 'AssignReg'

  if l_0_11 and next("\'chat.currentLanguageModel.panel\'") then
    local l_0_13, l_0_14 = (sqlite.query)(l_0_6, ");")
    -- DECOMPILER ERROR at PC154: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC162: Overwrote pending register: R17 in 'AssignReg'

    if l_0_13 and next("FROM ItemTable t") then
      local l_0_15, l_0_16 = (sqlite.query)(l_0_6, "WHERE t.key = \'RooVeterinaryInc.roo-cline\'")
      -- DECOMPILER ERROR at PC167: Overwrote pending register: R18 in 'AssignReg'

      if l_0_15 and next("AND json_valid(t.value);") then
        l_0_8.cursor_models = l_0_15
      end
      if not next(l_0_8) then
        return mp.CLEAN
      end
      local l_0_17 = safeJsonSerialize(l_0_8, 260)
      if not l_0_17 then
        return mp.CLEAN
      end
      ;
      (bm.set_detection_string)(l_0_17)
      return mp.INFECTED
    end
  end
end

