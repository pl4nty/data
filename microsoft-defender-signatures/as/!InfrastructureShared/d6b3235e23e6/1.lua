-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3235e23e6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
local l_0_2 = contains
local l_0_3 = l_0_1
local l_0_4 = {}
-- DECOMPILER ERROR at PC30: No list found for R4 , SetList fails

do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC35: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC41: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

  if not l_0_2 or not l_0_3 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC50: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC53: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R7 in 'AssignReg'

  l_0_4(l_0_5, "gp hklm:", ("gp hkcu:").RelatedStringBMReport)
  -- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R8 in 'AssignReg'

  l_0_4(l_0_5, nil, nil, "gp registry::")
  -- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R5 in 'AssignReg'

  if l_0_4 then
    l_0_4(l_0_5, "h+")
    -- DECOMPILER ERROR at PC70: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC71: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC72: Overwrote pending register: R5 in 'AssignReg'

    l_0_4(l_0_5, 1)
  end
  -- DECOMPILER ERROR at PC75: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R9 in 'AssignReg'

  l_0_4(l_0_5, true, "SMS_H", 5000, "hklm:\\software")
  -- DECOMPILER ERROR at PC82: Overwrote pending register: R4 in 'AssignReg'

  l_0_4()
  -- DECOMPILER ERROR at PC84: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R4 in 'AssignReg'

  do return l_0_4 end
  -- WARNING: undefined locals caused missing assignments!
end

