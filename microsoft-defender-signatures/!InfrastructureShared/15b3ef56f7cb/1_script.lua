-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b3ef56f7cb\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = (string.gsub)(l_0_1, "\"", "")
  l_0_1 = (string.gsub)(l_0_1, "\'", "")
  local l_0_2 = (string.lower)(l_0_1)
  local l_0_3 = 0
  local l_0_4 = str_count_match
  local l_0_5 = l_0_2
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC44: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

  if l_0_3 >= 2 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC60: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R5 in 'AssignReg'

  if l_0_4 then
    if l_0_4 == nil then
      return l_0_5
    end
    -- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC77: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC78: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC80: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC81: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC82: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC83: Overwrote pending register: R6 in 'AssignReg'

    local l_0_7 = {}
    -- DECOMPILER ERROR at PC86: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC87: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC88: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC89: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC90: No list found for R7 , SetList fails

    -- DECOMPILER ERROR at PC92: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC95: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC96: Overwrote pending register: R5 in 'AssignReg'

    if l_0_3 >= 2 then
      return l_0_5
    end
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

