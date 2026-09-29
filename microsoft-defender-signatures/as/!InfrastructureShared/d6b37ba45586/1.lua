-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b37ba45586\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
local l_0_2 = ""
local l_0_3 = (mp.GetParentProcInfo)()
if l_0_3 and l_0_3.image_path then
  l_0_2 = (string.lower)(l_0_3.image_path)
end
local l_0_4 = contains
local l_0_5 = l_0_2
local l_0_6 = {}
-- DECOMPILER ERROR at PC40: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

if not l_0_4 then
  return l_0_4
end
-- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R7 in 'AssignReg'

l_0_4(l_0_5, l_0_6, ("\\mshta.exe").RelatedStringBMReport)
-- DECOMPILER ERROR at PC54: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC56: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R6 in 'AssignReg'

l_0_4(l_0_5, l_0_6, bm.RelatedStringBMReport)
-- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC64: Overwrote pending register: R8 in 'AssignReg'

l_0_4(l_0_5, l_0_6, nil, "\\wscript.exe")
-- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC70: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC71: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC72: Overwrote pending register: R6 in 'AssignReg'

if l_0_4 then
  l_0_4(l_0_5, l_0_6)
  -- DECOMPILER ERROR at PC74: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R6 in 'AssignReg'

  l_0_4(l_0_5, l_0_6)
end
-- DECOMPILER ERROR at PC79: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC80: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC81: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC84: Overwrote pending register: R9 in 'AssignReg'

l_0_4(l_0_5, l_0_6, "SMS_H", 5000, "\\cscript.exe")
-- DECOMPILER ERROR at PC86: Overwrote pending register: R4 in 'AssignReg'

l_0_4()
-- DECOMPILER ERROR at PC88: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC89: Overwrote pending register: R4 in 'AssignReg'

return l_0_4

